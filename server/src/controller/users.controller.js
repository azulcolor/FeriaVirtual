const Users = require('../model/users.model');

exports.registrarUsuario = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "No se recibieron datos"
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
        Nombre: Nombre.toUpperCase(),
        Apellido_P: Apellido_P.toUpperCase(),
        Apellido_M: Apellido_M.toUpperCase(),
        Correo_Electronico: Correo_Electronico.toUpperCase(),
        Telefono: Telefono,
        Motivo: Motivo,
        Escuela: Escuela.toUpperCase(),
        Area_ID: Area_ID,
    });

    Users.create(user, (err, data) => {
        if (err) {
            res.status(500).send({
                message: err.message || "Error al crear el usuario"
            });
        } else {
            res.status(201).send(data);
        }
    });

    

        console.log(user);


}

exports.login = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "No puede estar vacio"
        });
    }
    const email = req.body.Correo_Electronico;

    Users.checkEmail(email, (err, data) => {
        if (err) {
            res.status(500).send({
                message: err.message || "Usuario o contraseña incorrectos"
            });
        } else {
            res.status(200).send( {data, success: true});
        }
    })
}

exports.checkDuplicateEmail = (req, res, next) => {
    if (!req.body) {
        res.status(400).send({
          msg: "No puede estar vacio"
        });
    }
    const email = req.body.Correo_Electronico;
    Users.checkEmail(email, (err, datacheck) => {
        if (err) {
            res.status(500).send({
                msg: err.message || "error al crear el usuario"
            });
        } else {
            if (datacheck) {
                res.status(400).send({
                    msg: "El correo electronico ya fue registrado anteriormente"
                });
                return
            }
            next();
        }
    })
    
}