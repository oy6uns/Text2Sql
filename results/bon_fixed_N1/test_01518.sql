SELECT goods.Food
FROM goods
JOIN items ON goods.Id = items.Item
GROUP BY goods.Food
ORDER BY COUNT(*) ASC
LIMIT 1;
