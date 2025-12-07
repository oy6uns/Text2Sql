SELECT Neighborhood
FROM store s
WHERE NOT EXISTS (
  SELECT 1
  FROM stock st
  WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0
);
