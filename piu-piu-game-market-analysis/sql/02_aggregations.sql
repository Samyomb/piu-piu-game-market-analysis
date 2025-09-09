Agrégations
                       Prix moyen par region

WITH spend_per_player AS (
  SELECT
    region,
    platform,
    genre,
    free_or_paying,
    gameid,
    playerid,
    SUM(price) AS spend_player
  FROM `projetfinalvideogames.final_mart.view_table_1500_genre_bien`
  WHERE platform IN ('steam','playstation')
  GROUP BY 1,2,3,4,5,6
),
per_game AS (SELECT
    region,
    platform,
    genre,
    free_or_paying,
    gameid,
    AVG(spend_player) AS panier_moyen_region_jeu
  FROM spend_per_player
  GROUP BY 1,2,3,4,5
)
SELECT
  region,
  platform,
  genre,
  free_or_paying,
  gameid,
  ROUND(panier_moyen_region_jeu, 2) AS panier_moyen_region_jeu,
  ROUND(AVG(panier_moyen_region_jeu) OVER (PARTITION BY region, platform, genre, free_or_paying), 2) AS panier_moyen_region_bucket
FROM per_game;


                        Panier moyen par genre

WITH spend_per_player AS (SELECT
    genre,
    platform,
    region,
    free_or_paying,
    gameid,
    playerid,
    SUM(price) AS spend_player
  FROM `projetfinalvideogames.final_mart.view_table_1500_genre_bien`
  WHERE platform IN ('steam','playstation')
  GROUP BY 1,2,3,4,5,6
),
per_game AS (
  SELECT
    genre,
    platform,
    region,
    free_or_paying,
    gameid,
    AVG(spend_player) AS panier_moyen_jeu
  FROM spend_per_player
  GROUP BY 1,2,3,4,5
)
SELECT
  genre,
  platform,
  region,
  free_or_paying,
  gameid,
  ROUND(panier_moyen_jeu, 2) AS panier_moyen_jeu,
  ROUND(AVG(panier_moyen_jeu) OVER (PARTITION BY genre, platform, region, free_or_paying), 2) AS panier_moyen_bucket
FROM per_game
