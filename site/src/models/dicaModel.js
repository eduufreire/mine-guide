var database = require("../database/config")

function listar(idNivel, randomString) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.");
    
    var instrucao = `
        select * from Dica where fkNivel = ${idNivel} and idDica in (${randomString})
    `
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function liked(idDica, fkNivel) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.");
    
    var instrucao = `   
        update Dica
	    set qtdeLike = qtdeLike + 1 where idDica = ${idDica} and fkNivel = ${fkNivel};
    `
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
    liked
};