CREATE TABLE `vaults`
 ( `citizenid` VARCHAR(255) NOT NULL , `password` VARCHAR(255) NOT NULL , `storagename` VARCHAR(255) NOT NULL ) 
 ENGINE = InnoDB;


ALTER TABLE `vaults` ADD COLUMN `storage_size` int NULL DEFAULT 400000 AFTER `storagename`;

ALTER TABLE `vaults` ADD COLUMN `holders` text NULL DEFAULT NULL AFTER `storage_size`;

ALTER TABLE `vaults` ADD COLUMN `storage_location` VARCHAR(255) NULL DEFAULT NULL AFTER `holders`;

ALTER TABLE `vaults` ADD COLUMN `id` int(11) AFTER `holders`;
ALTER TABLE `vaults` MODIFY `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY;