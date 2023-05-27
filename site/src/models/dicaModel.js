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

function likedDica(idPlayer, idDica, fkNivel) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.");
    
    var instrucao = `   
        insert into LikedDica values(${idPlayer}, ${fkNivel}, ${idDica})
    `
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}



function curtidas(idPlayer) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente.");
    
    var instrucao = `   
        select ld.fkNivel, ld.fkDica, ld.fkPlayer from Dica d
	        inner join LikedDica ld 
            on ld.fkNivel = d.fkNivel 
	        and ld.fkDica = d.idDica
                where ld.fkPlayer = ${idPlayer};
    `
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}



module.exports = {
    listar,
    liked,
    likedDica,
    curtidas
};