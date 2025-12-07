SELECT c.name, c.nation, c.result
FROM cyclist c
LEFT JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id
LEFT JOIN bike b ON cob.bike_id = b.id AND b.material = 'racing'
WHERE b.id IS NULL;
