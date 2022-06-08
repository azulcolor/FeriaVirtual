//@ts-check
const express = require("express"); // Crear el servidor, manejar rutas.
const morgan = require("morgan"); // Ver los datos de las peticiones.
const cors = require("cors"); // Da acceso al consumo de la api. 

const TestVocacional = require('./model/testVocacional.model.js');

const test = new TestVocacional;
test.calcularCentil({
    puntajeAireLibre: 3,
    puntajeMecanica: 3,
    puntajeCalculo: 3,
    puntajeCiencia: 3,
    puntajePersuasiva: 3,
    puntajeArtes: 3,
    puntajeLinguistica: 3,
    puntajeMusica: 3,
    puntajeSocial: 3,
    puntajeAdministrativa: 59
}, 1, '0');



//Inicialitazations
const app = express();

//Settings
app.set('port', process.env.PORT || 4000); //Puerto del servidor

//Middleweres
app.use(express.json()); //* Se configura express, para utilizar JSON
app.use(express.urlencoded({ extended: false }));
app.use(morgan('dev'));
app.use(cors());

//Routes

//Activar el servidor
app.listen(app.get('port'), () => {
    console.log('Server is running on port ', app.get('port'));
});