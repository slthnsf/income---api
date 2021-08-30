const { db, dbQuery } = require('../config')

module.exports = {
    GetIncome: async (req, res, next) => {
        try {
            if (req.user.idrole === 1) {
                let queryIncome, queryTopProductIncome = ``
                if (req.query.from && req.query.to) {
                    queryIncome = `Select DATE(date_transaction) AS date, SUM(subtotal_harga_jual - subtotal_harga_beli) as income
                    FROM tb_transaction where date_transaction BETWEEN ${db.escape(req.query.from)} AND ${db.escape(req.query.to)} GROUP BY DATE(date_transaction) ORDER BY date;`
                    queryTopProductIncome = `Select td.idproduct, p.nama, SUM(subtotal_harga_jual - subtotal_harga_beli) as profit from 
                    tb_transaction t join tb_transaction_detail td ON t.idtransaction = td.idtransaction
                    join tb_product p on p.idproduct = td.idproduct WHERE date_transaction BETWEEN ${db.escape(req.query.from)} AND ${db.escape(req.query.to)}
                    GROUP BY idproduct ORDER BY profit DESC;`
                } else {
                    queryIncome = `Select DATE(date_transaction) AS date, SUM(subtotal_harga_jual - subtotal_harga_beli) as income
                    FROM tb_transaction GROUP BY DATE(date_transaction) ORDER BY date;`
                    queryTopProductIncome = `Select td.idproduct, p.nama, SUM(subtotal_harga_jual - subtotal_harga_beli) as profit from 
                    tb_transaction t join tb_transaction_detail td ON t.idtransaction = td.idtransaction
                    join tb_product p on p.idproduct = td.idproduct
                    GROUP BY idproduct ORDER BY profit DESC;`
                }
                let queryTotalIncome = `Select SUM(subtotal_harga_jual - subtotal_harga_beli) as total_income FROM tb_transaction;`
                let queryCurrentMonthIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE MONTH(date_transaction)=MONTH(curdate());`
                let queryCurrentDateIncome = `SELECT SUM(subtotal_harga_jual - subtotal_harga_beli) as income FROM tb_transaction WHERE DATE(date_transaction)=curdate();`
                let queryFilteredIncome = `SELECT SUM(subtotal_parcel - subtotal_product) as income FROM transaction WHERE date_transaction BETWEEN ${db.escape(req.query.from)} AND ${db.escape(req.query.to)}`
                let total = await dbQuery(queryTotalIncome)
                let month = await dbQuery(queryCurrentMonthIncome)
                let day = await dbQuery(queryCurrentDateIncome)
                let filtered = await dbQuery(queryFilteredIncome)
                let data = await dbQuery(queryIncome)
                let topProduct = await dbQuery(queryTopProductIncome)
                res.status(200).send({total: total[0].total_income, month: month[0].income, day: day[0].income, filtered: filtered[0].income, data: data, top: topProduct})
            } else {
                res.status(400).send({ message: "Must be admin" })
            }
        } catch (error) {
            next(error)
        }
    }
}