SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS Number_of_Drivers FROM driver GROUP BY Racing_Series;
