#Test case for place_service

#Create
Use healthcare;
INSERT INTO 
	place_service(place_name, place_id)
VALUES
	('Office','11'),
    ('Home','12'),
	('Community','99'),
    ('Telehealth','2'),
    ('Inpatient','11');
   
#Read
SELECT * from place_service;

#Update
UPDATE place_service
SET place_id = '11'
WHERE place_name LIKE 'I%';

#Delete
DELETE from place_service
WHERE place_name LIKE 'I%';