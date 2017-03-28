-- Lab 8 --
-- John Boyle --
-- Database Systems --

-- Part 1 is in PDF --


-- Part 2 Create Stataments --
-- Directors --
CREATE TABLE Directors (
  name  text,
  did	char(5) not null,
  spousename	text,
  school	text,
  DGAnniv	date,
  favlens	char(10),
primary key(did)
);


-- Actors --
CREATE TABLE Actors (
  name  text,
  aid      	char(10) not null,
  birthdate	date,
  haircolor	char(25),
  eyecolor	char(25),
  height	integer,
  weightinLBS	integer,
  spousename	text,
  favcolor	char(10),
  SAGAnniv	date,
primary key(aid)
);


-- Movies --
CREATE TABLE Movies (
  name  text,
  mid		char(10) not null,
  title		text,	
  yearreleased	date,
  mpaa		integer,
  domesticsales	decimal(15,2),
  foreignsales	decimal(15,2),
  dvdsales	decimal(15,2),
primary key(mid)
);


-- Production --
CREATE TABLE Production (
    name text,
    pid char(10) not null,
    mid char (10) not null,
    aid char (10) not null,
    position  text,
primary key (pid,mid, position)
);

-- Part 3 in PDF --

-- Part 4 Sean Connery Query --
select p.name
from production p
where p.position = 'director'
and p.aid in(
    select a.aid
    from actors a
    where a.name = 'Sean Connery');




