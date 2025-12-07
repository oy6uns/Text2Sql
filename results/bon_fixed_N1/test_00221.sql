SELECT Gender_MFU AS Gender, COUNT(*) AS Number_of_Students
FROM Students
GROUP BY Gender_MFU
ORDER BY Gender_MFU;
