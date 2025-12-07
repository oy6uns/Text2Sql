SELECT AVG(age) 
FROM Customers 
WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
