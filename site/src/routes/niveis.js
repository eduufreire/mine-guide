var express = require("express");
var router = express.Router();

var niveisController = require("../controllers/niveisController");

router.get("/listar", function (req, res) {
    niveisController.listar(req, res);
});


module.exports = router;
