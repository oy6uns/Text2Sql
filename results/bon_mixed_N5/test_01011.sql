SELECT COUNT(*) 
FROM Citation 
WHERE cited_paper_id IN (
    SELECT paper_id 
    FROM Author_list 
    JOIN Author ON Author_list.author_id = Author.author_id 
    WHERE Author.name = 'Mckeown , Kathleen'
)
