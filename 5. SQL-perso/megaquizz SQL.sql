  ############################
## MEGAQUIZZ (Raphaël Thomas) ##
  ############################

drop database megaquizz;

create database megaquizz;
use megaquizz;

create table newsletter (
	idNews int not null primary key auto_increment,
	nomNews varchar(50) not null,
    contenuNews text not null,
    dateNews time not null
);

create table contact (
	idContact int not null primary key auto_increment,
	mailContact varchar(50) not null
);

create table abonner (
	idNews int not null,
    idContact int not null,
    primary key(idNews, idContact),
    foreign key(idNews) references newsletter(idNews),
    foreign key(idContact) references contact(idContact)
);

create table utilisateur (
	idUtil int not null primary key auto_increment,
	nomUtil varchar(30) not null,
    prenomUtil varchar(30) not null,
    loginUtil varchar(30) not null,
    pwdUtil varchar(50) not null,
    idContact int not null,
    foreign key(idContact) references contact(idContact)
);

create table droits (
	idDroits int not null primary key auto_increment,
	nomDroits varchar(50) not null
);

create table detenir (
	idDroits int not null,
    idUtil int not null,
    primary key(idDroits, idUtil),
    foreign key(idDroits) references droits(idDroits),
    foreign key(idUtil) references utilisateur(idUtil)
);

create table classement (
	idClas int not null primary key auto_increment,
	rangClas smallint not null,
    idUtil int not null,
    foreign key(idUtil) references utilisateur(idUtil)
);

create table commentaire (
	idCom int not null primary key auto_increment,
	contenuCom text not null,
    dateCom datetime not null,
    idUtil int not null,
    foreign key(idUtil) references utilisateur(idUtil)
);

create table categorie (
	idCat int not null primary key auto_increment,
	nomCat varchar(20) not null
);

create table filtrer (
	idCom int not null,
    idCat int not null,
    primary key(idCom, idCat),
    foreign key(idCom) references commentaire(idCom),
    foreign key(idCat) references categorie(idCat)
);












