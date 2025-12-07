SELECT DISTINCT Level FROM Has_Clearance h JOIN Employee e ON h.Employee = e.EmployeeID WHERE e.Position = 'Physician';
