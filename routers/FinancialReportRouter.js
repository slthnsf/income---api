const router = require('express').Router()
const { FinancialReportController } = require("../controllers")
const { readToken } = require('../config')

router.get('/income', readToken, FinancialReportController.GetIncome)

module.exports = router