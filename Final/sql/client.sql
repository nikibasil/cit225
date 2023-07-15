#Test case for client

#Create
USE healthcare;
INSERT INTO 
	client(first_name, last_name, phone, birthdate, ins_number, address_address_id, 
    intake_intake_id,diagnosis_dx_id,insurance_insurance_id)
VALUES
	('N', 'Alderman','2054444444', '1954-7-30', 'XMX237465', 1, 1, 2, 2),
    ('J', 'Cooper', '2083333333', '1973-12-31', 'j8794V67', 2, 2, 6, 4 ),
	('L', 'Daniels','2085555555', '1957-06-08', '86978487AAD', 3, 4, 1, 1 ),
    ('H', 'Clarkson','2086666666', '1984-09-01', '89G7JE43Y2', 4, 5, 5, 3),
    ('T', 'Brighton','2087777777', '1980-04-13','98674BRI', 6, 6, 3, 5);

#Read
SELECT * from client;

#Update
update client
SET last_name ='McDaniels'
where first_name = 'L';

#Delete
delete from client
where first_name = 'H';
    
