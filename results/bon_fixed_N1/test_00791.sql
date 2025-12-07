SELECT Fname, Major FROM Student WHERE city_code = (SELECT city_code FROM City WHERE city_name = 'Baltimore');
