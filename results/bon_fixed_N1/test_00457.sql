SELECT Students.bio_data, Transcripts.date_of_transcript
FROM Students
JOIN Transcripts ON Students.student_id = Transcripts.student_id;
