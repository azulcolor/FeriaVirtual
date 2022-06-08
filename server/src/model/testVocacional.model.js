//@ts-check

/**
 * Asignaturas
 * @typedef {object} Asignaturas Asignatura del test
 * @property {number} aireLibre 
 * @property {number} mecanica
 * @property {number} calculo
 * @property {number} ciencia
 * @property {number} persuasiva
 * @property {number} artes
 * @property {number} linguistica
 * @property {number} musica
 * @property {number} social
 * @property {number} administrativa
*/

const pool = require('./connectDatabase');

/**
 * Clase para procesar el test vocacional
 */
class TestVocacional {
    /**
     * Calcular el centil, con base al puntaje obtenido en el test 
     * @param {Object} testPuntaje puntajes de las asignaturas obtenidas en el test
     * @param {number} grupoEdad Grupo de Edad al que pertenese el usuario, para calcular su centil
     * @param {number | string} genero Genero del usuario
     */
    calcularCentil(testPuntaje, grupoEdad, genero) {
        /**
         * Centil de cada asignatura
         * @type {Asignaturas}
         */
        let centilPuntajes = {
            aireLibre: 0,
            mecanica: 0,
            calculo: 0,
            ciencia: 0,
            persuasiva: 0,
            artes: 0,
            linguistica: 0,
            musica: 0,
            social: 0,
            administrativa: 0
        };

        genero = genero ? 'Masculino' : 'Femenino';

        /**
         * Variable la cual sirve para unir el grupo de edad y genero, para obtener la funcion correpondiente en el array de funciones filters.
         * @type {string}
         */
        let condicion = `${grupoEdad}_${genero}`;

        // @ts-ignore
        const filters = new Map([
            ['1_Masculino', this.filter1],
            ['1_Femenino', this.filter2],
            ['2_Masculino', this.filter3],
            ['2_Femenino', this.filter3],
            ['3_Masculino', this.filter4],
            ['3_Femenino', this.filter4],
        ]);
        /**
         * Almacena la funcion evaluada en filter, para despues ejecutarla
         */
        let filter = filters.get(condicion);

        const centiles = filter(testPuntaje, centilPuntajes);
        let area1;
        let area2;
        let centilMaximo = 0;
        let centilMaximoDos = 0;
        /**
         * Calcula los dos centiles maximos obtenidos en el test
         */
        Object.values(centiles).forEach((centil, index) => {
            if (centilMaximo < centil) {
                area1 = index;
                centilMaximo = centil;
            }
        });

        Object.values(centiles).forEach((centil, index) => {
            if (centilMaximoDos < centil && index != area1) {
                area2 = index;
                centilMaximoDos = centil;
            }
        });
    }

    /**
     * filter1 se ocupa para obtener los valores de los centiles del primer grupo de aspirantes, Masculino
     * @param {Object} testPuntaje Puntajes Obtenidos en el test
     * @param {Asignaturas} centilPuntajes 
     * @returns {Asignaturas} Retorna los valores de los centiles correpondientes
     */
    filter1(testPuntaje, centilPuntajes) {

        //AIRE LIBRE

        const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 90, 95, 95, 95, 96, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];
        centilPuntajes.aireLibre = opAl[testPuntaje.puntajeAireLibre];

        // MECANICA
        const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 45, 50, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.mecanica = opMe[testPuntaje.puntajeMecanica];
        //CALCULO

        const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.calculo = opCa[testPuntaje.puntajeCalculo];

