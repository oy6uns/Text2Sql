SELECT conference.Conference_Name, COUNT(conference_participation.Conference_ID) AS participation_count
FROM conference
LEFT JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID
GROUP BY conference.Conference_Name;
