
const universidadRouter = require('./universidad.routes');
const testVocacionalRouter = require('./testVocacional.routes');
const userRouter = require('./user.routes');

function routerApi(app) {
    app.use('/v1/testvocacional', testVocacionalRouter);
    app.use('/v1/universidad', universidadRouter);
    app.use('/v1/users', userRouter);
}

module.exports = routerApi;