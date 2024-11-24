const db = require('../config/db_config');

const Usuario = {
    getAll: async () => {
        const [rows] = await db.query('SELECT * FROM Usuarios');
        return rows;
    },

    create: async (nombre, email, contraseña, rol) => {
        const [result] = await db.query(
            'INSERT INTO Usuarios (nombre, email, contraseña, rol) VALUES (?, ?, ?, ?)',
            [nombre, email, contraseña, rol]
        );
        return result.insertId;
    },

    update: async (id, nombre, email, contraseña, rol) => {
        const [result] = await db.query(
            'UPDATE Usuarios SET nombre = ?, email = ?, contraseña = ?, rol = ? WHERE id = ?',
            [nombre, email, contraseña, rol, id]
        );
        return result.affectedRows;
    },

    delete: async (id) => {
        const [result] = await db.query('DELETE FROM Usuarios WHERE id = ?', [id]);
        return result.affectedRows;
    },
};

module.exports = Usuario;
