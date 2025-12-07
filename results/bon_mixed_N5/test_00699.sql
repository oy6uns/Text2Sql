SELECT 
  cs.Collection_Subset_ID, 
  cs.Collection_Subset_Name, 
  COUNT(csm.Collection_ID) AS Number_of_Collections
FROM Collection_Subsets cs
LEFT JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID
GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name
ORDER BY cs.Collection_Subset_ID;
