SELECT A.name
FROM Author A
JOIN (
    SELECT author_id
    FROM Author_list
    GROUP BY author_id
    HAVING COUNT(DISTINCT paper_id) = 1
) AS SinglePaperAuthors ON A.author_id = SinglePaperAuthors.author_id;
