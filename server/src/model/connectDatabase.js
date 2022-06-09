const mysql = require('mysql'); 

const database = require("../config/keys.config.js");

//Crea la conexión a mysql
const pool = mysql.createConnection(database);
//Conexión a la base de datos
pool.connect(err => {
    if (err) throw err;
    console.log("Successful connected to the database: " + database.db);
});

module.exports = pool;