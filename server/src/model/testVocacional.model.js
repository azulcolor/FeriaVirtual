const pool = require('./connectDatabase');

const TestVocacional = function (testPuntaje) {
    this.aireLibre = testPuntaje.aireLibre;
    this.mecanica = testPuntaje.mecanica;
    this.calculo = testPuntaje.calculo;
    this.ciencia = testPuntaje.ciencia;
    this.persuasiva = testPuntaje.persuasiva;
    this.artes = testPuntaje.artes;
    this.linguistica = testPuntaje.linguistica;
    this.musica = testPuntaje.musica;
    this.social = testPuntaje.social;
    this.administrativa = testPuntaje.administrativa;
}

TestVocacional.calcularCentil = (testPuntaje, grupoEdad, genero, result) => {
    genero = genero ? 'Femenino' : 'Masculino';
    const condicion = `${grupoEdad}_${genero}`;
    console.log(condicion);

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

    let centilesCalculados;

    if (condicion == '1_Masculino') {
        centilesCalculados = TestVocacional.filter1(testPuntaje);
    }
    if (condicion == '1_Femenino') {
        centilesCalculados = TestVocacional.filter2(testPuntaje, centilPuntajes);
    }
    if (condicion == '2_Masculino' || condicion == '2_Femenino') {
        centilesCalculados = TestVocacional.filter3(testPuntaje, centilPuntajes);
    }
    if (condicion == '3_Masculino' || condicion == '3_Femenino') {
        centilesCalculados = TestVocacional.filter4(testPuntaje, centilPuntajes);
    }

    let area1;
    let area2;
    let centilMaximo = 0;
    let centilMaximoDos = 0;

    Object.values(centilesCalculados).forEach((centil, index) => {
        if (centilMaximo < centil) {
            area1 = index;
            centilMaximo = centil;
        }
    });

    Object.values(centilesCalculados).forEach((centil, index) => {
        if (centilMaximoDos < centil && index != area1) {
            area2 = index;
            centilMaximoDos = centil;
        }
    });

    const data = {
        ...centilesCalculados,
        areas: {
            area1,
            area2
        }
    };

    result(null, data);
};

TestVocacional.filter1 = (testPuntaje) => {

    //AIRE LIBRE

    const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 90, 95, 95, 95, 96, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99]
    const aireLibre = opAl[testPuntaje.aireLibre];

    // MECANICA
    const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 45, 50, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const mecanica = opMe[testPuntaje.mecanica];
    //CALCULO

    const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const calculo = opCa[testPuntaje.calculo];

    //CIENCIA
    const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 65, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99];

    const ciencia = opCi[testPuntaje.ciencia];

    //PERSUASIVA
    const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 50, 55, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const persuasiva = opPe[testPuntaje.persuasiva];

    //ARTES

    const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const artes = opAr[testPuntaje.artes];

    //LINGUISTICA

    const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 45, 50, 55, 60, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const linguistica = opLi[testPuntaje.linguistica];

    //MUSICA
    const opMu = [2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99];

    const musica = opMu[testPuntaje.musica];

    //SOCIAL O ASISTENCIA
    const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const social = opSo[testPuntaje.social];

    //ADMINISTRATIVA
    const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 19, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 50, 55, 60, 65, 65, 70, 70, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const administrativa = opAd[testPuntaje.administrativa];

    const centilPuntaje = {
        aireLibre: aireLibre,
        mecanica: mecanica,
        calculo: calculo,
        ciencia: ciencia,
        persuasiva: persuasiva,
        artes: artes,
        linguistica: linguistica,
        musica: musica,
        social: social,
        administrativa: administrativa
    };

    return centilPuntaje;
}

TestVocacional.filter2 = (testPuntaje) => {
    //AIRE LIBRE

    const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 95, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const aireLibre = opAl[testPuntaje.aireLibre];

    // MECANICA
    const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const mecanica = opMe[testPuntaje.mecanica];

    //CALCULO

    const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 80, 85, 90, 90, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const calculo = opCa[testPuntaje.calculo];

    //CIENCIA
    const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 55, 55, 60, 65, 70, 70, 75, 75, 80, 85, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const ciencia = opCi[testPuntaje.ciencia];

    //PERSUASIVA
    const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 35, 40, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 85, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const persuasiva = opPe[testPuntaje.persuasiva];

    //ARTES

    const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

    const artes = opAr[testPuntaje.artes];

    //LINGUISTICA

    const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

    const linguistica = opLi[testPuntaje.linguistica];

    //MUSICA
    const opMu = [1, 1, 1, 1, 2, 3, 5, 5, 10, 15, 15, 20, 25, 35, 40, 45, 55, 60, 70, 75, 80, 85, 90, 90, 95, 95, 97, 98, 99, 99, 99];

    const musica = opMu[testPuntaje.musica];

    //SOCIAL O ASISTENCIA
    const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const social = opSo[testPuntaje.social];

    //ADMINISTRATIVA
    const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 40, 45, 45, 50, 55, 55, 60, 65, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 96, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const administrativa = opAd[testPuntaje.administrativa];

    const centilPuntaje = {
        aireLibre: aireLibre,
        mecanica: mecanica,
        calculo: calculo,
        ciencia: ciencia,
        persuasiva: persuasiva,
        artes: artes,
        linguistica: linguistica,
        musica: musica,
        social: social,
        administrativa: administrativa
    };

    return centilPuntaje;
}

TestVocacional.filter3 = (testPuntaje) => {
    //AIRE LIBRE
    const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 90, 95, 95, 95, 96, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const aireLibre = opAl[testPuntaje.aireLibre];

    // MECANICA
    const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 45, 50, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const mecanica = opMe[testPuntaje.mecanica];

    //CALCULO

    const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const calculo = opCa[testPuntaje.calculo];

    //CIENCIA
    const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 65, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99];

    const ciencia = opCi[testPuntaje.ciencia];

    //PERSUASIVA
    const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 40, 45, 50, 55, 55, 60, 65, 70, 75, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const persuasiva = opPe[testPuntaje.persuasiva];

    //ARTES

    const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const artes = opAr[testPuntaje.artes];

    //LINGUISTICA

    const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 45, 50, 55, 60, 70, 75, 80, 85, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const linguistica = opLi[testPuntaje.linguistica];

    //MUSICA
    const opMu = [2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 96, 97, 98, 99, 99, 99, 99];

    const musica = opMu[testPuntaje.musica];

    //SOCIAL O ASISTENCIA
    const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 20, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const social = opSo[testPuntaje.social];

    //ADMINISTRATIVA
    const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 19, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 50, 55, 60, 65, 65, 70, 70, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const administrativa = opAd[testPuntaje.administrativa];

    const centilPuntaje = {
        aireLibre: aireLibre,
        mecanica: mecanica,
        calculo: calculo,
        ciencia: ciencia,
        persuasiva: persuasiva,
        artes: artes,
        linguistica: linguistica,
        musica: musica,
        social: social,
        administrativa: administrativa
    };

    return centilPuntaje;
}

TestVocacional.filter4 = (testPuntaje) => {

    //AIRE LIBRE
    const opAl = [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 11, 4, 4, 5, 5, 5, 10, 10, 10, 10, 15, 15, 20, 20, 25, 25, 30, 30, 35, 35, 40, 45, 45, 50, 55, 55, 60, 60, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 95, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const aireLibre = opAl[testPuntaje.aireLibre];

    // MECANICA
    const opMe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const mecanica = opMe[testPuntaje.mecanica];

    //CALCULO

    const opCa = [1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 3, 5, 5, 10, 10, 15, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 80, 85, 90, 90, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const calculo = opCa[testPuntaje.calculo];

    //CIENCIA
    const opCi = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 30, 30, 35, 40, 40, 45, 50, 55, 55, 60, 65, 70, 70, 75, 75, 80, 85, 85, 85, 90, 90, 90, 95, 95, 96, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const ciencia = opCi[testPuntaje.ciencia];

    //PERSUASIVA
    const opPe = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 10, 10, 10, 15, 15, 20, 25, 25, 30, 35, 35, 40, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 85, 85, 85, 90, 90, 95, 95, 95, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const persuasiva = opPe[testPuntaje.persuasiva];

    //ARTES

    const opAr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 20, 25, 30, 35, 40, 50, 55, 60, 65, 70, 75, 80, 85, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

    const artes = opAr[testPuntaje.artes];

    //LINGUISTICA

    const opLi = [1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 5, 10, 10, 15, 20, 25, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 90, 95, 95, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 99];

    const linguistica = opLi[testPuntaje.linguistica];

    //MUSICA
    const opMu = [1, 1, 1, 1, 2, 3, 5, 5, 10, 15, 15, 20, 25, 35, 40, 45, 55, 60, 70, 75, 80, 85, 90, 90, 95, 95, 97, 98, 99, 99, 99];

    const musica = opMu[testPuntaje.musica];

    //SOCIAL O ASISTENCIA
    const opSo = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 45, 45, 50, 55, 60, 60, 65, 70, 75, 75, 80, 80, 85, 85, 90, 90, 90, 95, 95, 95, 97, 97, 98, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const social = opSo[testPuntaje.social];

    //ADMINISTRATIVA
    const opAd = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5, 5, 5, 10, 10, 10, 15, 15, 15, 20, 20, 25, 25, 30, 30, 35, 40, 40, 45, 45, 50, 55, 55, 60, 65, 65, 70, 70, 75, 75, 80, 80, 85, 85, 85, 90, 90, 90, 95, 95, 95, 96, 97, 97, 97, 98, 98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99];

    const administrativa = opAd[testPuntaje.administrativa];

    const centilPuntaje = {
        aireLibre: aireLibre,
        mecanica: mecanica,
        calculo: calculo,
        ciencia: ciencia,
        persuasiva: persuasiva,
        artes: artes,
        linguistica: linguistica,
        musica: musica,
        social: social,
        administrativa: administrativa
    };

    return centilPuntaje;
}


module.exports = TestVocacional;