SELECT DISTINCT s.name
FROM staff s
JOIN conference_participation cp_speaker ON s.staff_ID = cp_speaker.staff_ID AND cp_speaker.role = 'speaker'
JOIN conference_participation cp_sponsor ON s.staff_ID = cp_sponsor.staff_ID AND cp_sponsor.role = 'sponsor' AND cp_sponsor.Conference_ID = cp_speaker.Conference_ID;
