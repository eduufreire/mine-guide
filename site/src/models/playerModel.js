var database = require("../database/config")

function logar(email, senha) {

    var instrucao =
        `select idPlayer, nick, email, senha, fkNivel, date_format(ultimaVisita, '%d/%m/%y') as ultVisita, P.nomePlataforma, N.nomeNivel, N.urlFoto from Player
	    join Nivel as N on fkNivel = idNivel
	    join Plataforma as P on fkPlataforma = idPlataforma
            where email = '${email}' and senha = '${senha}';
    `

    return database.executar(instrucao)

}

function cadastrar(nome, email, senha, nivel, plataforma, ultVisita) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);

    var instrucao = `
        INSERT INTO Player (nick, email, senha, fkNivel, fkPlataforma, ultimaVisita) VALUES ('${nome}', '${email}', '${senha}', ${nivel}, ${plataforma}, '${ultVisita}');
    `
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarNivel() {

    var instrucao =
        `select nomeNivel, count(fkNivel) as qtde from Player
            right join Nivel on fkNivel = idNivel
            group by nomeNivel;
    `

    return database.executar(instrucao)

}


function totalPlayers() {

    var instrucao =
    `select count(idPlayer) as qtde from Player;`

    return database.executar(instrucao)

}

function ultimaVisita(idPlayer, data) {

    var instrucao =
    `update Player set ultimaVisita = '${data}' where idPlayer = ${idPlayer}`

    return database.executar(instrucao)

}

module.exports = {
    logar,
    cadastrar,
    listarNivel,
    totalPlayers,
    ultimaVisita
};