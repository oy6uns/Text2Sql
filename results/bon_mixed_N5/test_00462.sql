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
TargetResults AS (
  SELECT behaviour_monitoring_details FROM MostCommonResult
  UNION
  SELECT behaviour_monitoring_details FROM ResultsWithThreeStudents
)
SELECT DISTINCT s.bio_data, s.student_details
FROM Students s
JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id
JOIN TargetResults tr ON bm.behaviour_monitoring_details = tr.behaviour_monitoring_details;
