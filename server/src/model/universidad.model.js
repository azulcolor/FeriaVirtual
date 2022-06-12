const pool = require('./connectDatabase');

const Universidad = function () {

}

Universidad.getAll = (result) => {
    let query = "SELECT universidad.ID, universidad.Nombre, universidad.Ruta_Escudo, IF(universidad.Tipo=0,'Publica','Privada') AS Tipo, COUNT(IF(nivel_educativo.Nombre='LICENCIATURA',1, NULL))AS LICENCIATURA, COUNT(IF(nivel_educativo.Nombre='MAESTR&IACUTE;A',1, NULL))AS MAESTRIA, COUNT(IF(nivel_educativo.Nombre='DOCTORADO',1, NULL))AS DOCTORADO FROM universidad INNER JOIN carrera ON universidad.ID = carrera.Universidad_ID INNER JOIN nivel_educativo ON carrera.Nivel_Educativo_ID = nivel_educativo.ID GROUP BY universidad.Nombre";
    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
          }
          result(null, res);
    });
}

module.exports = Universidad;