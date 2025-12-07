select c.state
from Student s
join City c on s.city_code = c.city_code
where s.Fname = 'Linda'
