const testVocacional = require("../controller/testVocacional.controller.js");

var router = require("express").Router();

router.post("/", testVocacional.calificarTest);



module.exports = router;