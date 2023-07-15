--- Get Client Details  ---
USE healthcare;

SELECT c.first_name, c.last_name, c.phone, c.birthdate, c.ins_number,
		i.intake_packet, i.intake_date,a.address1, a.address2,
        a.city, a.state, a.zipcode, d.dx_code, d.dx_name, ins.ins_code,
        s.service_dept
FROM client c
JOIN intake i
    ON c.intake_intake_id = i.intake_id
JOIN address a
    ON c.address_address_id = a.address_id
JOIN diagnosis d
	ON c.diagnosis_dx_id = d.dx_id
JOIN insurance ins
	ON c.insurance_insurance_id = ins.insurance_id
JOIN client_service cs
	ON c.id_client = cs.client_id_client
JOIN service s
	ON cs.service_service_id = s.service_id
    ;
    
--- Get Service Details  ---

SELECT c.first_name, c.last_name, sd.date, sd.service_start, 
sd.service_end, sd.total_hours, e.initial as employee, se.service_code    
FROM client c
JOIN service_date sd
	ON c.id_client = sd.client_id_client
JOIN employee e
	ON sd.employee_employee_id = e.employee_id
JOIN service se
	ON sd.service_service_id = service_id;
    
INSERT INTO 
	service_date(date, service_start, service_end, total_hours, client_id_client, employee_employee_id, billing_billing_id, service_service_id, place_service_id_place_service)
VALUES
	('2023-06-20','19:30:10','21:00:00',  1.5, 6, 4, 7, 3, 1 ),
    ('2023-04-10','11:00:00','12:00:00',    1, 7, 3, 2, 2 , 3),
	('2023-05-15','14:00:00','15:00:00',    1, 8, 1, 6, 1, 1 ),
   ('2023-06-14','10:45:10','13:45:00',     3, 7, 6, 1, 4, 4 ),
    ('2023-03-01','18:00:25','19:00:00',    1, 10, 5, 4, 5, 2 );    
    
  --- Get Billing Details  ---  
    
 
SELECT b.billing_date, b.trans_id, b.amount, d.dx_code,
		sd.date as service_date, sd.total_hours, s.service_code,
       c.first_name, c.last_name, c.ins_number, p.place_id
FROM billing b
JOIN diagnosis d
	ON d.dx_id = b.diagnosis_dx_id
JOIN service_date sd
	ON b.billing_id = sd.billing_billing_id
JOIN service s
	ON sd.service_service_id = s.service_id
JOIN client c
	ON sd.client_id_client = c.id_client
JOIN place_service p
	ON sd.place_service_id_place_service = p.place_id;
    
