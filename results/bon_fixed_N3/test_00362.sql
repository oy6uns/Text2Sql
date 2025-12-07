SELECT DISTINCT S.Service_Details
FROM Services S
JOIN Customers_and_Services CAS ON S.Service_ID = CAS.Service_ID
JOIN Customers C ON CAS.Customer_ID = C.Customer_ID
WHERE C.Customer_Details = 'Hardy Kutch'
