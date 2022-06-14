const universidad = require('../controller/universidad.controller');

var router = require("express").Router();

router.get("/", universidad.findAll);

router.get("/:id", universidad.findById);

router.get("/ofertaeducativa/:id", universidad.getOfertaEducativa);

router.get("/multimedia/:id", universidad.getMultimedia);

module.exports = router;