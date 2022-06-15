/**
 * @module UniversidadRoute
 */

 const universidad = require('../controller/universidad.controller');

 var router = require("express").Router();
 
 /**
  * Index Universidad, obtiene los datos de la universidades
  * 
  * @name Universidades
  * @path {GET} /
  * @code {200} Si la solicitud es exitosa.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Universidades Responde con los datos de la universidades.
  */
 router.get("/", universidad.findAll);
 
 /**
  * Obtiene los datos de una universidad
  * 
  * @name Universidad
  * @path {GET} /:id
  * @params {String} id Requiere el id de la universidad para poder realizar la consulta
  * @code {200} Si las solicitud es exitosa.
  * @code Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Universidad Muestra los datos de la universidad
  */
 router.get("/:id", universidad.findById);
 
 /**
  * Obtiene los datos de una universidad
  * 
  * @name OfertaEducativa
  * @path {GET} /ofertaeducativa/:id
  * @params {String} id Requiere el id de la universidad para mostrar su oferta educativa
  * @code {200} Si las solicitud es exitosa.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} OfertaEducativa Muestra la lista de la ofertas educativas disponibles en la universidad.
  */
 router.get("/ofertaeducativa/:id", universidad.getOfertaEducativa);
 
 /**
  * Obtiene los recursos multimedia de la universidad solicitada, fotos y videos
  * 
  * @name Fotos/Videos
  * @path {GET} /multimedia/:id
  * @params {String} id Requiere el id de la universidad para mostrar los recursos multimedia
  * @code {200} Si las solicitud es exitosa.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Fotos/videos Muestra los links de los recursos
  */
 router.get("/multimedia/:id", universidad.getMultimedia);
 
 /**
  * Obtiene los datos de la dirección 
  * 
  * @name Dirección
  * @path {GET} /direccion/:id
  * @params {String} id Requiere el id de la universidad para mostrar su dirección.
  * @code {200} Si las solicitud es exitosa.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Ubicación Muestra la direccion de la universidad.
  */
 router.get("/direccion/:id", universidad.getDireccion);
 
 module.exports = router;