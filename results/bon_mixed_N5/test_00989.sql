SELECT A.name, COUNT(AL.paper_id) AS number_of_papers
FROM Author A
JOIN Author_list AL ON A.author_id = AL.author_id
GROUP BY A.name
ORDER BY number_of_papers DESC;
