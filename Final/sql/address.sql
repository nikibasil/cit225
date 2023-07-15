#Test case for address

#Create
Use healthcare;
INSERT INTO 
	address(address1, address2, city, state, zipcode)
VALUES
	('634 Arthur St.','#2','Pocatello', 'ID', 83204),
    ('732 Homerun St', '', 'Chubbuck', 'ID', 83202),
	('479 Hurley Dr.','', 'Chubbuck', 'ID', '83202'),
    ('542 Maple St', '#6B', 'Pocatello', 'ID', 83202),
    ('7242 Riley Ave.' , '', 'Pocatello', 'ID', 83201),
    ('3324 Main' , 'A', 'Pocatello', 'ID', 83201);
    
#Read
SELECT * from address;

#Update
UPDATE address
SET zipcode ='83201'
WHERE city = 'Chubbuck';

#Delete
DELETE from address
where address_id = 5;
