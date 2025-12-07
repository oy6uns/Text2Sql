SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution);
