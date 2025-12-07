SELECT Paper.paper_id, Paper.title
FROM Paper
JOIN Author_list ON Paper.paper_id = Author_list.paper_id
JOIN Author ON Author_list.author_id = Author.author_id
WHERE Author.name = 'Mckeown'
