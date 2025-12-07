SELECT COUNT(*) 
FROM cyclist c
WHERE NOT EXISTS (
  SELECT 1 
  FROM cyclists_own_bikes cob 
  WHERE cob.cyclist_id = c.id AND cob.purchase_year > 2015
)
