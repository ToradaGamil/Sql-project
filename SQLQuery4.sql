use [video_games];
select * from game_publisher;
select * from game_platform;
select * from genre;
select * from platform;
select * from game;

select * from publisher;





select distinct game_name, release_year 
from game as g, game_platform as gp 
where gp.release_year < 2019 AND gp.game_id = g.id
ORDER BY release_year;      --gets all games released before 2019


CREATE View genre_w_games AS 
SELECT [genre_name]
     , (STUFF((SELECT CAST(', ' + [game_name] AS VARCHAR(MAX)) 
         FROM  (select genre_name,game_name from game as g,genre as n 
where g.genre_id=n.id) as w
         WHERE (genre_name = genre.genre_name) 
         FOR XML PATH ('')), 1, 2, '')) AS Belonged_games
FROM genre;  --Viewes the game genre against its belonged games 
select * from genre_w_games;


select count(*) as gamecount ,genre_name from game , genre where genre_id = genre.id
group by genre_name;  --state how many games contained by each genre

SELECT [game_name]
     , (STUFF((SELECT CAST(', ' + [platform_name] AS VARCHAR(MAX)) 
         FROM (select game_name,platform_name from game as g,platform as p,game_platform as gp
where g.id=gp.game_id and p.id=gp.platform_id) as m 
         WHERE (game_name = game.game_name) 
         FOR XML PATH ('')), 1, 2, '')) AS Supported_Platforms
FROM game 
group by game_name     --shows the supported platforms for each game


-- do not forget to create triggers


alter function desired_game(@desired_genre varchar(50),@used_paltform varchar(50))
returns table
return
(select distinct game_name as available_game from [dbo].[game] as g ,genre as n ,platform as p ,game_platform as gp
where g.genre_id=n.id and gp.game_id=g.id and gp.platform_id=p.id and genre_name=@desired_genre and platform_name=@used_paltform)


select * from dbo.desired_game('Open-World','PC')  --when you pass the game genre and the used platform it returns the available games.