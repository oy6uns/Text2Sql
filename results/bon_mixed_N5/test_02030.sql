SELECT author_name
FROM Documents
GROUP BY author_name
HAVING COUNT(document_id) >= 2;
