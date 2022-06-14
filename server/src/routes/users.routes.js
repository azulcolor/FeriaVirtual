const userController = require('../controller/users.controller');

var router = require("express").Router();

router.post("/", userController.registrarUsuario);
router.post("/login", userController.login);

module.exports = router;