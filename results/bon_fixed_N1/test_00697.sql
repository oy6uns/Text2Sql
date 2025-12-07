SELECT DISTINCT dsm.Document_Object_ID
FROM Document_Subset_Members dsm
JOIN Document_Objects do_owner ON dsm.Related_Document_Object_ID = do_owner.Document_Object_ID
WHERE do_owner.Owner = 'Ransom'
