SELECT Conference_Name, COUNT(*) AS times
FROM conference
GROUP BY Conference_Name;
