const pool = require('./connectDatabase');

const Universidad = function () {

}

Universidad.getAll = (result) => {
    let query = "SELECT universidad.ID, universidad.Nombre, universidad.Ruta_Escudo, IF(universidad.Tipo=0,'Publica','Privada') AS Tipo, COUNT(IF(nivel_educativo.Nombre='LICENCIATURA',1, NULL)) AS LICENCIATURA, COUNT(IF(nivel_educativo.Nombre='MAESTR&IACUTE;A',1, NULL)) AS MAESTRIA, COUNT(IF(nivel_educativo.Nombre='DOCTORADO',1, NULL)) AS DOCTORADO FROM universidad INNER JOIN carrera ON universidad.ID = carrera.Universidad_ID INNER JOIN nivel_educativo ON carrera.Nivel_Educativo_ID = nivel_educativo.ID GROUP BY universidad.Nombre";
    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
          }
          result(null, res);
    });
};

Universidad.getById = (id, result) => {
    const urlYoutube = "https://www.youtube.com/watch?v=";

    let query = `SELECT universidad.Nombre, universidad.Ruta_Escudo, video.Titulo, video.Recurso FROM universidad INNER JOIN video ON universidad.ID = video.Universidad_ID WHERE video.Seccion_ID = 1 AND universidad.ID = ${id}`;

    pool.query(query, (err, res) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        
        const data = res.map(dataUni => {
            return {
                id: id,
                ...dataUni,
                Recurso: urlYoutube + dataUni.Recurso
            }
        });

        result(null, data[0]);
    });
};

Universidad.getOfertaEducativa = (id, result) => {
    let query = `SELECT carrera.Universidad_ID, carrera.ID, carrera.Nombre, carrera.Recurso FROM carrera WHERE carrera.Universidad_ID = ${id}`;

    pool.query(query, (err, res) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    })
}

module.exports = Universidad;