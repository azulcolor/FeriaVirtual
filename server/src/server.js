//@ts-check
const express = require("express"); // Crear el servidor, manejar rutas.
const morgan = require("morgan"); // Ver los datos de las peticiones.
const cors = require("cors"); // Da acceso al consumo de la api. 

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
app.use('/v1/testvocacional', require('./routes/testVocacional.routes'));
app.use('/v1/universidad', require('./routes/universidad.routes'));

//Activar el servidor
app.listen(app.get('port'), () => {
    console.log('Server is running on port ', app.get('port'));
});