        //CIENCIA
        const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 65, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99];

        centilPuntajes.ciencia = opCi[testPuntaje.puntajeCiencia];

        //PERSUASIVA
        const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 50, 55, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.persuasiva = opPe[testPuntaje.puntajePersuasiva];

        //ARTES

        const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.artes = opAr[testPuntaje.puntajeArtes];

        //LINGUISTICA

        const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 45, 50, 55, 60, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.linguistica = opLi[testPuntaje.puntajeLinguistica];

        //MUSICA
        const opMu = [2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99];

        centilPuntajes.musica = opMu[testPuntaje.puntajeMusica];

        //SOCIAL O ASISTENCIA
        const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.social = opSo[testPuntaje.puntajeSocial];

        //ADMINISTRATIVA
        const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 19, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 50, 55, 60, 65, 65, 70, 70, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.administrativa = opAd[testPuntaje.puntajeAdministrativa];

        return centilPuntajes;
    }

    /**
     * filter2 se ocupa para obtener los valores de los centiles del primer grupo de aspirantes, Femeninos
     * @param {Object} testPuntaje Puntajes Obtenidos en el test
     * @param {Asignaturas} centilPuntajes 
     * @returns {Asignaturas} Retorna los valores de los centiles correpondientes
     */
    filter2(testPuntaje, centilPuntajes) {
        //AIRE LIBRE

        const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 95, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.aireLibre = opAl[testPuntaje.puntajeAireLibre];

        // MECANICA
        const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.mecanica = opMe[testPuntaje.puntajeMecanica];

        //CALCULO

        const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 80, 85, 90, 90, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.calculo = opCa[testPuntaje.puntajeCalculo];

        //CIENCIA
        const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 55, 55, 60, 65, 70, 70, 75, 75, 80, 85, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.ciencia = opCi[testPuntaje.puntajeCiencia];

        //PERSUASIVA
        const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 35, 40, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 85, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.persuasiva = opPe[testPuntaje.puntajePersuasiva];

        //ARTES

        const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.artes = opAr[testPuntaje.puntajeArtes];

        //LINGUISTICA

        const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.linguistica = opLi[testPuntaje.puntajeLinguistica];

        //MUSICA
        const opMu = [1, 1, 1, 1, 2, 3, 5, 5, 10, 15, 15, 20, 25, 35, 40, 45, 55, 60, 70, 75, 80, 85, 90, 90, 95, 95, 97, 98, 99, 99, 99];

        centilPuntajes.musica = opMu[testPuntaje.puntajeMusica];

        //SOCIAL O ASISTENCIA
        const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.social = opSo[testPuntaje.puntajeSocial];

        //ADMINISTRATIVA
        const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 40, 45, 45, 50, 55, 55, 60, 65, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 96, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.administrativa = opAd[testPuntaje.puntajeAdministrativa];


        return centilPuntajes;
    }

    /**
     * filter3 se ocupa para obtener los valores de los centiles del segundo grupo de aspirantes
     * @param {Object} testPuntaje Puntajes Obtenidos en el test
     * @param {Asignaturas} centilPuntajes 
     * @returns {Asignaturas} Retorna los valores de los centiles correpondientes
     */
    filter3(testPuntaje, centilPuntajes) {
        //AIRE LIBRE
        const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 90, 95, 95, 95, 96, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.aireLibre = opAl[testPuntaje.puntajeAireLibre];

        // MECANICA
        const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 45, 50, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.mecanica = opMe[testPuntaje.puntajeMecanica];

        //CALCULO

        const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.calculo = opCa[testPuntaje.puntajeCalculo];

        //CIENCIA
        const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 65, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99];

        centilPuntajes.ciencia = opCi[testPuntaje.puntajeCiencia];

        //PERSUASIVA
        const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 50, 55, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.persuasiva = opPe[testPuntaje.puntajePersuasiva];

        //ARTES

        const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.artes = opAr[testPuntaje.puntajeArtes];

        //LINGUISTICA

        const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 45, 50, 55, 60, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.linguistica = opLi[testPuntaje.puntajeLinguistica];

        //MUSICA
        const opMu = [2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99];

        centilPuntajes.musica = opMu[testPuntaje.puntajeMusica];

        //SOCIAL O ASISTENCIA
        const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.social = opSo[testPuntaje.puntajeSocial];

        //ADMINISTRATIVA
        const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 19, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 50, 55, 60, 65, 65, 70, 70, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.administrativa = opAd[testPuntaje.puntajeAdministrativa];

        return centilPuntajes;
    }

    /**
     * filter4 se ocupa para obtener los valores de los centiles del tercer grupo de aspirantes
     * @param {Object} testPuntaje Puntajes Obtenidos en el test
     * @param {Asignaturas} centilPuntajes 
     * @returns {Asignaturas} Retorna los valores de los centiles correpondientes
     */
    filter4(testPuntaje, centilPuntajes) {

        //AIRE LIBRE
        const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 11, 4, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 95, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.aireLibre = opAl[testPuntaje.puntajeAireLibre];

        // MECANICA
        const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.mecanica = opMe[testPuntaje.puntajeMecanica];

        //CALCULO

        const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 80, 85, 90, 90, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.calculo = opCa[testPuntaje.puntajeCalculo];

        //CIENCIA
        const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 55, 55, 60, 65, 70, 70, 75, 75, 80, 85, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.ciencia = opCi[testPuntaje.puntajeCiencia];

        //PERSUASIVA
        const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 35, 40, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 85, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.persuasiva = opPe[testPuntaje.puntajePersuasiva];

        //ARTES

        const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.artes = opAr[testPuntaje.puntajeArtes];

        //LINGUISTICA

        const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.linguistica = opLi[testPuntaje.puntajeLinguistica];

        //MUSICA
        const opMu = [1, 1, 1, 1, 2, 3, 5, 5, 10, 15, 15, 20, 25, 35, 40, 45, 55, 60, 70, 75, 80, 85, 90, 90, 95, 95, 97, 98, 99, 99, 99];

        centilPuntajes.musica = opMu[testPuntaje.puntajeMusica];

        //SOCIAL O ASISTENCIA
        const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.social = opSo[testPuntaje.puntajeSocial];

        //ADMINISTRATIVA
        const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 40, 45, 45, 50, 55, 55, 60, 65, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 96, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

        centilPuntajes.administrativa = opAd[testPuntaje.puntajeAdministrativa];

        return centilPuntajes;
    }
}

module.exports = TestVocacional;