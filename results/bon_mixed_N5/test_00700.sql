SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(DISTINCT csm.Collection_ID) AS number_of_collections
FROM Collection_Subsets cs
LEFT JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID
GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name;
