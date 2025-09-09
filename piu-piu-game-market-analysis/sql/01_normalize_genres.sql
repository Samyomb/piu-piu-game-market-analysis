-- Normalisation des genres

SELECT
  gameid,
  title,
  CASE 
    WHEN (
      genres = "Turn Based"
      OR genres = "On Rails"
      OR genres = "Naval"
      OR genres LIKE "%Collectable%"
      OR genres = "Companion"
      OR genres LIKE "%Massively%"
      OR genres LIKE "%Time%"
      OR genres LIKE "%Game%"
      OR genres = "Tools"
      OR genres = "Video"
      OR genres LIKE "%MUSIC%"
      OR genres = "Tutorial"
      OR genres LIKE "%Sexual%"
      OR genres = "Bullfighting"
      OR genres = "Education"
      OR genres LIKE "%Quiz%"
      OR genres = "Visual Novel"
      OR genres LIKE "%Music%"
      OR genres = "Avatar"
      OR genres = "Classics"
      OR genres = 'kinect'
      OR genres = 'Game Preview'
      OR genres = 'Board Games'
      OR genres = 'social'
      OR genres = 'educational'
      OR genres = 'Educational & Trivia') AND genre_cleaned IS NULL THEN "other"
    WHEN (genres LIKE "%Racing%"
      OR genres = "Motocross"
      OR genres = "Automobile") AND genre_cleaned IS NULL THEN "racing"
    WHEN (genres = "Dance" 
      OR genres = "Cycling"
      OR genres = "Skiing"
      OR genres = "Snowboarding"
      OR genres = "Golf"
      OR genres = "Health & Fitness"
      OR genres LIKE "%ball%"
      OR genres = "Bowling"
      OR genres = "Boxing"
      OR genres LIKE "%Sports%"
      OR genres LIKE "%sports%"
      OR genres = "Cricket"
      OR genres = "Tennis"
      OR genres = "Hockey"
      OR genres LIKE "%Arts%"
      OR genres = "Rugby"
      OR genres = "Skating"
      OR genres = "Surfing"
      OR genres = "Wrestling"
      OR genres = "Darts"
      OR genres = "Lacrosse"
      OR genres = "Skydiving"
      OR genres = "Table Tennis"
      OR genres = 'Skateboarding')AND genre_cleaned IS NULL THEN "sports"
    WHEN (genres = "Fighting"
      OR genres = "Violent"
      OR genres LIKE '%Beat%'
      OR genres LIKE '%Battle%'
      OR genres LIKE '%Combat%'
      OR genres = "fighting"
      OR genres = "Hack & Slash") AND genre_cleaned IS NULL THEN "combat"
    WHEN (genres = "Hunting"
      OR genres LIKE '%Adventure%'
      OR genres = "Sandbox"
      OR genres LIKE "%Run%"
      OR genres = 'Mech') AND genre_cleaned IS NULL THEN "adventure"
    WHEN (genres = "Gore"
      OR genres LIKE '%Horror%') AND genre_cleaned IS NULL THEN "survival"
    WHEN (genres = "MOBA"
      OR genres = 'Tower Defence'
      OR genres = 'Stealth') AND genre_cleaned IS NULL THEN "strategy"
    WHEN (genres = "Pinball"
      OR genres LIKE "%Shoot%"
      OR genres = 'shooter') AND genre_cleaned IS NULL THEN "shooter"
    WHEN (genres = "FPS"
      OR genres LIKE "%RPG%" 
      OR genres = 'MMO'
      OR genres = 'Role Playing'
      OR genres = 'Roguelite'
      OR genres = 'Dungeon Crawler'
      OR genres = 'Metroidvania'
      OR genres = 'Open World') AND genre_cleaned IS NULL THEN "RPG"
    WHEN (genres LIKE "%Party%"
      OR genres = 'ARCADE' 
      OR genres = 'Family') AND genre_cleaned IS NULL THEN "casual"
    WHEN (genres = "platformer" OR genres = 'Platformer') AND genre_cleaned IS NULL THEN "platform"
    WHEN (genres = "Simulation"
      OR genres = "Casino"
      OR genres = 'Flying'
      OR genres = 'Aerial'
      OR genres = 'Management'
      OR genres = 'Card & Board'
      OR genres = 'Fishing') AND genre_cleaned IS NULL THEN "simulation"
    WHEN genres = "Casual" AND genre_cleaned IS NULL THEN "casual"
    WHEN genres = "Strategy" AND genre_cleaned IS NULL THEN "strategy"
    WHEN genres = "Survival" AND genre_cleaned IS NULL THEN "survival"
    WHEN genres = "Free to Play" AND genre_cleaned IS NULL THEN "other"
    WHEN genres = "Puzzle" AND genre_cleaned IS NULL THEN "puzzle"
    WHEN genres = "Collection" AND genre_cleaned IS NULL THEN "other"
    WHEN genres = "missing" AND genre_cleaned IS NULL THEN "missing"
    WHEN genres = "Indie" AND genre_cleaned IS NULL THEN "indie"
    WHEN (genres = "Action"
      OR genres = 'Point & Click') AND genre_cleaned IS NULL THEN "action"
    WHEN genre_cleaned IS NULL THEN genres
    ELSE genre_cleaned
  END AS genre_def,
  developers,
  publishers,
  supported_languages
FROM projetfinalvideogames.intermediate.play_ex
