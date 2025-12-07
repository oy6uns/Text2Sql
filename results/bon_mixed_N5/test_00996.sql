SELECT A.name
FROM Author A
JOIN (
    SELECT author_id
    FROM Author_list
    GROUP BY author_id
    HAVING COUNT(DISTINCT paper_id) = 1
) AS single_paper_authors ON A.author_id = single_paper_authors.author_id;
