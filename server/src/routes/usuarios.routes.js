/**
 * @module UsuariosRoute
 */
const auth = require('../middlewares/auth')
const userController = require('../controller/usuarios.controller');


var router = require("express").Router();

//get user data
/**
  * Usuarios recupera los datos del usuario logueado, este se identifica por medio del req.header[x-auth-token]
  * 
  * @name UserGetData
  * @path {GET} /v1/users
  * @header {Content-Type: application/json}
  * @header {x-auth-token} Es el toquen que indica que el usuario esta logueado.
  * @auth Esta ruta requiere autenticación básica HTTP. Si la autenticación falla, devolverá un error 401.
  * @code {200} Si la solicitud es exitosa.
  * @code {401} Si el usuario no esta logueado devolvera un error 401.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Users responde con los datos del usuario.
  */
router.get('/', auth, userController.getUserData)


module.exports = router;