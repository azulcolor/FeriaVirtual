const Users = require('../model/usuarios.model');
const jwt = require('jsonwebtoken');

exports.signUp = (req, res) => {
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
        Area_ID
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
                error: err.message || "Error al crear el usuario"
            });
        } else {
            if (data) res.status(201).send({msg: 'Bienvenido '+data.Nombre+' ya puedes ingresar a la feria virtual'});
            else res.status(400).send({msg: 'Intentalo de nuevo más tarde.'})
        }
    });

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
                error: err.message || "El correo electronico no esta registrado"
            });
        } else {
            if (data) {
            const token = jwt.sign({ id: data.ID }, "UPQROOKey");
            res.status(200).json({ token, ...data._doc });
            } else {
                res.status(400).send({msg: "El correo electronico no esta registrado" })
            }
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
                error: err.message || "error al crear el usuario"
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

exports.verifyToken = (req, res) => {
    try {
        const token = req.header('x-auth-token');

        if (!token) return res.json(false)

        const verified = jwt.verify(token, 'UPQROOKey');

        if (!verified) return res.json(false)

        Users.findById(verified.id, (err, data) => {
            if (err)  {
                return res.json(false)
            }
            else {
                return res.json(true)
            }
        })
    } catch (err) {
        res.status(500).json(
            false //si no se puede verificar el token se manda false sencillamente
        );
    }
        
}