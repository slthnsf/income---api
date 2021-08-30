const express = require('express')
const router = express.Router()
const { readToken } = require('../config')
const { UserController } = require('../controllers')

router.post('/login', UserController.Login)
router.post('/keep', readToken, UserController.KeepLogin)

module.exports = router