/**
 * @module AuthRoute
 */
 const authController = require('../controller/auth.controller');
 const { createUserSchema, updateUserSchema } = require('../schemas/users.schema');
 const validateData = require('../middlewares/HandleValidator');
 
 var router = require("express").Router();
 
 
 
 //verify token
 /**
  * VerifyToken comprueba que el toquen esta vigente y busca que el usuario exista en la base de datos.
  * 
  * @name verifyToken
  * @service {authController}
  * @path {POST} /v1/auth/verifyToken
  * @header {Content-Type: application/json}
  * @header {x-auth-token} Es el toquen que indica que el usuario esta logueado.
  * @params {headers}
  */
 router.post('/verifyToken', authController.verifyToken);
 
 //Registro
  /**
  * signup Valida los campos que coincidan con el modelo, y crea un usuario si el correo no existe.
  * 
  * @name signup
  * @service {authController}
  * @path {POST} /v1/auth/signup
  * @body {{Nombre: string, Apellido_P: string, Apellido_M: string, Correo_Electronico: string, Telefono: string, Motivo: number, Escuela: string, Area_ID:number, token:null}}
  * @code {201} Si la solicitud se completa sin fallos. 
  * @code {400} Si ocurre algun error con los datos.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Responde un mensaje de exito o de error segun el codigo de estado.
  */
 router.post("/signup", 
    validateData(createUserSchema), 
    authController.checkDuplicateEmail,
    authController.signUp
 );
 //Iniciar sesion
 /**
  * signin Valida los campos que coincidan con el modelo, y crea un usuario si el correo no existe.
  * 
  * @name signin
  * @service {authController}
  * @path {POST} /v1/auth/signin
  * @body {{Correo_Electronico: string}}
  * @code {200} Si la solicitud se completa sin fallos. 
  * @code {400} Si ocurre algun error con los datos.
  * @code {500} Si la solicitud fallo por error en la base de datos.
  * @response {JSON} Si responde 200 envia un token de autentificacion los demas un mensaje de error.
  */
 router.post("/signin", authController.login);
 
 module.exports = router;