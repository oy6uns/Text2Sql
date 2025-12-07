SELECT Collection_Name
FROM Collections c1
WHERE Collection_ID NOT IN (
    SELECT DISTINCT Parent_Collection_ID
    FROM Collections
    WHERE Parent_Collection_ID IS NOT NULL
)
