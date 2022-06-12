const userController = require('../controller/user.controller');

var router = require("express").Router();

router.post("/", userController.registrarUsuario);

module.exports = router;