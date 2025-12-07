SELECT Authors.author_name, COUNT(Documents.document_id) AS document_count
FROM Authors
LEFT JOIN Documents ON Authors.author_name = Documents.author_name
GROUP BY Authors.author_name
