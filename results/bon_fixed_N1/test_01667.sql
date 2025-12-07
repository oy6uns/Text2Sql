SELECT Affiliation, COUNT(*) AS Number_of_Institutions
FROM institution
GROUP BY Affiliation;
