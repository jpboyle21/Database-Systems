

CREATE TABLE IF NOT EXISTS PERSONS (
 PID CHAR(9) NOT NULL UNIQUE,
 NAME VARCHAR NOT NULL,
PRIMARY KEY(PID)
);

CREATE TABLE IF NOT EXISTS TVShows (
 TVID char(50) NOT NULL unique,
 ShowTitle VARCHAR (50) NOT NULL,
 TVGenre VARCHAR (10) NOT NULL,
 RuntimeInMinutes INTEGER NOT NULL,
 MainCharacter VARCHAR NOT NULL,
 PID CHAR(9) NOT NULL,
 Rating VARCHAR NOT NULL,
 NetflixOriginal BOOLEAN,
primary key(TVID)
);

CREATE TABLE IF NOT EXISTS Genre (
 GID char (10) NOT NULL unique,
 Genre VARCHAR NOT NULL, 
primary key(GID)
);

CREATE TABLE IF NOT EXISTS Actors (
 AID char (5) NOT NULL unique,
 PID CHAR(9) NOT NULL,
 ActorName VARCHAR NOT NULL, 
 BirthYear integer NOT NULL,
 Gender VARCHAR NOT NULL,
 Hometown VARCHAR NOT NULL, 
primary key(AID),
foreign key (PID) References PERSONS(PID)
);

CREATE TABLE IF NOT EXISTS Directors (
 DID char (5) NOT NULL UNIQUE,
 PID CHAR(9) NOT NULL,
 DirectorName VARCHAR NOT NULL,
 BirthYear integer NOT NULL,
 Gender VARCHAR NOT NULL,
 FilmingStyle VARCHAR NOT NULL,
primary key (DID),
foreign key (PID) References PERSONS(PID)
);

CREATE TABLE IF NOT EXISTS Movies (
 MID char (5) NOT NULL unique,
 MovieTitle VARCHAR (50) NOT NULL,
 GID char (10) NOT NULL,
 MovieGenre VARCHAR (10) NOT NULL,
 RuntimeInMinutes INTEGER NOT NULL,
 DirectorName VARCHAR NOT NULL,
 PID CHAR(9) NOT NULL,
 AnimatedOrLive VARCHAR NOT NULL,
 Rating VARCHAR NOT NULL,
primary key(MID),
foreign key (GID) References Genre(GID),
FOREIGN KEY(PID) REFERENCES PERSONS(PID)
);


CREATE TABLE IF NOT EXISTS Membership (
 MemID char (10) NOT NULL unique,
 PID char(9) not null,
 MemberSince integer NOT NULL,
 Username VARCHAR NOT NULL unique,
 password varchar not null,
 email varchar not null unique,
 NumOfUsers integer not null,
 PaymentType char(25) not null,
primary key(MemID),
foreign key (PID) references(PID)
);


CREATE TABLE IF NOT EXISTS Employees (
 EID char (10) not null unique,
 PID CHAR(9) NOT NULL,
 Department varchar not null,
 Name varchar not null,
 Gender varchar not null,
 EmployeeSince date not null,
 Salary integer not null,
primary key(EID),
FOREIGN KEY(PID) REFERENCES PERSONS(PID)
);


------PERSONS------
INSERT INTO PERSONS
		( PID, NAME )
VALUES
	('P1', 'Charlie Cox'),
    ('P2', 'Bryan Cranston'),
    ('P3', 'Wentworth Miller'),
    ('P4', 'Seth MacFarlane'),
    ('P5', 'Charlie Day'),
    ('P6', 'Bob Odenkirk'),
    ('P7', 'Krysten Ritter'),
    ('P8', 'Dylan Minnette'),
    ('P9', 'Andrew Lincoln'),
    ('P10', 'Darin Brooks'),
    ('P11', 'Jerry Seinfeld'),
    ('P12', 'Tom Hanks'),
    ('P13', 'Rob Schneider'),
    ('P14', 'Sean William Scott'),
    ('P15', 'Anna Faris'),
    ('P16', 'Hilary Duff'),
    ('P17', 'Miley Cyrus'),
    ('P18', 'Gerard Butler'),
    ('P19', 'Jeff Kahn'),
    ('P20', 'Adam Sandler'),
    ('P21', 'Steve Hickner'),
    ('P22', 'Robert Zemeckis'),
    ('P23', 'Dennis Dugan'),
    ('P24', 'Michael Dowse'),
    ('P25', 'David Zucker'),
    ('P26', 'Jim Fall'),
    ('P27', 'Peter Chelsom'),
    ('P28', 'Babak Najafi'),
    ('P29', 'Ben Stiller'),
    ('P30', 'Steven Brill'),
    ('P31', 'Alan Labouseur'),
    ('P32', 'Piradon Liengtiraphan'),
    ('P33', 'Casimer Decusatis'),
    ('P34', 'John Smith'),
    ('P35', 'database'),
    ('P36', 'systems'),
    ('P37', 'sql'),
    ('P38', 'postgres'),
    ('P39', 'marist')
