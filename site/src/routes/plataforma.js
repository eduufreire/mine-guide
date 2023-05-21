var express = require("express");
var router = express.Router();

var plataformaController = require("../controllers/plataformaController");

router.get("/listar", function (req, res) {
    plataformaController.listar(req, res);
});


module.exports = router;
