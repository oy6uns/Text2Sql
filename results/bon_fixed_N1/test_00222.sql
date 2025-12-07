SELECT Gender_MFU AS Gender_Code, COUNT(*) AS Number_of_Students
FROM Students
GROUP BY Gender_MFU;
