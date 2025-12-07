SELECT Document_Object_ID
FROM Document_Objects
ORDER BY (
    SELECT COUNT(*)
    FROM Documents_in_Collections
    WHERE Document_Object_ID = Document_Objects.Document_Object_ID
) ASC
LIMIT 1;
