SELECT s.bio_data, t.date_of_transcript
FROM Students s
JOIN Transcripts t ON s.student_id = t.student_id;
