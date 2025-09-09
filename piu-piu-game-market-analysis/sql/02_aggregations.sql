-- Agrégations exemples
-- Prix moyen par genre
-- SELECT genre_norm AS genre, AVG(price) AS avg_price FROM games GROUP BY genre_norm ORDER BY avg_price DESC;

-- Part multi/solo (au sein de l'échantillon)
-- SELECT CASE WHEN is_multiplayer THEN 'multijoueur' ELSE 'solo' END AS mode,
--        COUNT(*) * 1.0 / (SELECT COUNT(*) FROM games) AS share
-- FROM games GROUP BY 1;