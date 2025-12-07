SELECT Name
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000;
