var express = require("express");
var router = express.Router();

var playerController = require("../controllers/playerController");

router.post("/logar", function (req, res) {
    playerController.logar(req, res);
});

router.post("/cadastrar", function (req, res) {
    playerController.cadastrar(req, res);
});


module.exports = router;
