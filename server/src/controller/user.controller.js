const Users = require('../model/user.model');

exports.registrarUsuario = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "No puede estar vacio"
        });
    }
    const {
        Nombre,
        Apellido_P,
        Apellido_M,
        Correo_Electronico,
        Telefono,
        Motivo,
        Escuela,
        Area_ID,
    } = req.body;

    const user = new Users({ 
        Nombre: Nombre,
        Apellido_P: Apellido_P,
        Apellido_M: Apellido_M,
        Correo_Electronico: Correo_Electronico,
        Telefono: Telefono,
        Motivo: Motivo,
        Escuela: Escuela,
        Area_ID: Area_ID,
    });

    Users.create(user, (err, data) => {
        if (err) {
            res.status(500).send({
                message: err.message || "Error al crear el usuario"
            });
        } else {
            res.send(data);
        }
    });
console.log(user);


}