CREATE DATABASE metro_db;
USE metro_db;

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `connections_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id_from` int(11) NOT NULL,
  `station_id_to` int(11) NOT NULL,
  PRIMARY KEY (`connections_id`),
  UNIQUE KEY `station_id_from_station_id_to` (`station_id_from`,`station_id_to`),
  KEY `station_id_to` (`station_id_to`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`station_id_from`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE,
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`station_id_to`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `connections` (`connections_id`, `station_id_from`, `station_id_to`) VALUES
(1,	2,	9),
(2,	8,	11),
(3,	14,	4);

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#000000',
  PRIMARY KEY (`line_id`),
  UNIQUE KEY `line_name` (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lines` (`line_id`, `line_name`, `color`) VALUES
(1,	'Red Line',	'#FF0000'),
(2,	'Blue Line',	'#0000FF'),
(3,	'Green Line',	'#008000');

DROP TABLE IF EXISTS `line_stations`;
CREATE TABLE `line_stations` (
  `line_stations_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`line_stations_id`),
  UNIQUE KEY `line_id_station_id` (`line_id`,`station_id`),
  UNIQUE KEY `line_id_position` (`line_id`,`position`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `line_stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON DELETE CASCADE,
  CONSTRAINT `line_stations_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `line_stations` (`line_stations_id`, `line_id`, `station_id`, `position`) VALUES
(1,	1,	1,	1),
(2,	1,	2,	2),
(3,	1,	3,	3),
(4,	1,	4,	4),
(5,	1,	5,	5),
(6,	2,	6,	1),
(7,	2,	7,	2),
(8,	2,	8,	3),
(9,	2,	9,	4),
(10,	3,	10,	1),
(11,	3,	11,	2),
(12,	3,	12,	3),
(13,	3,	13,	4),
(14,	3,	14,	5);

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) NOT NULL,
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `station_name` (`station_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `stations` (`station_id`, `station_name`) VALUES
(12,	'Arhitectora Betkova'),
(1,	'Centralynyi rynok'),
(11,	'Derzhprom'),
(9,	'Istorychnyy muzey'),
(6,	'Kyivska'),
(2,	'Maidan Konstitutsyu'),
(14,	'Metrobudivnykiv'),
(10,	'Naukova'),
(3,	'Prospect Gagarina'),
(7,	'Pushkinska'),
(4,	'Sportyvna'),
(8,	'Universitet'),
(13,	'Zahisnykiv Ukrayiny'),
(5,	'Zavod im.Malysheva');