;

------TVShows------
INSERT INTO TVShows
		( TVID, ShowTitle, TVGenre, RuntimeInMinutes, MainCharacter, PID, Rating, NetflixOriginal )
VALUES
	('t01', 'Daredevil', 'Thriller', 60, 'Charlie Cox', 'P1', 'TV-MA', 'True'),
	('t02', 'Breaking Bad', 'Thriller', 50, 'Bryan Cranston', 'P2', 'TV-MA', 'False'),
	('t03', 'Prison Break', 'Thriller', 50, 'Wentworth Miller', 'P3', 'TV-14', 'False'),
	('t04', 'Family Guy', 'Cartoon', 22, 'Seth MacFarlane', 'P4', 'TV-MA', 'False'),
	('t05', 'Always Sunny in Philadelphia','Comedy', 22, 'Charlie Day', 'P5', 'TV-MA', 'False'),
	('t06', 'Better Call Saul','Thriller', 50, 'Bob Odenkirk', 'P6', 'TV-MA', 'False'),
	('t07', 'Jessica Jones', 'Thriller', 60, 'Krysten Ritter', 'P7', 'TV-MA', 'True'),
	('t08', '13 Reasons Why', 'Drama', 60, 'Dylan Minnette', 'P8', 'TV-MA', 'True'),
	('t09', 'The Walking Dead', 'Thriller', 50, 'Andrew Lincoln', 'P9', 'TV-MA', 'False'),
	('t10', 'Blue Mountain State', 'Comedy', 22, 'Darin Brooks', 'P10', 'TV-MA', 'False')
;
    
------Genre------ 
INSERT INTO Genre
		( GID, Genre)
VALUES
	('g01', 'Comedy'),
	('g02', 'Thriller'),
	('g03', 'Cartoon'),
	('g04', 'RomCom'),
	('g05', 'Horror'),
	('g06', 'Drama'),
	('g07', 'Action'),
	('g08', 'Fantasy')
;	
------Actors------
INSERT INTO Actors
		(AID, PID, ActorName, BirthYear, Gender, Hometown)
VALUES
	('a01', 'P1', 'Charlie Cox', '1982', 'Male', 'London'),
	('a02', 'P2', 'Bryan Cranston', '1956', 'Male', 'Hollywood'),
	('a03', 'P3', 'Wentworth Miller ', '1972', 'Male', 'Chipping Norton'),
	('a04', 'P4', 'Seth MacFarlane', '1973', 'Male', 'Kent'),
	('a05', 'P5', 'Charlie Day', '1976', 'Male', 'New York City'),
	('a06', 'P6', 'Bob Odenkirk', '1962', 'Male', 'Berwyn'),
	('a07', 'P7', 'Krysten Ritter', '1981', 'Female', 'Bloomsburg'),
	('a08', 'P8', 'Dylan Minnette', '1996', 'Male', 'Evansville'),
	('a09', 'P9', 'Andrew Lincoln', '1973', 'Male', 'London'),
	('a10', 'P10', 'Darin Brooks', '1984', 'Male', 'Honolulu'),
	('a11', 'P11', 'Jerry Seinfeld', '1954', 'Male', 'Brooklyn'),
	('a12', 'P12', 'Tom Hanks', '1956', 'Male', 'Concord'),
	('a13', 'P13', 'Rob Schneider', '1963', 'Male', 'San Francisco'),
	('a14', 'P14', 'Seann William Scott', '1976', 'Male', 'Cottage Grove'),
	('a15', 'P15', 'Anna Faris', '1976', 'Male', 'Baltimore'),
	('a16', 'P16', 'Hilary Duff', '1987', 'Female', 'Houston'),
	('a17', 'P17', 'Miley Cyrus', '1992', 'Female', 'Franklin'),
	('a18', 'P18', 'Gerard Butler', '1969', 'Male', 'Paisley'),
	('a19', 'P19', 'Jeff Kahn', '1971', 'Male', 'Hoboken'),
	('a20', 'P20', 'Adam Sandler', '1966', 'Male', 'Brooklyn')
;
	
------Directors------
INSERT INTO Directors
		(DID, PID, DirectorName, BirthYear, Gender, FilmingStyle)
VALUES
	('d01', 'P21', 'Steve Hickner', '1972', 'Male', 'Animation' ),
	('d02', 'P22', 'Robert Zemeckis', '1952', 'Male', 'Drama' ),
	('d03', 'P23', 'Dennis Dugan', '1946', 'Male', 'Comedy' ),
	('d04', 'P24', 'Michael Dowse', '1973', 'Male', 'Sports' ),
	('d05', 'P25', 'David Zucker', '1947', 'Male', 'Comedy' ),
	('d06', 'P26', 'Jim Fall', '1962', 'Male', 'YouthComedy' ),
	('d07', 'P27', 'Peter Chelsom', '1956', 'Male', 'YouthComedy' ),
	('d08', 'P28', 'Babak Najafi', '1975', 'Male', 'Action' ),
	('d09', 'P29', 'Ben Stiller', '1965', 'Male', 'Action' ),
	('d10', 'P30', 'Steven Brill', '1962', 'Male', 'Comedy' )
