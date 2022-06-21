/**
 * @module UniversidadModel
 */
const pool = require('./connectDatabase');

const Universidad = function () {

}

/**
 * Obtiene la lista de universidades con sus datos mas relevantes.
 * @function  getAll
 * @param {callback} result Maneja el error y la respuesta, si esta es exitosa.
 */
Universidad.getAll = (result) => {
    let query = "SELECT universidad.ID AS Universidad_ID, universidad.Nombre, universidad.Ruta_Escudo, IF(universidad.Tipo=0,'Publica','Privada') AS Tipo, COUNT(IF(nivel_educativo.Nombre='LICENCIATURA',1, NULL)) AS LICENCIATURA, COUNT(IF(nivel_educativo.Nombre='MAESTR&IACUTE;A',1, NULL)) AS MAESTRIA, COUNT(IF(nivel_educativo.Nombre='DOCTORADO',1, NULL)) AS DOCTORADO FROM universidad INNER JOIN carrera ON universidad.ID = carrera.Universidad_ID INNER JOIN nivel_educativo ON carrera.Nivel_Educativo_ID = nivel_educativo.ID GROUP BY universidad.Nombre";
    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, { message: "Ocurrio un error al obtener las universidades" });
            return;
        }
        result(null, res);
    });
};

/**
 * Se encarga de consultar los datos de una universidad especifica y responder tales datos.
 * @function getById
 * @param {strinf} id Id de la universidad, la cual se quiera obtener sus datos.
 * @param {callback} result Maneja los errores y responde, si todo va bien.
 */
Universidad.getById = (id, result) => {
    const urlYoutube = "https://www.youtube.com/watch?v=";

    let query = `SELECT universidad.Nombre, universidad.Ruta_Escudo, video.Titulo, video.Recurso FROM universidad INNER JOIN video ON universidad.ID = video.Universidad_ID WHERE video.Seccion_ID = 1 AND universidad.ID = ${id}`;

    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result({ message: "Ocurrio un error al obtener los datos de la universidad" }, null);
            return;
        }

        if(Object.entries(res).length === 0){
            result({ message: "No existe el id en la base de datos" }, null);
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

/**
 * @function getOfertaEducativa Se encarga de consultar a la base de datos, la oferta educativa de la universidad.
 * @param {string} id Id de la universidad la cual se requiera su oferta educatica.
 * @param {callback} result Maneja los errores posibles y responde los datos solicitados.
 */
Universidad.getOfertaEducativa = (id, result) => {
    let query = `SELECT carrera.Universidad_ID, carrera.ID, carrera.Nombre, carrera.Recurso FROM carrera WHERE carrera.Universidad_ID = ${id}`;

    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, { message: "Ocurrio un error al obtener la oferta educativa de la universidad" });
            return;
        }
        result(null, res);
    });
}

/**
 * Obtiene llos recursos multimedia Fotos y videos de la universidad requerida.
 * @function getMultimedia
 * @param {string} id Id de la universidad.
 * @param {callback} result  Responde los errores, si los hay y la respuesta.
 */
Universidad.getMultimedia = (id, result) => {

    getFotos(id, (err, linksFotos) => {
        if (err) {
            console.log("error: ", err);
            result(null, {
                message: "Ocurrio un error al obtener los links de las fotos"
            });
            return;
        }
        getVideos(id, (err, linksVideos) => {
            if (err) {
                console.log("error: ", err);
                result(null, { message: "Ocurrio un error al obtener los links de las videos" });
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

/**
 * la función retorna la dirección de la universidad solicitada, en un formato string
 * @function getDireccion 
 * @param {string} id Id de la universidad de la cual se quiere obtener la direción.
 * @param {callback} result Responde si hay un error en la consulta a la base de datos y responde la dirección de la universidad solicitada
 */
Universidad.getDireccion = (id, result) => {
    let query = `SELECT ubicacion.Universidad_ID, ubicacion.Num_Interior, ubicacion.Num_Exterior, ubicacion.Calle, ubicacion.Colonia, estado.Nombre AS estado, municipio.Nombre, ubicacion.Ciudad, ubicacion.Codigo_Postal FROM ubicacion INNER JOIN municipio ON ubicacion.Municipio_ID = municipio.ID INNER JOIN estado ON municipio.Estado_ID = estado.ID WHERE ubicacion.Universidad_ID = ${id}`;

    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, {
                message: "Ocurrio un error al obtener la dirección"
            });
            return;
        }

        const direccion = res[0].Num_Interior + " " + res[0].Num_Exterior + " " + res[0].Calle + " " + res[0].Colonia + " " + res[0].estado + " " + res[0].Nombre + " " + res[0].Ciudad + " " + res[0].Codigo_Postal;

        const Direccion = {
            Universidad_ID: res[0].Universidad_ID,
            direccion
        }

        result(null, Direccion);
    });
}

/**
 * Obtiene la url de google maps guardada en la base de datos.
 * @param {string} id Se utiliza para obtner la url de maps de la universidad solicitada.
 * @param {callback} result Se encarga de manerjar los errores y responder la url de maps de la universidad solicitada.
 */
Universidad.getUbicacion = (id, result) => {
    let query = `SELECT ubicacion.Universidad_ID, ubicacion.url_Maps FROM ubicacion WHERE ubicacion.Universidad_ID = ${id}`;
    pool.query(query, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, {
                message: "Ocurrio un error al obtener la ubicación"
            });
            return;
        }

        if(Object.entries(res).length === 0){
            result({ message: "No existe el recurso en la base de datos" }, null);
            return;
        }

        const data = res.map(dataUni => {
            return {
                Universidad_ID: dataUni.Universidad_ID,
                url_Maps: dataUni.url_Maps.substring(13, dataUni.url_Maps.length - 88)
            }
        })

        result(null, data[0]);
    })
}

/**
 * Se encarga de obtener los links de las fotos en la base de datos.
 * @function getFotos
 * @param {string} id Necesita el id la funcion para buscan en la base de datos todas las fotos de la universidad requerida.
 * @param {callback} result Se encarga de manejar los errores y responde los links de las fotos.
 */
getFotos = (id, result) => {
    let queryFoto = `SELECT foto.Universidad_ID, foto.Titulo, foto.Recurso FROM foto WHERE foto.Universidad_ID = ${id}`;

    pool.query(queryFoto, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result({ message: "Ocurrio un error en la base de datos" }, null);
            return;
        }
        result(null, res);
    });
}

/**
 * Se encarga de obtener los links de los videos en la base de datos.
 * @function getFotos
 * @param {string} id Necesita el id la funcion para buscan en la base de datos todas los videos de la universidad requerida.
 * @param {callback} result Se encarga de manejar los errores y responde los links de los videos.
 */
getVideos = (id, result) => {
    const urlYoutube = "https://www.youtube.com/watch?v=";

    let queryVideo = `SELECT video.Universidad_ID, video.ID, video.Titulo, video.Recurso FROM video WHERE video.Universidad_ID = ${id}`;
    pool.query(queryVideo, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result({ message: "Ocurrio un error en la base de datos" }, null);
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