const Universidad = require('../model/universidad.model');

exports.findAll = (req, res) => {
    Universidad.getAll((err, data) => {
        if (err)
        res.status(500).send({
          message: "Ocurrio un error al obtener los datos de las universidades"
        });
      else {
        res.send(data);
      }
    });
};

exports.findById = (req, res) => {
  Universidad.getById(req.params.id, (err, data) => {
    if (err) {
      res.status(500).send({
        message: "Ocurrio un error al obtener los datos de la universidad"
      });
    } else {
      res.send(data);
    }
  });
};

exports.getOfertaEducativa = (req, res) => {
  Universidad.getOfertaEducativa(req.params.id, (err, data) => {
    if(err){
      res.status(500).send({
        message: "Ocurrio un error al obtener al oferta educativa de la universidad"
      });
    } else {
      res.send(data);
    }
  });
}

exports.getMultimedia = (req, res) => {
  Universidad.getMultimedia(req.params.id, (err, data) => {
    if(err){
      res.status(500).send({
        message: "Ocurrio un error al obtener los recursos multimedia"
      });
    } else {
      res.send(data);
    }
  })
}

exports.getDireccion = (req, res) => {
  Universidad.getDireccion(req.params.id, (err, data) => {
    if(err){
      res.status(500).send({
        message: "Ocurrio un error al obtener la ubicación"
      });
    } else {
      res.send(data);
    }
  });
}