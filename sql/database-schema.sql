# table schema queries
CREATE DATABASE IF NOT EXISTS `sample_store`;

USE `sample_store`;

CREATE TABLE IF NOT EXISTS `users` (
	`IdUser` INT(11) NOT NULL AUTO_INCREMENT,
	`Username` VARCHAR(50) NOT NULL DEFAULT '',
	`Email` VARCHAR(50) NOT NULL DEFAULT '',
	`Password` VARCHAR(50) NOT NULL DEFAULT '',
	`Token` VARCHAR(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`IdUser`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `products` (
	`IdProduct` INT(11) NOT NULL AUTO_INCREMENT,
	`ProductName` VARCHAR(30) NOT NULL DEFAULT '',
	`Price` INT(5) NOT NULL,
	`Currency` VARCHAR(3) NOT NULL DEFAULT 'RON',
	PRIMARY KEY (`IdProduct`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `orders` (
	`IdOrder` INT(11) NOT NULL AUTO_INCREMENT,
	`Date` DATETIME NOT NULL,
	`IdUser` INT(11) NOT NULL,
	`IdProduct` INT(11) NOT NULL,
	`OrderReference` VARCHAR(10) NOT NULL,
	`OrderStatus` VARCHAR(30)  NOT NULL DEFAULT 'PENDING',
	PRIMARY KEY (`IdOrder`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDBv
AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `store_credentials` (
	`IdStoreCredentials` INT(11) NOT NULL AUTO_INCREMENT,
	`StoreId` VARCHAR(50) NOT NULL DEFAULT '',
	`SecretKey` VARCHAR(50) NOT NULL DEFAULT '',
	`AddDate` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`IdStoreCredentials`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=0;

