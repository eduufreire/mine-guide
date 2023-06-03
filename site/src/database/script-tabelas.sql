create database mineGuide;
use mineGuide;

drop database mineGuide;
create table Nivel(
	idNivel int primary key auto_increment,
    nomeNivel varchar(45),
    urlFoto varchar(100)
);

create table Plataforma(
	idPlataforma int primary key auto_increment,
    nomePlataforma varchar(45)
);

create table Dica(    
	fkNivel int,
    foreign key(fkNivel) references Nivel(idNivel),
	idDica int,
    primary key(fkNivel, idDica),
    titulo varchar(100),
    descricao varchar(255),
    urlFoto varchar(500),
    qtdeLike int
);

create table Player(
	idPlayer int primary key auto_increment,
    nick varchar(20),
    email varchar(45),
    senha varchar(100),
    ultimaVisita date,
    fkNivel int,
    fkPlataforma int,
    foreign key(fkNivel) references Nivel(idNivel),
    foreign key(fkPlataforma) references Plataforma(idPlataforma)
);

create table LikedDica(
	fkPlayer int,
    fkNivel int,
	fkDica int,
    foreign key(fkNivel, fkDica) references Dica(fkNivel, idDica),
    foreign key(fkPlayer) references Player(idPlayer),
    primary key(fkPlayer, fkNivel, fkDica)
);

insert into Nivel
	values (null, 'Couro', 'assets/img/peitoral-couro.png'),
		   (null, 'Ferro', 'assets/img/peitoral-ferro.png'),
		   (null, 'Diamante', 'assets/img/peitoral-diamante.png'),
		   (null, 'Netherite', 'assets/img/peitoral-netherite.png');
           
insert into Plataforma
	values (null, 'Computador'),
		   (null, 'Celular'),
           (null, 'Playstation'),
           (null, 'Xbox');

-- DICAS COURO
insert into Dica (fkNivel, idDica, titulo, descricao, urlFoto, qtdeLike)
	values (1, 1, 'Nunca fique sem materiais', 'Explore seus arredores e colete materiais para criar armas, armaduras, comida, ferramentas e materiais de construção.', 'https://files.tecnoblog.net/wp-content/uploads/2019/09/minecraft-008-700x426.jpg', 0),
		   (1, 2, 'Replante as árvores que derrubou', 'Ao derrubar uma árvore, destrua as folhagens e colete os brotos para replantá-los no futuro.', 'https://criticalhits.com.br/wp-content/uploads/2021/01/minecraft-1021046_1280-910x512.jpg', 0),
		   (1, 3, 'Não construa um abrigo de madeira', 'Não se engane pelo material ser o mais abundante e use-o para fazer sua casa, pois ficará vulnerável a ataques de fogo.', 'https://sm.ign.com/ign_br/screenshot/default/minecraft-formas-sobreviver-noite-1_yzhv.jpg',0),
           (1, 4, 'Evite sair à noite no início do jogo', 'Sair à noite para explorar no início do jogo é uma péssima ideia. Além de seu nível estar baixo e muito provavelmente ainda não ter conseguido bons equipamentos e armas.', 'https://sm.ign.com/ign_br/screenshot/default/minecraft-formas-divertir-4_8rtd.jpg', 0),
           (1, 5, 'Sempre tenha comida no inventário', 'Tenha sempre um estoque de comida em seu inventário quando sair para explorar e fique de olho no seu índice de fome.', 'https://mmorpgplay.com.br/wp-content/uploads/2022/11/Melhor-comida-no-Minecraft-2022-novembro.webp',0),
           (1, 6, 'Saiba bem o que criar', 'Em posse dos materiais certos, como madeira, ferro e pedra, você pode criar elementos de construção, armas e armaduras.', 'https://mmorpgplay.com.br/wp-content/uploads/2022/10/Minecraft-Mining-Guide.webp',0),
           (1, 7, 'Evite combates quando possível', 'Embora pareça fácil enfrentar e derrotar inimigos, desde os mais simples ao temido (e pavio-curto) Creeper, não é aconselhável entrar em combates sem armaduras ou armas decentes.', 'https://s2.glbimg.com/ijEclfyEoy6EoDd8OH9dISuF1qw=/0x0:695x390/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/x/p/UZIGOIR3KbFGChq8hKfQ/minecraft-lista-mobs.jpg',0),
           (1, 8, 'Explore o modo Sobrevivência e o modo Criativo', 'No modo Survival (Sobrevivência), o objetivo é sobreviver, enquanto o modo Criativo oferece ferramentas de criação livres.', 'https://s2.glbimg.com/qIrhVY4T6p03jl9FCOqAhWAfBiE=/0x0:695x390/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/t/v/yrWtHdSRyCLKN97ZexHw/2015-02-23-minecraft-modo-creative-jogo-pc.jpg', 0);

