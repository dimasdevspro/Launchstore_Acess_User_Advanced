const { Pool } = require('pg')

module.exports = new Pool({
    user:'postgres',
    password:"magus369",
    host: "localhost",
    port: 5432,
    database:"launchstore"
})