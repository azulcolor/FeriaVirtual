const pool = require('./connectDatabase');

const Universidad = function () {

}

Universidad.getAll = (result) => {
    let query = "SELECT universidad.ID AS Universidad_ID, universidad.Nombre, universidad.Ruta_Escudo, IF(universidad.Tipo=0,'Publica','Privada') AS Tipo, COUNT(IF(nivel_educativo.Nombre='LICENCIATURA',1, NULL)) AS LICENCIATURA, COUNT(IF(nivel_educativo.Nombre='MAESTR&IACUTE;A',1, NULL)) AS MAESTRIA, COUNT(IF(nivel_educativo.Nombre='DOCTORADO',1, NULL)) AS DOCTORADO FROM universidad INNER JOIN carrera ON universidad.ID = carrera.Universidad_ID INNER JOIN nivel_educativo ON carrera.Nivel_Educativo_ID = nivel_educativo.ID GROUP BY universidad.Nombre";
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
                Universidad_ID: id,
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
    });
}

Universidad.getMultimedia = (id, result) => {

    getFotos(id, (err, linksFotos) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        getVideos(id, (err, linksVideos) => {
            if(err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }
            const data = {
                linksFotos,
                linksVideos
            }

            result(null, data);
        });
    });

}

Universidad.getDireccion = (id, result) => {
    let query = `SELECT ubicacion.Universidad_ID, ubicacion.Num_Interior, ubicacion.Num_Exterior, ubicacion.Calle, ubicacion.Colonia, estado.Nombre AS estado, municipio.Nombre, ubicacion.Ciudad, ubicacion.Codigo_Postal FROM ubicacion INNER JOIN municipio ON ubicacion.Municipio_ID = municipio.ID INNER JOIN estado ON municipio.Estado_ID = estado.ID WHERE ubicacion.Universidad_ID = ${id}`;

    pool.query(query, (err, res) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        console.log(res[0]);
        const direccion = res[0].Num_Interior + " " + res[0].Num_Exterior + " " + res[0].Calle + " " + res[0].Colonia + " " + res[0].estado + " " + res[0].Nombre + " " + res[0].Ciudad + " " + res[0].Codigo_Postal ;
        
        const Direccion = {
            Universidad_ID: res[0].Universidad_ID,
            direccion
        }

        result(null, Direccion);
    });
}

getFotos = (id, result) => {
    let queryFoto = `SELECT foto.Universidad_ID, foto.Titulo, foto.Recurso FROM foto WHERE foto.Universidad_ID = ${id}`;

    pool.query(queryFoto, (err, res) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
}

getVideos = (id, result) => {
    const urlYoutube = "https://www.youtube.com/watch?v=";

    let queryVideo = `SELECT video.Universidad_ID, video.ID, video.Titulo, video.Recurso FROM video WHERE video.Universidad_ID = ${id}`;

    pool.query(queryVideo, (err, res) => {
        if(err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }

        const data = res.map(dataUni => {
            return {
                ...dataUni,
                Recurso: urlYoutube + dataUni.Recurso
            }
        });

        result(null, data);
    });
}

module.exports = Universidad;