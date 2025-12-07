SELECT DISTINCT county_state_province FROM Addresses WHERE address_id IN (SELECT property_address_id FROM Properties);
