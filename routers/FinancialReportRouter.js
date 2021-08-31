const router = require('express').Router()
const { FinancialReportController } = require("../controllers")
const { readToken } = require('../config')

router.get('/income', readToken, FinancialReportController.GetIncome)
router.get('/expenses', readToken, FinancialReportController.GetExpenses)

module.exports = router