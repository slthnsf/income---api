const { db, dbQuery, createToken } = require('../config')

module.exports = {
    Login: async (req, res, next) => {
        try {
            if (req.body.email && req.body.password){
                let loginSQL = `Select * from tb_user where email = ${db.escape(req.body.email)} and password = ${db.escape(req.body.password)};`
                loginSQL = await dbQuery(loginSQL)

                let getUser = await dbQuery(`Select * from tb_user where iduser = ${loginSQL[0].iduser}`)
                let { iduser, username, fullname, email, password, idstatus, idrole, otp } = getUser[0]

                //TOKEN
                let token = createToken({ iduser, username, fullname, email, password, idstatus, idrole, otp })
                res.status(200).send({ iduser, username, fullname, email, password, idstatus, idrole, otp, token})
            } else {
                res.status(404).send({ message: "Input Email and Password" })
            }
        } catch (error) {
            next(error)
        }
    },

    KeepLogin: async (req, res, next) => {
        try {
            if (req.user.iduser) {
                let getUser = `Select * from tb_user where iduser =${db.escape(req.user.iduser)};`
                getUser = await dbQuery(getUser)
                let { iduser, username, fullname, email, password, idstatus, idrole, otp } = getUser[0]
                //TOKEN
                let token = createToken({ iduser, username, fullname, email, password, idstatus, idrole, otp })
                res.status(200).send({ iduser, username, fullname, email, password, idstatus, idrole, otp, token })
            } else {
                res.status(404).send({ message: "Account Not Found, Login First" })
            }
        } catch (error) {
            next(error)
        }
    },
}