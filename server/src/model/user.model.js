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


Users.create = (newUser, result) => {
    pool.query('INSERT INTO registrado SET ?', newUser, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        }
        console.log('Se ha creado un nuevo usuario');
        result(null, { id: res.insertId, ...newUser });
    });
}

module.exports = Users;