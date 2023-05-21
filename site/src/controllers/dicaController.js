var dicaModel = require("../models/dicaModel");


function listar(req, res) {

    var idNivel = req.params.idNivel;

    let randomDicas = []
    for (var i = 0; randomDicas.length < 4; i++) {
        let number = Number((Math.random() * 7 + 1).toFixed())

        if(randomDicas.indexOf(number) == -1){
            randomDicas.push(number)
        }
    }

    let randomString =
    `${randomDicas[0]}, ${randomDicas[1]}, ${randomDicas[2]}, ${randomDicas[3]}`

    dicaModel.listar(idNivel, randomString)
        .then(
            function (resultado) {
                console.log(randomString)
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );

}

module.exports = {
    listar
}