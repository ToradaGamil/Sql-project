--CREATE DATABASE video_games;
--USE video_games;

DROP TABLE game_platform;
DROP TABLE game_publisher;
DROP TABLE game;
DROP TABLE publisher;
DROP TABLE genre;
DROP TABLE platform;

CREATE TABLE platform (
	id INT PRIMARY KEY,
	platform_name VARCHAR(50)
);

CREATE TABLE genre (
	id INT PRIMARY KEY,
	genre_name VARCHAR(50)
);

CREATE TABLE publisher (
	id INT PRIMARY KEY,
	publisher_name VARCHAR(100)
);


CREATE TABLE game (
	id INT PRIMARY KEY,
	genre_id INT,
	game_name VARCHAR(200),
	CONSTRAINT fk_gm_gen FOREIGN KEY (genre_id) REFERENCES genre(id)
);


CREATE TABLE game_publisher (
	id INT PRIMARY KEY,
	game_id INT,
	publisher_id INT,
	CONSTRAINT fk_gpu_gam FOREIGN KEY (game_id) REFERENCES game(id),
	CONSTRAINT fk_gpu_pub FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE game_platform (
	id INT PRIMARY KEY,
	game_id INT,
	publisher_id INT,
	platform_id INT,
	release_year INT,
	CONSTRAINT fk_gpl_gam FOREIGN KEY (game_id) REFERENCES game(id),
	CONSTRAINT fk_gpl_pub FOREIGN KEY (publisher_id) REFERENCES publisher(id),
	CONSTRAINT fk_gpl_pla FOREIGN KEY (platform_id) REFERENCES platform(id)
);



INSERT INTO genre VALUES (1,'Action'),(2,'Adventure'),(3,'Fighting'),(4,'Open-World'),(5,'Platform'),(6,'Puzzle'),(7,'Racing'),(8,'Role-Playing'),(9,'Shooter'),(10,'Simulation'),(11,'Sports'),(12,'Strategy');

INSERT INTO platform VALUES (1,'Wii'),(2,'X360'),(3,'PS3'),(4,'PS2'),(5,'PS4'),(6,'PS'),(7,'XB'),(8,'PC'),(9,'PSP'),(10,'XOne'),(11,'WiiU');

INSERT INTO publisher VALUES (1,'T3XMY'),(2,'Warner Bros'), (3,'EA'), (4,'Mojang'), (5,'Konami'), (6,'Firefly'), (7,'Microsoft'), (8,'Panic'), (9,'Rockstar'), (10, 'CD Projekt Red'), (11,'Ubisoft');

INSERT INTO game VALUES (1,9,'RoboGun'), (2,6,'BreakOut'), (3,2,'Batman Arkham Knight'), (4,9,'Battlefield 3'), (5,2,'Minecraft'), (6,11,'PES 2013'), (7,12,'Stronghold 2 HD'), (8,12,'Age of Empire 2'), (9,2,'Goose Game'), (10,7,'Need for Speed Most Wanted'), (11,4,'GTA V'), (12,4,'Cyberpunk 2077'), (13,4,'Assassins Creed Valhalla');

INSERT INTO game_publisher VALUES (1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 3), (5, 5, 4), (6, 6, 5), (7, 7, 6), (8, 8, 7), (9, 9, 8), (10, 10, 3), (11, 11, 9), (12, 12, 10), (13, 13, 11);

INSERT INTO game_platform VALUES (1, 1, 1, 8, 2020), (2, 2, 1, 8, 2020), (3, 3, 2, 8, 2015), (4, 4, 3, 8, 2011), (5, 5, 4, 8, 2009), (6, 6, 5, 8, 2012), (7, 7, 6, 8, 2005), (8, 8, 7, 8, 1999), (9, 9, 8, 8, 2019), (10, 10, 3, 8, 2012), (11, 11, 9, 8, 2013), (12, 12, 10, 8, 2020), (13, 13, 11, 8, 2020);
