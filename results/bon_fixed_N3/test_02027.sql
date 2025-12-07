SELECT a.author_name, a.other_details
FROM Authors a
JOIN Documents d ON a.author_name = d.author_name
WHERE d.document_name = 'Travel to China';
