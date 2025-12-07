SELECT 
  (SELECT COUNT(*) FROM Customers) + (SELECT COUNT(*) FROM Services) AS total_customers_and_services_details;
