SELECT DISTINCT S.Service_Details
FROM Services S
JOIN Customers_and_Services CAS ON S.Service_ID = CAS.Service_ID
JOIN Customers C ON CAS.Customer_ID = C.Customer_ID
JOIN Customer_Interactions CI ON CI.Service_ID = S.Service_ID AND CI.Customer_ID = C.Customer_ID
WHERE C.Customer_Details = 'Hardy Kutch'
  AND CI.Status_Code = 'bad'
