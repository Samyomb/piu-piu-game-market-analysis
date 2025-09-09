WITH sub1 as (SELECT 
gameid,
release_date
FROM projetfinalvideogames.xbox_cleaned.xbox_games_cleaned1

UNION ALL 

SELECT
gameid,
release_date
FROM projetfinalvideogames.steam_cleaned.steam_games_cleaned

UNION ALL 

SELECT
gameid,
release_date
FROM projetfinalvideogames.playstation_cleaned.play_games_cleaned1),

sub2 as (SELECT 
bm.*,
release_date
FROM sub1
inner join projetfinalvideogames.final_mart.big_union_all_1 as bm
USING (gameid))

SELECT distinct *
FROM sub2
