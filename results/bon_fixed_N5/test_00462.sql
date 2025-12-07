WITH ResultCounts AS (
  SELECT behaviour_monitoring_details, COUNT(DISTINCT student_id) AS student_count
  FROM Behaviour_Monitoring
  GROUP BY behaviour_monitoring_details
),
MostCommonResult AS (
  SELECT behaviour_monitoring_details
  FROM ResultCounts
  WHERE student_count = (SELECT MAX(student_count) FROM ResultCounts)
),
ResultsWithThreeStudents AS (
  SELECT behaviour_monitoring_details
  FROM ResultCounts
  WHERE student_count = 3
),
StudentsWithBothResults AS (
  SELECT bm1.student_id
  FROM Behaviour_Monitoring bm1
  JOIN MostCommonResult mcr ON bm1.behaviour_monitoring_details = mcr.behaviour_monitoring_details
  JOIN Behaviour_Monitoring bm2 ON bm1.student_id = bm2.student_id
  JOIN ResultsWithThreeStudents r3s ON bm2.behaviour_monitoring_details = r3s.behaviour_monitoring_details
  GROUP BY bm1.student_id
)
SELECT s.bio_data, s.student_details
FROM Students s
JOIN StudentsWithBothResults swbr ON s.student_id = swbr.student_id;
