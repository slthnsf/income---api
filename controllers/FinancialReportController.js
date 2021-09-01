const { db, dbQuery } = require('../config')

module.exports = {
    GetIncome: async (req, res, next) => {
        try {
            if (req.user.idrole === 1) {
                let queryIncome = `Select date_transaction AS date, SUM(subtotal_harga_jual - subtotal_harga_beli) as income
                FROM tb_transaction GROUP BY DATE(date) ORDER BY date;`
                let queryTotalIncome = `Select SUM(subtotal_harga_jual - subtotal_harga_beli) as total_income FROM tb_transaction;`
                let queryCurrentMonthIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE MONTH(date_transaction)=MONTH(curdate());`
                let queryCurrentDateIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE DATE(date_transaction)=curdate();`
                let total = await dbQuery(queryTotalIncome)
                let month = await dbQuery(queryCurrentMonthIncome)
                let day = await dbQuery(queryCurrentDateIncome)
                let data = await dbQuery(queryIncome)
                res.status(200).send({ total: total[0].total_income, month: month[0].income, day: day[0].income, data: data })
            } else {
                res.status(400).send({ message: "Must be admin" })
            }
        } catch (error) {
            next(error)
        }
    },

    GetExpenses: async (req, res, next) => {
        try {
            if (req.user.idrole === 1) {
                let queryExpenses = `Select Sum(total) as expenses from tb_restock_product;`
                let queryDataExpense = `Select date AS date, total as expenses
                FROM tb_restock_product GROUP BY DATE(date) ORDER BY date;`
                let queryCurrentMonthExpense = `SELECT SUM(total) as expenses FROM tb_restock_product WHERE MONTH(date)=MONTH(curdate());`
                let queryCurrentDateExpense = `SELECT SUM(total) as expenses FROM tb_restock_product WHERE DATE(date)=curdate();`
                let dataExpense = await dbQuery(queryDataExpense)
                let expenses = await dbQuery(queryExpenses)
                let month = await dbQuery(queryCurrentMonthExpense)
                let day = await dbQuery(queryCurrentDateExpense)
                res.status(200).send({ expenses: expenses[0].expenses, month: month[0].expenses, day: day[0].expenses, data: dataExpense })
            } else {
                res.status(400).send({ message: "Must be admin" })
            }
        } catch (error) {
            next(error)
        }
    }
}