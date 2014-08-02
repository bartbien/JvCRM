CREATE TABLE users_info (
	user_info_id int(11) NOT NULL AUTO_INCREMENT,
	username VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	PRIMARY KEY (user_info_id),
	CONSTRAINT fk_user_info FOREIGN KEY (username) REFERENCES users (username)
); 
  
INSERT INTO `users_info` ( `user_info_id` , `username` , `email` )
VALUES ('', 'bart', 'bart@gmail.com')

UPDATE `users` SET `email`="";
UPDATE `users` SET `email`="phoenix@gmail.com" WHERE username='phoenix';

ALTER TABLE `users` ADD `email` VARCHAR( 45 ) NOT NULL AFTER `password` ;

ALTER TABLE `users` DROP COLUMN `test`;