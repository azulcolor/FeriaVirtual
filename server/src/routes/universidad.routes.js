const universidad = require('../controller/universidad.controller');

var router = require("express").Router();

router.get("/", universidad.findAll);



module.exports = router;