SELECT COUNT(DISTINCT Citation.cited_paper_id)
FROM Citation
JOIN Paper ON Citation.paper_id = Paper.paper_id
JOIN Author_list ON Paper.paper_id = Author_list.paper_id
JOIN Author ON Author_list.author_id = Author.author_id
WHERE Author.name = 'Mckeown , Kathleen';
