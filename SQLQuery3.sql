use video_games;

select TOP 5 [game_name] , [publisher_name], [game_rating( from10 )] from [dbo].[game] as G
JOIN [dbo].[game_platform] as GP
ON GP.game_id = G.id
JOIN [dbo].[platform] as P
ON P.id = GP.platform_id
JOIN [dbo].[publisher] as Pub
ON Pub.id = GP.publisher_id
where [platform_name] = 'PC'
Order by [game_rating( from10 )] DESC

Select TOP 5 * from (Select [platform_name], AVG([game_rating( from10 )]) as AVG_Games_Rating from [dbo].[game] as G
JOIN [dbo].[game_platform] as GP
ON G.id = GP.game_id
JOIN [dbo].[platform] as P
ON P.id = GP.platform_id
Group by [platform_name]) AS T
Order by AVG_Games_Rating Desc