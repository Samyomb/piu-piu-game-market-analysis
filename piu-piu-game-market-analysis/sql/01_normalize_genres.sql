-- Normalisation des genres (exemple)
UPDATE games_raw SET genre_raw = LOWER(TRIM(genre_raw));
UPDATE games_raw SET genre_raw = 'action-rpg' WHERE genre_raw IN ('arpg','action rpg','action_rpg');
UPDATE games_raw SET genre_raw = 'shooter'    WHERE genre_raw IN ('fps','tps','first-person shooter','third-person shooter');
UPDATE games_raw SET genre_raw = 'aventure'   WHERE genre_raw IN ('adventure','adv','aventura');