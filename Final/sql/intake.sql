#Test case for intake

#Create
Use healthcare;
INSERT INTO 
	intake(intake_packet, intake_date)
VALUES
	(1,'2007-04-02'),
    (1,'2021-07-14'),
	(1,'2023-05-22'),
    (1,'2023-07-08'),
    (1,'2001-01-21'),
     (1,'2003-06-07');
 
#Read
SELECT * from intake;

#Update
UPDATE intake
SET intake_packet = 0
WHERE intake_date > '2023-04-01';

#Delete
DELETE from intake
where intake_id = 3;