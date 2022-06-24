const auth = require('../middlewares/auth')
const userController = require('../controller/users.controller');

const { createUserSchema, updateUserSchema } = require('../schemas/users.schema');
const validateData = require('../middlewares/HandleValidator');

var router = require("express").Router();

//get user data
router.get('/', auth, userController.getUserData)
//verify token
router.post('/verifyToken', userController.verifyToken);

//create new user
router.post("/", validateData(createUserSchema), 
    userController.checkDuplicateEmail,
    userController.registrarUsuario
);

router.post("/login", userController.login);

module.exports = router;