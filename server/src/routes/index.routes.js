
const universidadRouter = require('./universidad.routes');
const testVocacionalRouter = require('./testVocacional.routes');
const userRouter = require('./usuarios.routes');
const authRouter = require('./auth.routes');

function routerApi(app) {
    app.use('/v1/testvocacional', testVocacionalRouter);
    app.use('/v1/universidad', universidadRouter);
    app.use('/v1/usuarios', userRouter);
    app.use('v1/auth', authRouter)
}

module.exports = routerApi;