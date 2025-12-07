SELECT DISTINCT hc.Level
FROM Has_Clearance hc
JOIN Employee e ON hc.Employee = e.EmployeeID
WHERE e.Position = 'physician';
