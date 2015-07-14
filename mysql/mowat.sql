SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `mowat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mowat`;

CREATE TABLE IF NOT EXISTS `motion` (
  `userID` VARCHAR(200) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `accelerationX` VARCHAR(200) NOT NULL,
  `accelerationY` VARCHAR(200) NOT NULL,
  `accelerationZ` VARCHAR(200) NOT NULL,
  `accelerationIncludingGravityX` VARCHAR(200) NOT NULL,
  `accelerationIncludingGravityY` VARCHAR(200) NOT NULL,
  `accelerationIncludingGravityZ` VARCHAR(200) NOT NULL,
  `rotationRateBeta` VARCHAR(200) NOT NULL,
  `rotationRateGamma` VARCHAR(200) NOT NULL,
  `rotationRateAlpha` VARCHAR(200) NOT NULL,
  `interval` VARCHAR(200) NOT NULL,
  UNIQUE KEY `userID` (`userID`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orientation` (
  `userID` VARCHAR(200) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `beta` VARCHAR(200) NOT NULL,
  `gamma` VARCHAR(200) NOT NULL,
  `alpha` VARCHAR(200) NOT NULL,
  `absolute` VARCHAR(200) NOT NULL,
  UNIQUE KEY `userID` (`userID`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `touch` (
  `userID` VARCHAR(200) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `identifier` bigint(20) NOT NULL,
  `target` varchar(200) NOT NULL,
  `event` varchar(200) NOT NULL,
  `screenX` bigint(20) NOT NULL,
  `screenY` bigint(20) NOT NULL,
  `clientX` bigint(20) NOT NULL,
  `clientY` bigint(20) NOT NULL,
  `pageX` bigint(20) NOT NULL,
  `pageY` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
