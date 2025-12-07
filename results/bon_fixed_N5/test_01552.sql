SELECT FirstName || ' ' || LastName AS FullName
FROM customers
WHERE Id = (
  SELECT CustomerId
  FROM receipts
  ORDER BY Date
  LIMIT 1
)
