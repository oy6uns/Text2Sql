SELECT StuID FROM Student s JOIN City c ON s.city_code = c.city_code WHERE s.Sex = 'M' AND c.country <> 'USA'
