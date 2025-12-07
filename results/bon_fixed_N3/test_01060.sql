SELECT Conference_Name, COUNT(*) AS occurrence_count
FROM conference
GROUP BY Conference_Name;
