const TestVocacional = require('../model/testVocacional.model.js');


exports.calificarTest = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "No puede estar vacio"
        });
    }
    const { 
        aireLibre, 
        mecanica,
        calculo,
        ciencia,
        persuasiva,
        artes,
        linguistica,
        musica,
        social,
        administrativa,
    } = req.body;

    const testPuntajes = {
        aireLibre,
        mecanica,
        calculo,
        ciencia,
        persuasiva,
        artes,
        linguistica,
        musica,
        social,administrativa
    }

    const test = new TestVocacional(testPuntajes);
    
    TestVocacional.calcularCentil(testPuntajes,3,1, (err, data) => {
        if(err){
            res.status(500).send({
                message:
                err.message || "Ocurrio un error al calificar el test."
            });
        } else {
            res.send(data);
        }
    });
};
