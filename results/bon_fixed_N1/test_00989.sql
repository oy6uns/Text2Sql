SELECT Author.name, COUNT(DISTINCT Author_list.paper_id) AS number_of_papers
FROM Author
JOIN Author_list ON Author.author_id = Author_list.author_id
GROUP BY Author.name
ORDER BY number_of_papers DESC;
