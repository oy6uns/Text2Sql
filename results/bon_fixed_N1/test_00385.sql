SELECT COUNT(*) 
FROM Integration_Platform ip
JOIN Customer_Interactions ci ON ip.Customer_Interaction_ID = ci.Customer_Interaction_ID
WHERE ci.Status_Code = 'successful'
