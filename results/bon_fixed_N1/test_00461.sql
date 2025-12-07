WITH ResultCounts AS (
    SELECT behaviour_monitoring_details, COUNT(DISTINCT student_id) AS cnt
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
),
MostCommonResults AS (
    SELECT behaviour_monitoring_details
    FROM ResultCounts
    WHERE cnt = (SELECT MAX(cnt) FROM ResultCounts)
),
ResultsWithThreeStudents AS (
    SELECT behaviour_monitoring_details
    FROM ResultCounts
    WHERE cnt = 3
),
StudentsWithMostCommon AS (
    SELECT DISTINCT student_id
    FROM Behaviour_Monitoring
    WHERE behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM MostCommonResults)
),
StudentsWithThreeStudentsResult AS (
    SELECT DISTINCT student_id
    FROM Behaviour_Monitoring
    WHERE behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM ResultsWithThreeStudents)
)
SELECT s.bio_data, s.student_details
FROM Students s
WHERE s.student_id IN (SELECT student_id FROM StudentsWithMostCommon)
  AND s.student_id IN (SELECT student_id FROM StudentsWithThreeStudentsResult)