;

------Movies------
INSERT INTO Movies
		(MID, MovieTitle, GID, MovieGenre, RuntimeInMinutes, DirectorName, PID, AnimatedOrLive, Rating)
VALUES
	('m01', 'Bee Movie', 'g01', 'Comedy', 95, 'Steve Hickner', 'P21', 'Animated', 'PG' ),
	('m02', 'Forrest Gump', 'g06', 'Drama', 144, 'Robert Zemeckis', 'P22', 'LiveAction', 'R' ),
	('m03', 'The Benchwarmers', 'g01', 'Comedy', 98, 'Dennis Dugan', 'P23', 'Live', 'PG-13' ),
	('m04', 'Goon', 'g01', 'Comedy', 101, 'Michael Dowse', 'P24', 'Live', 'R' ),
	('m05', 'Scary Movie 3', 'g01', 'Comedy', 85, 'David Zucker', 'P25', 'Live', 'PG-13' ),
	('m06', 'The Lizzie McGuire Movie', 'g01', 'Comedy', 94, 'Jim Fall', 'P26', 'Both', 'PG' ),
	('m07', 'Hannah Montana The Movie', 'g01', 'Comedy', 102, 'Peter Chelsom', 'P27', 'Live', 'G' ),
	('m08', 'London Has Fallen', 'g07', 'Action', 100, 'Babak Najafi', 'P28', 'Live', 'R' ),
	('m09', 'Tropic Thunder', 'g07', 'Action', 107, 'Ben Stiller', 'P29', 'Live', 'R' ),
	('m10', 'The Do-Over', 'g01', 'Comedy', 108, 'Steven Brill', 'P30', 'Live', 'R' )
;	

------Membership------
INSERT INTO Membership
		(MemID, PID, MemberSince, Username, Password, Email, NumOfUsers, PaymentType)
VALUES
	('mem01', 'P35',2009, 'database', 'alpaca', 'movie@gmail.com', 3, 'Debit Card'),
	('mem02', 'P35',2008, 'systems', 'bear', 'show@gmail.com', 1, 'Check'),
	('mem03', 'P35',2014, 'sql', 'fish', 'video@gmail.com', 4, 'Cash'),
	('mem04', 'P35',2016, 'postgres', 'bear', 'audio@gmail.com', 2, 'Credit Card'),
	('mem05', 'P35',2014, 'marist', 'fox', 'hancock@gmail.com', 1, 'Debit Card')
;

------Employee------
INSERT INTO Employees
		(EID, PID, Department, Name, Gender, EmployeeSince, Salary)
VALUES
	('e01', 'P31', 'CEO', 'Alan Labouseur', 'Male', 'May 1, 2017', 200000),
	('e02', 'P32', 'Minion', 'Piradon Liengtiraphan',  'Male', 'May 1, 2017', 2),
	('e03', 'P33', 'IT Admin', 'Casimer Decusatis',  'Male', 'May 1, 2017', 10000),
	('e04', 'P34', 'Sales Rep', 'John Smith',  'Male', 'June 12, 2007', 14000)
;	
	
------Views------  
CREATE VIEW MovieInfo AS
Select M.MovieTitle, m.movieGenre, m.RuntimeInMinutes, m.DirectorName
From Movies m, persons p
where m.pid = p.pid
and p.name = 'Dennis Dugan'


CREATE VIEW DirectorName AS
select d.directorname, d.pid, d.filmingstyle
from directors d, movies m
where d.directorname = m.directorname
and m.gid = 'g07'
and m.runtimeinminutes > 100;


------Sample Queries------
select movietitle, moviegenre, runtimeinminutes
from movies
where runtimeinminutes > 100

select d.directorname, d.did, d.birthyear
from directors d inner join movies m on d.directorname = m.directorname
where m.moviegenre = 'Comedy'


------Trigger------
CREATE OR REPLACE FUNCTION newUser() RETURNS trigger AS $$
BEGIN
IF NEW.memID is null THEN
	raise exception 'No pid';
END IF;
IF NEW.userName IS NULL THEN
	raise exception 'Please make a Username';
 END IF;
IF NEW.password IS NUL THEN
	raise exception 'Please set a password';
 END IF;
INSER INTO Membership(pID, MemberSince, UserName, password, email, NumofUsers, PaymentType)
values (NEW.memID, NEW.username, NEW.password, NEW.email ,NEW.numofusers, NEW.PaymentType);
RETURN new;   END;
$$ language plpgsql;


------Security------
CREATE role CEOAlan
GRANT SELECT, INSERT, UPDATE, DELETE
On all tables in schema public to CEOAlan