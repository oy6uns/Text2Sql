SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2;
