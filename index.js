const express = require('express')
const app = express()
const port = 2021
const cors = require('cors')

app.use(cors()) // get data from front-end
app.use(express.json()) // get json body

app.get('/', (req, res) => {
    res.send('Hello')
})

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
})
