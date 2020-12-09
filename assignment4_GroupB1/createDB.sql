DROP TABLE IF EXISTS tutor;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS sponsor;
DROP TABLE IF EXISTS sponsors;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS LoL_World_Championship;

/*After careful consideration,
 we modified the data types of
 some data and restrictions in 
 the schema to make
 it more suitable for the structure
 of table and quieries.

*/

CREATE TABLE LoL_World_Championship (
	/*	time means the final date (MM-DD)
		award means money count and the unit is million dollars
		area means where the tournament were held
	*/
	champ_year	int primary key,
	time char(5) NOT NULL,
	award real NOT NULL,
	area char(2) NOT NULL,
	team_num int NOT NULL
);

CREATE TABLE leagues (
	/*	main_location is the main city of the leagues
		main_language is the main language of the main city*/
	Abbr	char(3) primary key,
	league_name varchar(50) NOT NULL,
	main_location varchar(20) NOT NULL,
	main_language varchar(20) NOT NULL,
	champ_year int NOT NULL references LoL_World_Championship(champ_year)
);

CREATE TABLE teams (
	/*	t_name is the name of the team
		city maens the headquarter of the club*/
	t_name	char(3) primary key,
	city	varchar(16) NOT NULL,
	Abbr char(3) NOT NULL references leagues(Abbr)
);

CREATE TABLE sponsors (
	/*	spon_company means the company of the sponsors	
		area means the location of the company*/
	spon_company	varchar(16) primary key,
	area varchar(20) NOT NULL,
	major varchar(20) NOT NULL,
	champ_year int NOT NULL references LoL_World_Championship(champ_year)
);

CREATE TABLE sponsor (
	/* */
	spon_company	varchar(16) NOT NULL references sponsors(spon_company),
	t_name	char(4) NOT NULL references teams(t_name),
	primary key (spon_company, t_name)
);


CREATE TABLE managers (
	/*	company means the club of the teams */
	mgrid serial primary key,
	name varchar(16) NOT NULL,
	age int NOT NULL,
	nationality char(2) NOT NULL,
	company varchar(16) NOT NULL,
	t_name char(3) NOT NULL references teams(t_name)
);

CREATE TABLE players (
	/*roles includes Jungler, Support,
	Top, Mid and ADC 
	and year is the birth year of the player
	
	*/
	pid		varchar(16) primary key,
	year	int NOT NULL,
	given_name		varchar(30) NOT NULL,
	family_name		varchar(30) NOT NULL,
	nationality		char(2) NOT NULL,
	role char(3) NOT NULL,
	t_name	char(3) NOT NULL references teams(t_name),
	mgrid	int NOT NULL references managers(mgrid)
);

CREATE TABLE coaches (
	/*	year refers to the beginning date of working for the club */
	cid		serial primary key,
	name	varchar(16) NOT NULL,
	year	int NOT NULL,
	nationality		char(2) NOT NULL,
	role char(1) NOT NULL,
	t_name	char(3) NOT NULL references teams(t_name)
);

CREATE TABLE tutor (
	/* */
	cid int NOT NULL references coaches(cid),
	pid varchar(16) NOT NULL references players(pid),
	primary key (cid, pid)
);