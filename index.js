const express = require('express')
const app = express()
const port = 2021
const cors = require('cors')
const dotenv = require('dotenv')
const bearerToken = require('express-bearer-token')

const { db } = require('./config/database')

app.use(cors()) // get data from front-end
app.use(express.json()) // get json body
app.use(bearerToken()) // read token 

app.get('/', (req, res) => {
    res.send('Hello')
})

db.getConnection((error, connection) => {
    if (error) {
        return console.error('Error connecting mysql: ', error.stack)
    }
    console.log(`Connecting to MySQL Server as ID: ${connection.threadId}`)
})

// Error handling 
app.use((error, request, response, next) => {
    console.log("Error", error)
    response.status(500).send({ status: "Error MySQL!", messages: error })
})

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
})
