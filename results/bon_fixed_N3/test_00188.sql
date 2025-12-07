SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS Driver_Count FROM driver GROUP BY Racing_Series;
