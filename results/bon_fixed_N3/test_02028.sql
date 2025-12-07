SELECT author_name, COUNT(document_id) AS number_of_documents
FROM Documents
GROUP BY author_name;
