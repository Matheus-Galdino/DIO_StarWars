create database EstrelaDaMorte;

use EstrelaDaMorte;

Create table Planetas (
	IdPlaneta int primary key,
	Nome varchar(50) not null,
	Rotacao float not null,
	Orbita float not null,
	Diametro float not null,
	Clima varchar(50) not null,
	populacao int not null,
);

Create table Naves (
	IdNave int primary key,
	Nome varchar(100) not null,
	Modelo varchar(150) not null,
	Passageiros int not null,
	Carga float not null,
	Classe varchar(100) not null
);

Create table Pilotos (
	IdPiloto int primary key,
	Nome varchar(200) not null,
	AnoNascimento varchar(10) not null,
	IdPlaneta int not null,
	constraint FK_Pilotos_Planetas foreign key(IdPlaneta) references Planetas(IdPlaneta)
);

Create table PilotosNaves (
	IdPiloto int not null,
	IdNave int not null,
	FlagAutorizado bit not null default 1,
	primary key(IdPiloto, IdNave),
	constraint FK_PilotosNaves_Naves foreign key(IdNave) references Naves(IdNave),
	constraint FK_PilotosNaves_Pilotos foreign key(IdPiloto) references Pilotos(IdPiloto),
);

Create table HistoricoViagens (
	IdNave int not null,
	IdPiloto int not null,
	DtSaida datetime not null,
	DtChegada datetime null,
	constraint FK_HistoricoViagens_PilotosNaves foreign key(IdNave, IdPiloto) references PilotosNaves(IdPiloto, IdNave),
); 