SELECT Engine, COUNT(*) AS count FROM driver GROUP BY Engine ORDER BY count DESC LIMIT 1;
