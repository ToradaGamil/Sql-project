select * from game_platform as gp where gp.release_year < 2010;


select game_name, release_year 
from game as g, game_platform as gp 
where gp.release_year < 2019 AND gp.game_id = g.id
ORDER BY release_year;


CREATE View new AS 
select game_name, release_year 
from game as g, game_platform as gp 
where gp.release_year < 2019 AND gp.game_id = g.id;
select * from new;


select count(*) as gamecount ,genre_name from game , genre where genre_id = genre.id
group by genre_name;
