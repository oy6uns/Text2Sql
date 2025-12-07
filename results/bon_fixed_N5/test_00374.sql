SELECT 
  (SELECT COUNT(*) FROM Customers) AS total_customers,
  (SELECT COUNT(*) FROM Services) AS total_services;
