select u.login_name
from Users u
join Ref_Age_Categories r on u.age_category_code = r.age_category_code
where lower(r.age_category_description) = 'senior citizens'
order by u.first_name;
