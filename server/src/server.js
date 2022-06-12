const app = require('./app.js');

const port = app.get('port');

//Activar el servidor
app.listen(port, () => {
    console.log('Server is running on port ', port);
});