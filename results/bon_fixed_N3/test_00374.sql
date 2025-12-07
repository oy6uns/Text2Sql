SELECT 
  (SELECT COUNT(*) FROM Customers) AS Total_Customers,
  (SELECT COUNT(*) FROM Services) AS Total_Services;
