const { db, dbQuery } = require('../config')

module.exports = {
    GetIncome: async (req, res, next) => {
        try {
            if (req.user.idrole === 1) {
                let queryIncome = `Select DATE(date_transaction) AS date, SUM(subtotal_harga_jual - subtotal_harga_beli) as income
                FROM tb_transaction GROUP BY DATE(date_transaction) ORDER BY date;`
                let queryTopProductIncome = `Select td.idproduct, p.nama, MAX(kuantity) as amount, (subtotal_harga_jual - subtotal_harga_beli) as profit from tb_transaction_detail td join tb_product p on td.idproduct = p.idproduct
                join tb_transaction t on td.idtransaction=t.idtransaction;`
                let queryModal = `Select SUM(subtotal_harga_beli) as sum_beli FROM tb_transaction;`
                let queryUserSpent = `Select SUM(subtotal_harga_jual) as user_spent FROM tb_transaction;`
                let queryTotalIncome = `Select SUM(subtotal_harga_jual - subtotal_harga_beli) as total_income FROM tb_transaction;`
                let queryCurrentMonthIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE MONTH(date_transaction)=MONTH(curdate());`
                let queryCurrentDateIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE DATE(date_transaction)=curdate();`
                let total = await dbQuery(queryTotalIncome)
                let modal = await dbQuery(queryModal)
                let userSpent = await dbQuery(queryUserSpent)
                let month = await dbQuery(queryCurrentMonthIncome)
                let day = await dbQuery(queryCurrentDateIncome)
                let data = await dbQuery(queryIncome)
                let topProduct = await dbQuery(queryTopProductIncome)
                res.status(200).send({ total: total[0].total_income, modal: modal[0].sum_beli, userSpent: userSpent[0].user_spent, month: month[0].income, day: day[0].income, data: data, top: topProduct })
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
                let expenses = await dbQuery(queryExpenses)
                res.status(200).send({ expenses: expenses[0].expenses })
            } else {
                res.status(400).send({ message: "Must be admin" })
            }
        } catch (error) {
            next(error)
        }
    }
}