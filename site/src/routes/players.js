var express = require("express");
var router = express.Router();

var playerController = require("../controllers/playerController");

router.post("/logar", function (req, res) {
    playerController.logar(req, res);
});

router.post("/cadastrar", function (req, res) {
    playerController.cadastrar(req, res);
});

router.get("/listarNivel", function (req, res) {
    playerController.listarNivel(req, res);
});

router.get("/totalPlayers", function (req, res) {
    playerController.totalPlayers(req, res);
});

router.get("/ultimaVisita/:idPlayer", function (req, res) {
    playerController.ultimaVisita(req, res);
});



module.exports = router;
