CREATE TABLE employees(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	position VARCHAR(30) NOT NULL,
	office VARCHAR(30) NOT NULL,
	start_date DATE NOT NULL,
	salary VARCHAR(30) NOT NULL
);
/*---------------------------------------------------------*/

INSERT INTO `jv_crm`.`employees` (`id`, `last_name`, `first_name`, `position`, `office`, `start_date`, `salary`) 
VALUES (NULL, 'Ramos', 'Angelica', 'Chief Executive Officer (CEO)', 'London', '2014-06-08', '$1,200,000');

INSERT INTO `jv_crm`.`employees` (`id`, `last_name`, `first_name`, `position`, `office`, `start_date`, `salary`) 
VALUES (NULL, 'Satou', 'Airi', 'Accountant', 'Tokyo', '2013-06-08', '$162,700');

INSERT INTO `jv_crm`.`employees` (`id`, `last_name`, `first_name`, `position`, `office`, `start_date`, `salary`) 
VALUES (NULL, 'Cox', 'Ashton', 'Junior Technical Author', 'San Francisco', '2013-02-08', '$86,000');
/*---------------------------------------------------------*/

Airi	Satou	Accountant	Tokyo	28th Nov 08	$162,700
Angelica	Ramos	Chief Executive Officer (CEO)	London	9th Oct 09	$1,200,000
Ashton	Cox	Junior Technical Author	San Francisco	12th Jan 09	$86,000
Bradley	Greer	Software Engineer	London	13th Oct 12	$132,000
Brenden	Wagner	Software Engineer	San Francisco	7th Jun 11	$206,850
Brielle	Williamson	Integration Specialist	New York	2nd Dec 12	$372,000
Bruno	Nash	Software Engineer	London	3rd May 11	$163,500
Caesar	Vance	Pre-Sales Support	New York	12th Dec 11	$106,450
Cara	Stevens	Sales Assistant	New York	6th Dec 11	$145,600
Cedric	Kelly	Senior Javascript Developer	Edinburgh	29th Mar 12	$433,060





table employee
id
last_name
first_name
position_id
office_id
start_date
salary
+ edit 
+ delete


INSERT INTO `jv_crm`.`employees` (`id`, `last_name`, `first_name`, `position`, `office`, `start_date`, `salary`) 
VALUES (NULL, 'eeee?', 'cio', 'cio', 'cio', NOW(), '2');




