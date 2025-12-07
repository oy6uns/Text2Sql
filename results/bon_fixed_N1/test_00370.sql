SELECT Customer_Details
FROM Customers
WHERE Customer_ID NOT IN (
    SELECT DISTINCT Customer_ID
    FROM Customers_and_Services
) AND Customer_ID NOT IN (
    SELECT DISTINCT Customer_ID
    FROM Customer_Interactions
)
