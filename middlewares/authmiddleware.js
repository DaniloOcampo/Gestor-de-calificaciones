const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
    const token = req.headers['authorization'];
    if (!token) {
        return res.status(401).json({ error: 'Acceso denegado. No se proporcionó token.' });
    }

    try {
        const verified = jwt.verify(token, 'SECRET_KEY'); // Cambia esto por tu clave secreta
        req.user = verified;
        next();
    } catch (err) {
        res.status(400).json({ error: 'Token no válido.' });
    }
};
