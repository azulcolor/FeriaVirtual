const userController = require('../controller/users.controller');

const { createUserSchema, updateUserSchema } = require('../schemas/users.schema');
const validateData = require('../middlewares/HandleValidator');

var router = require("express").Router();

router.post("/", validateData(createUserSchema), 
userController.checkDuplicateEmail,
userController.registrarUsuario);
router.post("/login", userController.login);

module.exports = router;