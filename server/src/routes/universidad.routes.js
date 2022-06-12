const universidad = require('../controller/universidad.controller');

var router = require("express").Router();

router.get("/", universidad.findAll);

router.get("/:id", universidad.findById);

module.exports = router;