SELECT A.name
FROM Author A
JOIN Author_list AL ON A.author_id = AL.author_id
GROUP BY A.author_id, A.name
HAVING COUNT(DISTINCT AL.paper_id) > 50;
