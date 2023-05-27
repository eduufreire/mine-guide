var express = require("express");
var router = express.Router();

var dicaController = require("../controllers/dicaController");

router.post("/listar/:idNivel", function (req, res) {
    dicaController.listar(req, res);
});

router.post("/liked", function (req, res) {
    dicaController.liked(req, res);
});

module.exports = router;
