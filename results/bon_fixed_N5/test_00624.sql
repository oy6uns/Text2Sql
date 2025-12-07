SELECT Card_Credit 
FROM customer 
WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer) 
LIMIT 1;
