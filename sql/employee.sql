CREATE TABLE empl_personal_info (
	empl_id int(10) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	id_no VARCHAR(45) NOT NULL,
	status VARCHAR(45),
	picture VARCHAR(45),
	position VARCHAR(45),
	interests VARCHAR(45),
	description TEXT(200),
	PRIMARY KEY (empl_id));
---------------------------------------------------------	
INSERT INTO `empl_personal_info`(`empl_id`, `first_name`, `last_name`, `sex`, `id_no`, `status`, `picture`, `position`, `interests`, `description`) 
VALUES ('', 'dexter', 'freeman', 'man', '234RR234RR', 'singel', 'dexter_freeman.jpg', 'IT manager', 'traveling, IT security', 'will be added')
---------------------------------------------------------

CREATE TABLE empl_adress (
	empl_id int(10) NOT NULL,
	street VARCHAR(45),
	street_no VARCHAR(45),
	post_cod VARCHAR(45),
	city VARCHAR(45),
	state VARCHAR(45),
	country VARCHAR(45),
	PRIMARY KEY (empl_id),
	CONSTRAINT fk_empl_id FOREIGN KEY (empl_id) REFERENCES empl_personal_info (empl_id));
---------------------------------------------------------	
INSERT INTO `empl_adress`(`empl_id`, `street`, `street_no`, `post_cod`, `city`, `state`, `country`) 
VALUES ('1', 'Main', '32/1', '94123', 'San Francisco', 'USA')
---------------------------------------------------------

CREATE TABLE empl_contact (
	empl_id int(10) NOT NULL,
	office_phone VARCHAR(45),
	home_phone VARCHAR(45),
	additional_phone VARCHAR(45),
	office_email VARCHAR(45),
	home_email VARCHAR(45),
	www_site VARCHAR(45),
	additional_info TEXT(200),
	PRIMARY KEY (empl_id),
	CONSTRAINT fk_contact_empl_id FOREIGN KEY (empl_id) REFERENCES empl_personal_info (empl_id));
---------------------------------------------------------
INSERT INTO `empl_contact`(`empl_id`, `office_phone`, `home_phone`, `additional_phone`, `office_email`, `home_email`, `www_site`, `additional_info`) 
VALUES ('1', '(322)755-2929', '(322)785-8929', '-', 'freeman@crm.com', 'dexter@gmail.com', 'www.dexterfree.com', 'will be add')
---------------------------------------------------------







