const Universidad = require('../model/universidad.model');

exports.findAll = (req, res) => {
    Universidad.getAll((err, data) => {
        if (err)
        res.status(500).send({
          message:
            err.message || "Ocurrio un error al obtener la universidades"
        });
      else {
        res.send(data);
      }
    })


}