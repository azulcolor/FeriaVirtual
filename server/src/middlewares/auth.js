const jwt = require('jsonwebtoken');

const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res.status(401).json({ msg: 'Debe iniciar sesion' });
        }
        const verified = jwt.verify(token, 'UPQROOKey');
        if (!verified) {
            return res.status(401).json({ msg: 'Inicie sesion de nuevo' });
        }
        req.user = verified.id;
        req.token = token;
        next();
    } catch (err) {
        res.status(500).json({ msg: 'Intentalo de nuevo mas tarde' });
    }
}

module.exports = auth;