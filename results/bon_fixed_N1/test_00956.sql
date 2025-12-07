SELECT Model
FROM headphone h
WHERE NOT EXISTS (
    SELECT 1
    FROM stock s
    WHERE s.Headphone_ID = h.Headphone_ID
    AND s.Quantity > 0
)
