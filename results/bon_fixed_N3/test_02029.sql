SELECT author_name
FROM Documents
GROUP BY author_name
ORDER BY COUNT(document_id) DESC
LIMIT 1;