-- DICAS FERRO
insert into Dica (fkNivel, idDica, titulo, descricao, urlFoto, qtdeLike)
	values (2, 1, 'Transporte de água e lava', 'Água e Lava podem ser matérias-primas úteis, contribuindo para características de paisagem atraentes e fornecendo defesas úteis contra multidões.', 'https://i.pinimg.com/564x/d5/98/e1/d598e1ac39dd5ab5ef48ef1c449608d8.jpg', 0),
		   (2, 2, 'Aventurando-se no Nether', 'O que você precisa: Uma arma para se defender, de preferência alguma armadura para se proteger, e uma picareta para coletar materiais que você só pode encontrar no Nether.', 'https://www.trueachievements.com/customimages/105861.jpg', 0),
           (2, 3, 'Explorando o mundo', 'Para se aventurar pelo mundo sem abandonar inadvertidamente sua construção e progresso, você precisará de um mapa ou bússola.', 'https://sm.ign.com/ign_br/screenshot/default/minecraft-objetivos-avancados-1_dt3b.png', 0),
           (2, 4, 'Explore cavernas e minas', 'Cavernas e minas são excelentes fontes de matérias-primas raras como ferro, ouro ou mesmo diamantes.', 'https://s2.glbimg.com/8D6p6YthkDu5fU0onQtP2pjPJAQ=/0x0:695x390/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2020/W/b/AB0RzTQh2U02KUIn5Amg/minecraft-caves-cliffs-atualizacao-caverna-bioma-lush.jpg', 0),
           (2, 5, 'Explore a Redstone', 'Com propriedades condutoras, ele pode ser utilizado na criação de circuitos para a automatização de alguns mecanismos', 'https://i.imgur.com/sdT9g.jpg', 0),
           (2, 6, 'Criação de animais e pescaria', 'Criações de animais também são eficientes e rendem muitos materiais além de experiência.', 'https://s2.glbimg.com/qib-hvw2BHNfrPs7GYa8Lc6A8tE=/0x0:695x390/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/K/o/lKlZVLSqqiaAsAAtaq9A/minecraft-como-fazer-cerca-salvar-animais-fazenda.jpg', 0),
           (2, 7, 'Construa abrigos eficientes', 'É importante encontrar um local seguro e longe de perigos, como penhascos e cavernas, para construir seu abrigo.', 'https://s2.dmcdn.net/v/JHwnF1VhR_81_m2nU/x1080', 0),
           (2, 8, 'Encante seus itens', 'Com a experiência conquistada durante o jogo, encante seus equipamentos para ficar mais forte!', 'https://s2.glbimg.com/-uBF5t03dyZaqJQm1usXiZDaL78=/1200x/smart/filters:cover():strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/w/g/EhENhZS9uOceN9RAjV1Q/2013-01-17-minecraft-mesa-de-encantamento.png', 0);

-- DICAS DIAMANTE
insert into Dica (fkNivel, idDica, titulo, descricao, urlFoto, qtdeLike)
	values (3, 1, 'Encontre um tipo de arquitetura que você goste', 'Procure uma imagem de um prédio nesse estilo e construa-o na realidade do Minecraft.', 'https://cdn.ligadosgames.com/imagens/eiffel-cke.jpg', 0),
           (3, 2, 'Instale mods', 'Muitos YouTubers disponibilizam análises deles.', 'https://www.gamebyte.com/wp-content/uploads/2018/01/FEATURED-IMAGE-11.jpg', 0),
           (3, 3, 'Jogue online', 'Você pode pedir para os seus amigos jogarem no mesmo servidor que você. Será divertido para todos.', 'https://cdn.ligadosgames.com/imagens/melhores-mods-minecraft-og.jpg', 0),
           (3, 4, 'O fim', 'Depois de encontrar e colocar 12 Olhos de Ender no Portal Final, você poderá entrar e lutar contra o Enderdragon.', 'https://sm.ign.com/ign_br/screenshot/default/minecraft-encerrar-forma-rapida-6_1k8z.jpg', 0),
           (3, 5, 'Crie Farms', 'Começe a ter recursos infinitos através das Farms. Existem milhares de farms, procure por algo que queira ter infinitamente!', 'https://static1-br.millenium.gg/articles/3/33/03/@/79506-agriculture-vignette-orig-1-article_cover_bd-1.png', 0),
           (3, 6, 'Trabalhe com Villagers', 'Um jogador pode negociar com aldeões, usando esmeraldas como moeda de comercialização. Maior facilidade de conseguri itens!', 'https://i.ytimg.com/vi/HSgYT-t2Iv0/maxresdefault.jpg', 0),
           (3, 7, 'Melhore seu PvP', 'Participe de servidores com foco em PvP, melhorando sua habilidade no geral.', 'https://img.gurugamer.com/resize/1200x-/2021/10/27/minecraft-pvp-83d7.jpg', 0),
           (3, 8, 'Tenha animais de estimação', 'Uma ótima forma de deixar seu mundo menos solitário!', 'https://criticalhits.com.br/wp-content/uploads/2021/03/Screenshot_28-5.jpg', 0);
           
