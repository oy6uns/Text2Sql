SELECT DISTINCT S.Service_Details
FROM Services S
LEFT JOIN Customers_and_Services CAS ON S.Service_ID = CAS.Service_ID
LEFT JOIN Customers C ON CAS.Customer_ID = C.Customer_ID
LEFT JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID
WHERE C.Customer_Details = 'Hardy Kutch'
   OR CI.Status_Code = 'good'
