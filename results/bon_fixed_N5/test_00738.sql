SELECT COUNT(DISTINCT Related_Collection_ID) 
FROM Collection_Subset_Members 
WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
