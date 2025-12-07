SELECT property_id, county_state_province AS state FROM Properties JOIN Addresses ON Properties.property_address_id = Addresses.address_id;
