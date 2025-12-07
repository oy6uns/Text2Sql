SELECT Document_Object_ID, COUNT(Parent_Document_Object_ID) AS Number_of_Children
FROM Document_Objects
WHERE Parent_Document_Object_ID IS NOT NULL
GROUP BY Document_Object_ID;
