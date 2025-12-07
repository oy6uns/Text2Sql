SELECT s.bio_data, s.student_details
FROM Students s
JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id
JOIN (
    SELECT behaviour_monitoring_details
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    HAVING COUNT(*) = (
        SELECT MAX(cnt) FROM (
            SELECT COUNT(*) AS cnt
            FROM Behaviour_Monitoring
            GROUP BY behaviour_monitoring_details
        )
    )
) AS most_common ON bm.behaviour_monitoring_details = most_common.behaviour_monitoring_details
JOIN (
    SELECT behaviour_monitoring_details
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    HAVING COUNT(*) = 3
) AS three_students ON bm.behaviour_monitoring_details = three_students.behaviour_monitoring_details;
