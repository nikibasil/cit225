#Test case for service_date

#Create
Use healthcare;
INSERT INTO 
	service_date(date, service_start, service_end, total_hours, client_id_client, employee_employee_id, billing_billing_id, service_service_id, place_service_id_place_service)
VALUES
	('2023-06-20','19:30:10','21:00:00',  1.5, 6, 4, 7, 3, 1 ),
    ('2023-04-10','11:00:00','12:00:00',    1, 7, 3, 2, 2 , 3),
	('2023-05-15','14:00:00','15:00:00',    1, 8, 1, 6, 1, 1 ),
   ('2023-06-14','10:45:10','13:45:00',     3, 7, 6, 1, 4, 4 ),
    ('2023-03-01','18:00:25','19:00:00',    1, 10, 5, 4, 5, 2 );

#Read
SELECT * from service_date;

#Update
UPDATE service_date
SET place_service_id_place_service = '2'
WHERE service_date_id = 3;

#Delete
DELETE from service_date
WHERE client_id_client = 8;

