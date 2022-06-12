const mysql = require("mysql");
const dbConfig = require("../config/keys.config");
// Se crea la conexion a la base de datos
//con los datos definidos en el archivo db.config.js
const pool = mysql.createConnection({
  host: dbConfig.HOST,
  user: dbConfig.USER,
  password: dbConfig.PASSWORD,
  database: dbConfig.DB
});
// Abrir la conexión
pool.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the database.");
});
module.exports = pool;