-- DICAS NETHERITE
insert into Dica (fkNivel, idDica, titulo, descricao, urlFoto, qtdeLike)
	values (4, 1, 'Construa um mega castelo', 'Use um de exemplo ou utilize da própria criatividade', 'https://cdn.ligadosgames.com/imagens/seeds-de-castelos-para-minecraft-og.jpg', 0),
    (4, 2, 'Reforme vilas', 'Os villagers agradeceram essa ajuda', 'https://cdn.ligadosgames.com/imagens/como-achar-vilas-no-minecraft-og.jpg', 0),
    (4, 3, 'Tente zerar o mais rápido possível', 'Se for bom mesmo, tente fazer uma Speedrun para zerar o jogo!', 'https://cdn.gfinityesports.com/images/ncavvykf/gfinityesports/54be4963aadf2c975a613090297df187bc7d64f9-1280x720.jpg?rect=0,40,1280,640&w=1200&h=600&auto=format', 0),
    (4, 4, 'Projetos malucos', 'Tente fazer coisas megalomaníacas dentro do jogo', 'https://www.minecraft.net/content/dam/games/minecraft/screenshots/wonder-header.jpg.transform/minecraft-image-medium/image.jpg', 0),
    (4, 5, 'Colecionador', 'Colecione todos os tipos de item do jogo!', 'https://i.redd.it/wr2iho5tlqz41.png', 0),
    (4, 6, 'Colecionador pt.2', 'Colecione todos os mobs do jogo!', 'https://pm1.aminoapps.com/7085/d0babe62f6a72f228e3ea0864d86023cda7da89er1-739-415v2_uhq.jpg', 0),
    (4, 7, 'Mestre das conquistas', 'Conclua todas as conquistas que o próprio jogo disponibiliza', 'https://pbs.twimg.com/media/FJt6VGYXoAgD1ie.png', 0),
    (4, 8, 'Reforme suas construções', 'Dê uma repaginada em suas construções, teste novos estilos.', 'https://i.redd.it/fcf1j25mhrc71.jpg', 0);



INSERT INTO Player (nick, email, senha, ultimaVisita, fkNivel, fkPlataforma)
VALUES
    ('player1', 'player1@gmail.com', '123', '2023-05-30', 1, 1),
    ('player2', 'player2@gmail.com', '123', '2023-05-29', 1, 2),
    ('player3', 'player3@gmail.com', '123', '2023-05-28', 3, 2),
    ('player4', 'player4@gmail.com', '123', '2023-05-27', 4, 2),
    ('player5', 'player5@gmail.com', '123', '2023-05-26', 2, 2),
    ('player6', 'player6@gmail.com', '123', '2023-05-25', 4, 3),
    ('player7', 'player7@gmail.com', '123', '2023-05-24', 3, 4),
    ('player8', 'player8@gmail.com', '123', '2023-05-23', 1, 1),
    ('player9', 'player9@gmail.com', '123', '2023-05-22', 2, 3),
    ('player10', 'player10@gmail.com', '123', '2023-05-21', 2, 4),
    ('player11', 'player11@gmail.com', '123', '2023-05-20', 1, 1),
    ('player12', 'player12@gmail.com', '123', '2023-05-19', 1, 2),
    ('player13', 'player13@gmail.com', '123', '2023-05-18', 3, 1),
    ('player14', 'player14@gmail.com', '123', '2023-05-17', 2, 1),
    ('player15', 'player15@gmail.com', '123', '2023-05-16', 3, 2);


    
