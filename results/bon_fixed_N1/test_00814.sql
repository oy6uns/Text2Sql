select distance from Direct_distance dd
join City c1 on dd.city1_code = c1.city_code
join City c2 on dd.city2_code = c2.city_code
where (c1.city_name = 'Boston' and c2.city_name = 'Newark')
   or (c1.city_name = 'Newark' and c2.city_name = 'Boston')
