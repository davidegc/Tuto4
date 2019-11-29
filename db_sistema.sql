USE Sistema;

go
CREATE TABLE Ciudad (
CiudadId int IDENTITY,
Nombre varchar(40) NOT NULL,

CONSTRAINT PK_Ciudad PRIMARY KEY(CiudadId)
)
go

go
CREATE TABLE Persona(
PersonaId int IDENTITY,
CURP varchar (18) NOT NULL,
Nombre varchar(25) NOT NULL,
Apellido varchar(25) NOT NULL,
Correo varchar(60) NOT NULL,
Clave varchar(16) NOT NULL,
CiudadId int NOT NULL,

CONSTRAINT FK_Persona_CiudadId FOREIGN KEY(CiudadId) REFERENCES Ciudad(CiudadId),
CONSTRAINT PK_Persona PRIMARY KEY(PersonaId)
)
go

go
CREATE TABLE Color(
ColorId int IDENTITY,
Nombre varchar(40) NOT NULL,
Hexadecimal varchar(6) NOT NULL,

CONSTRAINT PK_Color PRIMARY KEY(ColorId)
)
go

go
CREATE TABLE PersonaColor(
PersonaId int NOT NULL,
ColorId int NOT NULL,

CONSTRAINT FK_PersonaColor_Persona FOREIGN KEY (PersonaId) REFERENCES Persona(PersonaId),
CONSTRAINT FK_PersonaColor_Color FOREIGN KEY (ColorId) REFERENCES Color(ColorId),
CONSTRAINT FK_PersonaColor PRIMARY KEY(PersonaId, ColorId)
)
go

INSERT INTO Ciudad(Nombre) VALUES ('CDMX'), ('Guadalajara'), ('Guerrero'), ('Queretaro');

INSERT INTO Persona(CURP, Nombre, Apellido, Correo, Clave, CiudadId) VALUES
('123', 'David', 'González', 'david@gmail.com', '1234', 1);

INSERT INTO Persona(CURP, Nombre, Apellido, Correo, Clave, CiudadId) VALUES
('1234', 'Yaja', 'Vargas', 'yaja@gmail.com', '1234', 1);

INSERT INTO Color(Nombre, Hexadecimal) VALUES ('Rojo', 'RRR000'), ('Azul', 'AAA111');

SELECT * FROM Persona