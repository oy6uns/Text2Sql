SELECT COUNT(DISTINCT related_collections.Collection_ID) FROM (
    SELECT Collection_Subset_Members.Collection_ID
    FROM Collection_Subset_Members
    JOIN Collections ON Collections.Collection_ID = Collection_Subset_Members.Collection_ID
    WHERE Collection_Subset_Members.Related_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
    UNION
    SELECT Collection_Subset_Members.Related_Collection_ID AS Collection_ID
    FROM Collection_Subset_Members
    WHERE Collection_Subset_Members.Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
) AS related_collections
WHERE related_collections.Collection_ID <> (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
