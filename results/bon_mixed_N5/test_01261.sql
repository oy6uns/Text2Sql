SELECT fname, lname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE LOWER(Sculptures.title) LIKE '%female%'
