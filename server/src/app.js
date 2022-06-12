const express = require('express');
const cors = require('cors');
const routerApi = require('./routes/index');
const morgan = require('morgan');

const pkg = require("../package.json");

//Inicialitazations
const app = express();

//Settings
app.set("pkg", pkg);
app.set('port', process.env.PORT || 4000); //Puerto del servidor

//Middleweres
app.use(express.json()); //* Se configura express, para utilizar JSON
app.use(express.urlencoded({ extended: false }));
app.use(morgan('dev'));
app.use(cors());

//Routes
routerApi(app);

module.exports = app;
