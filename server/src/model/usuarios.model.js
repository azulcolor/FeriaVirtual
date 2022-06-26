/**
 * @module UsersModel
 */
const pool = require('./connectDatabase');

const Users = function(user) {
    this.Nombre = user.Nombre;
    this.Apellido_P = user.Apellido_P;
    this.Apellido_M = user.Apellido_M;
    this.Correo_Electronico = user.Correo_Electronico;
    this.Telefono = user.Telefono;
    this.Motivo = user.Motivo;
    this.Escuela = user.Escuela;
    this.Area_ID = user.Area_ID;
}

/**
 * Crea un nuevo usuario.
 * @function  create
 * @param {callback} result Maneja el error valida los campos, si esta es exitosa crea un nuevo usuario.
 */
Users.create = (newUser, result) => {
    pool.query('INSERT INTO registrado SET ?', newUser, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newUser });
    });
}
/**
 * Verifica si el usuario esta registrado en la base de datos.
 * @function  checkEmail
 * @param {callback} result Maneja el error y la respuesta, si esta es exitosa.
 */
Users.checkEmail = (email, result) => {
    pool.query(`SELECT * FROM registrado WHERE Correo_Electronico = '${email}' LIMIT 1`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        }
        if (res.length>0) {
                result(null, res[0]);
                return;
        } else {
            result(null, false);
        }
    });
}

/**
 * Verifica si el ID del usuario, segun el token esta registrado.
 * @function  findById
 * @param {string} ID Id del usuario (proporcionado por el token).
 * @param {callback} result Maneja el error y la respuesta, si esta es exitosa (true o false).
 */
Users.findById = (id, result) => {
    pool.query(`SELECT * FROM registrado WHERE ID='${id}'`,
    (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        }
            console.log(res);
        if (res.length>0) {
            result(null, true);
            return;
        }
    })

}
/**
 * Obtiene la lista de universidades con sus datos mas relevantes.
 * @function  findByIdGet
 * @param {string} id ID del usuario proporcionado por el token.
 * @param {callback} result Maneja el error y la respuesta, si esta es exitosa.
 */
Users.findByIdGet = (id, result) => {
    pool.query(`SELECT * FROM registrado WHERE ID='${id}'`,
    (err, res) => {
        if (err) {
            result(err, null);
        } else {
            result(null, res[0]);
        }
    })
}
module.exports = Users;