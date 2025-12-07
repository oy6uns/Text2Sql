SELECT Conference_Name, COUNT(*) AS Number_of_Times
FROM conference
GROUP BY Conference_Name;
