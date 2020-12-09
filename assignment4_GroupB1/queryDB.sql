SELECT given_name,family_name
FROM players
WHERE role='MID'
AND t_name='G2';

SELECT team_num
FROM LoL_World_Championship
WHERE champ_year=2020;

SELECT t_name
FROM players
WHERE pid='Knight';

SELECT spon_company
FROM sponsors
WHERE major='computers'
AND champ_year=2020;

SELECT t_name
FROM players
WHERE pid='JackeyLove';

SELECT players.pid FROM players 
LEFT JOIN coaches
ON players.t_name=coaches.t_name
WHERE coaches.name='Clearlove';

SELECT count(t_name) as teams_num
FROM teams
WHERE Abbr='LPL';

SELECT name
FROM coaches
WHERE t_name='RNG';

SELECT count(Abbr) AS number
FROM
(
	SELECT Abbr
	FROM teams
	GROUP BY Abbr
	HAVING COUNT(DISTINCT Abbr) >= 1
)AS temp
;

SELECT (2020-b_year+1) AS age
FROM
(
	SELECT year AS b_year FROM players
	WHERE players.pid='Caps'
	AND players.t_name='G2'
)AS temp;


SELECT champ_year, award
FROM LoL_World_Championship
ORDER BY award DESC;

SELECT leagues.Abbr FROM leagues
LEFT JOIN sponsors 
ON leagues.champ_year=sponsors.champ_year
WHERE sponsors.spon_company='NIKE';

SELECT tutor.pid FROM tutor
LEFT JOIN coaches
ON coaches.cid=tutor.cid
LEFT JOIN players
ON tutor.pid=players.pid
WHERE coaches.name='Zhan Ma'
AND players.role='MID';

SELECT ROUND(2020-AVG(year))
AS average_year
FROM players;

SELECT COUNT(area) AS china_time
FROM LoL_World_Championship
WHERE area='CN'
AND champ_year>=2014
AND champ_year<=2020;

SELECT nationality, COUNT(*)
FROM players
GROUP BY nationality;

SELECT name, company, age
FROM managers
WHERE age=
(
    SELECT MAX(age)
    FROM managers
);

SELECT L1.champ_year as year, L1.award
FROM LoL_World_Championship L1
JOIN LoL_World_Championship L2 
on (L1.champ_year-L2.champ_year)=1
WHERE L1.award>L2.award;

SELECT DISTINCT p1.pid, p1.t_name
FROM players p1,
players p2
WHERE p1.t_name=p2.t_name
ORDER BY p1.t_name;

SELECT DISTINCT s1.spon_company, s1.major
FROM sponsors s1, sponsors s2
WHERE s1.major = s2.major
AND s1.spon_company != s2.spon_company;


SELECT c.name
FROM coaches AS c
WHERE NOT EXISTS (SELECT *
    FROM players AS p
    WHERE c.t_name = p.t_name);

SELECT nationality, COUNT(*)
FROM managers
GROUP BY nationality;

SELECT players.pid
FROM managers
LEFT JOIN players
ON managers.t_name=players.t_name
WHERE managers.name='Lee Kyung-sik'
AND players.role='MID';

SELECT coaches.name
FROM coaches
LEFT JOIN players
ON coaches.t_name=players.t_name
WHERE players.pid='Faker'
AND coaches.role='1';

SELECT coaches.name, coaches.nationality
FROM coaches
LEFT JOIN players
ON coaches.t_name=players.t_name
WHERE players.pid='Meiko'
AND coaches.role='0';

SELECT teams.t_name, teams.city
FROM teams
LEFT JOIN players
ON teams.t_name=players.t_name
WHERE players.pid='Crisp';

SELECT sponsor.spon_company, sponsor.t_name
FROM sponsor
LEFT JOIN sponsors
ON sponsor.spon_company=sponsors.spon_company
WHERE sponsors.major='sports';

SELECT leagues.Abbr, leagues.league_name
FROM leagues
LEFT JOIN teams
ON leagues.Abbr = teams.Abbr
WHERE teams.t_name='C9';

SELECT leagues.Abbr, leagues.main_location
FROM leagues
LEFT JOIN teams
ON leagues.Abbr = teams.Abbr
WHERE teams.t_name='G2';

SELECT teams.t_name, teams.Abbr
FROM teams
LEFT JOIN players
ON teams.t_name = players.t_name
WHERE players.given_name='Rasmus'
AND players.family_name='Borregaard Winther';


SELECT leagues.Abbr, main_language
FROM leagues
LEFT JOIN teams
ON teams.Abbr=leagues.Abbr
WHERE teams.t_name='SKT';

SELECT players.pid, main_language
FROM leagues
LEFT JOIN teams
ON teams.Abbr=leagues.Abbr
LEFT JOIN players
ON teams.t_name=players.t_name
WHERE players.pid='Faker';

SELECT managers.name, main_language
FROM leagues
LEFT JOIN teams
ON teams.Abbr=leagues.Abbr
LEFT JOIN managers
ON managers.t_name=teams.t_name
WHERE managers.name='Oliver';

SELECT sponsors.champ_year, sponsors.spon_company
FROM sponsors
LEFT JOIN LoL_World_Championship
ON LoL_World_Championship.champ_year=sponsors.champ_year
WHERE LoL_World_Championship.award=
(
    SELECT MAX(award)
    FROM LoL_World_Championship
);

SELECT sponsor.t_name, sponsor.spon_company
FROM sponsor
LEFT JOIN teams
ON sponsor.t_name=teams.t_name
WHERE teams.t_name='SKT';

SELECT p.pid
FROM players p
WHERE p.nationality='CN'
AND p.role='ADC';

SELECT coaches.name, coaches.nationality
FROM coaches
LEFT JOIN players
ON players.t_name=coaches.t_name
WHERE players.pid='Doinb';

SELECT  L1.champ_year as year, L1.team_num
FROM LoL_World_Championship L1
JOIN LoL_World_Championship L2 
ON (L1.champ_year-L2.champ_year)=1
WHERE L1.team_num>L2.team_num;

SELECT sponsor.spon_company
FROM sponsor
LEFT JOIN players
ON sponsor.t_name=players.t_name
WHERE players.given_name='Eui-jin'
AND family_name='Song';

SELECT teams.t_name, leagues.main_location
FROM leagues
LEFT JOIN teams
ON leagues.Abbr = teams.Abbr
WHERE teams.t_name='SSG';


SELECT c.name
FROM coaches AS c
WHERE NOT EXISTS (SELECT *
    FROM tutor AS t
    WHERE c.cid = t.cid);

SELECT pid
FROM players
LEFT JOIN coaches
ON players.t_name=coaches.t_name
WHERE players.role='SUP'
AND coaches.name='Chen Guan-ting';