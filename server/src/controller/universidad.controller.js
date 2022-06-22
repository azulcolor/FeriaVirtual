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
  if (isNaN(req.params.id)) {
    res.status(400).send({
      message: "El id debe ser un numero"
    });
  } else {
    Universidad.getById(req.params.id, (err, data) => {
      if (err) {
        res.status(500).send({
          message: "Ocurrio un error al obtener los datos de la universidad"
        });
      } else {
        res.send(data);
      }
    });
  }
};

exports.getOfertaEducativa = (req, res) => {
  if (isNaN(req.params.id)) {
    res.status(400).send({
      message: "El id debe ser un numero"
    });
  } else {
    Universidad.getOfertaEducativa(req.params.id, (err, data) => {
      if (err) {
        res.status(500).send({
          message: "Ocurrio un error al obtener al oferta educativa de la universidad"
        });
      } else {
        res.send(data);
      }
    });
  }
  
}

exports.getMultimedia = (req, res) => {
  if (isNaN(req.params.id)) {
    res.status(400).send({
      message: "El id debe ser un numero"
    });
  } else {
    Universidad.getMultimedia(req.params.id, (err, data) => {
      if (err) {
        res.status(500).send({
          message: "Ocurrio un error al obtener los recursos multimedia"
        });
      } else {
        res.send(data);
      }
    });
  }
}

exports.getDireccion = (req, res) => {
  if (isNaN(req.params.id)) {
    res.status(400).send({
      message: "El id debe ser un numero"
    });
  } else {
    Universidad.getDireccion(req.params.id, (err, data) => {
      if (err) {
        res.status(500).send({
          message: "Ocurrio un error al obtener la ubicación"
        });
      } else {
        res.send(data);
      }
    });
  }
}

exports.getUrlMaps = (req, res) => {
  if(isNaN(req.params.id)){
    res.status(400).send({
      message: "El id debe ser un numero"
    });
  } else {
    Universidad.getUbicacion(req.params.id, (err, data) => {
      if (err) {
        res.status(500).send({
          message: "Ocurrio un error al obtener la ubicación"
        });
      } else {
        res.send(data);
      }
    });
  }
}