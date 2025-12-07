SELECT
    c.Collection_ID,
    c.Collection_Name,
    COUNT(dic.Document_Object_ID) AS document_count
FROM
    Collections c
    LEFT JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID
WHERE
    c.Collection_Name = 'Best'
GROUP BY
    c.Collection_ID,
    c.Collection_Name
ORDER BY
    document_count DESC
LIMIT 1;
