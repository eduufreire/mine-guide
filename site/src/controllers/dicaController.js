var dicaModel = require("../models/dicaModel");


async function listar(req, res) {

    var idNivel = req.params.idNivel;
    var idPlayer = req.body.idPlayer

    let randomDicas = []
    for (var i = 0; randomDicas.length < 4; i++) {
        let number = Number((Math.random() * 7 + 1).toFixed())

        if(randomDicas.indexOf(number) == -1){
            randomDicas.push(number)
        }
    }

    let randomString =
    `${randomDicas[0]}, ${randomDicas[1]}, ${randomDicas[2]}, ${randomDicas[3]}`


    var teste = []
    await dicaModel.curtidas(idPlayer)
        .then(
            function (resultado) {

                teste.push(resultado)

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



    dicaModel.listar(idNivel, randomString)
        .then(
            function (resultado) {

                teste.push(resultado)

                console.log("TESTANDO: " + teste[1])

                res.json(teste);
                
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


async function liked(req, res) {

    var idPlayer = req.body.idPlayer;
    var idDica = req.body.idDica;
    var fkNivel = req.body.fkNivel;

    var teste;
    await dicaModel.likedDica(idPlayer, idDica, fkNivel)
    .then(
        function (resultado) {
            res.json(resultado);
            teste = 200
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao realizar o cadastro! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
            teste = 500
        }
    );

    if(teste == 200){
        dicaModel.liked(idDica, fkNivel)
        .then(
            function (resultado) {
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
    
}

module.exports = {
    listar,
    liked
}