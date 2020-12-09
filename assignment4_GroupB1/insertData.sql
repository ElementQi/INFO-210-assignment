/*
The data we inserted is only a small part of the many data,
but these parts can basically reflect the general content 
of the entire data set which can be fully collected on 
the Internet.
*/


INSERT INTO 
LoL_World_Championship (champ_year,time,award,area,team_num) 
VALUES 
(2012, '10-13', 2.0, 'US', 12),
(2013, '10-04', 2.05, 'US', 14),
(2014, '10-19', 2.13, 'KR', 16),
(2015, '10-31', 2.13, 'DE', 16),
(2016, '10-29', 5.07, 'US', 16),
(2017, '11-04', 4.94697, 'CN', 24),
(2018, '11-03', 6.45, 'KR', 24),
(2019, '11-10', 2.225, 'FR', 24),
(2020, '11-01', 2.225, 'CN', 24);

INSERT INTO 
leagues (Abbr,league_name,main_location,main_language,champ_year) 
VALUES 
('LPL', 'League of Legends Pro League', 'Various', 'Mandarin', 2020),
('LEC', 'League of Legends European Championship', 'Berlin', 'English', 2019),
('LCS', 'League of Legends Championship Series', 'Los Angeles', 'English', 2018),
('LCK', 'League of Legends Champions Korea', 'Seoul', 'Korean', 2017);

INSERT INTO 
teams (t_name,city,Abbr) 
VALUES 
('IG', 'Beijing', 'LPL'),
('FPX', 'Shanghai', 'LPL'),
('TES', 'Shanghai', 'LPL'),
('EDG', 'Hangzhou', 'LPL'),
('RNG', 'Shanghai', 'LPL'),
('SKT', 'Seoul', 'LCK'),
('SSG', 'Seoul', 'LCK'),
('C9', 'Los Angeles', 'LCS'),
('FNC', 'London', 'LEC'),
('G2', 'Berlin', 'LEC');

INSERT INTO 
sponsors (spon_company,area,champ_year,major) 
VALUES 
('NIKE', 'Beijing', 2020, 'sports'),
('BENZ', 'Shanghai', 2020, 'vehicles'),
('ALIENWARE', 'Miami', 2020, 'computers'),
('KFC', 'Seoul', 2019, 'food'),
('SPITE', 'Seoul', 2018, 'food');

INSERT INTO 
sponsor (spon_company,t_name) 
VALUES 
('NIKE', 'IG'),
('BENZ', 'SKT'),
('KFC', 'FPX'),
('BENZ', 'IG'),
('KFC', 'SKT'),
('BENZ', 'G2'),
('NIKE', 'C9'),
('SPITE', 'G2');

INSERT INTO 
managers (mgrid,name,age,nationality,company,t_name)
VALUES 
(1, 'Su Xiaoluo', 38, 'CN', 'IG club', 'IG'),
(2, 'yangyan', 30, 'CN', 'FPX club', 'FPX'),
(3, 'Lee Kyung-sik', 35, 'KR', 'SKT club', 'SKT'),
(4, 'Oliver', 37, 'DE', 'G2 club', 'G2'),
(5, 'Zhang Ming', 38, 'CN', 'TES club', 'TES'),
(6, 'Guan Ming', 40, 'CN', 'EDG club', 'EDG');


INSERT INTO 
players (pid,year,given_name,family_name,nationality,role,t_name,mgrid)
VALUES 
('Ning', 1998, 'Zhen-ning', 'Gao', 'CN', 'JUG', 'IG', 1),
('TheShy', 1999, 'Seung-lok', 'Kang', 'KR', 'TOP', 'IG', 1),
('Crisp', 1998, 'Qing-song', 'Liu', 'CN', 'SUP', 'FPX', 2),
('Lwx', 1998, 'Wei-xiang', 'Lin', 'CN', 'ADC', 'FPX', 2),
('Rookie', 1997, 'Eui-jin', 'Song', 'KR', 'MID', 'IG', 1),
('Doinb', 1996, 'Tae-sang', 'Kim', 'KR', 'MID', 'FPX', 1),
('Faker', 1996, 'Sang-hyeok', 'lee', 'KR', 'MID', 'SKT', 3),
('JackeyLove', 2000, 'Wen bo', 'Yu', 'CN', 'ADC', 'IG', 1),
('Caps', 1999, 'Rasmus', 'Borregaard Winther', 'DK', 'MID', 'G2', 4),
('Knight', 2000, 'Ding', 'Zhuo', 'CN', 'MID', 'TES', 5),
('Aodi', 2001, 'Ao-di', 'Zhao', 'CN', 'TOP', 'EDG', 6),
('Scout', 2000, 'Ye-chan', 'Lee', 'KR', 'MID', 'EDG', 6),
('Meiko', 1999, 'Ye', 'Tian', 'CN', 'SUP', 'EDG', 6),
('Hope', 2000, 'Jie', 'Wang', 'CN', 'ADC', 'EDG', 6),
('Jiejie', 2001, 'Li-jie', 'Zhao', 'CN', 'JUG', 'EDG', 6);

INSERT INTO 
coaches (cid,name,year,nationality,role,t_name)
VALUES 
(1, 'Zhan Ma', 2016, 'KR', 1, 'FPX'),
(2, 'Chen Guan-ting', 2016, 'CN', 0, 'FPX'),
(3, 'Kim Jeong-gyun', 2012, 'KR', 1, 'SKT'),
(4, 'Bok Hang-yu', 2012, 'KR', 0, 'SKT'),
(5, 'Clearlove', 2018, 'CN', 1, 'EDG'),
(6, 'Liu Yun-song', 2014, 'CN', 0, 'EDG'),
(7, 'Mata', 2017, 'KR', 1, 'RNG'),
(8, 'Mlxg', 2016, 'CN', 0, 'RNG');

INSERT INTO
tutor (cid,pid)
VALUES
(1, 'Lwx'),
(1, 'Crisp'),
(1, 'Doinb'),
(2, 'Lwx'),
(2, 'Crisp'),
(2, 'Doinb'),
(3, 'Faker'),
(4, 'Faker');



