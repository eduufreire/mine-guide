var express = require("express");
var router = express.Router();

var dicaController = require("../controllers/dicaController");

router.get("/listar/:idNivel", function (req, res) {
    dicaController.listar(req, res);
});

module.exports = router;
