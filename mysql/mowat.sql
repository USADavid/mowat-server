SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `mowat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mowat`;

CREATE TABLE IF NOT EXISTS `motion` (
  `userID` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `accelerationX` double NOT NULL,
  `accelerationY` double NOT NULL,
  `accelerationZ` double NOT NULL,
  `accelerationIncludingGravityX` double NOT NULL,
  `accelerationIncludingGravityY` double NOT NULL,
  `accelerationIncludingGravityZ` double NOT NULL,
  `rotationRateBeta` double NOT NULL,
  `rotationRateGamma` double NOT NULL,
  `rotationRateAlpha` double NOT NULL,
  `interval` double NOT NULL,
  UNIQUE KEY `userID` (`userID`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orientation` (
  `userID` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `beta` int(11) NOT NULL,
  `gamma` int(11) NOT NULL,
  `alpha` int(11) NOT NULL,
  `absolute` int(11) NOT NULL,
  UNIQUE KEY `userID` (`userID`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `touch` (
  `userID` int(11) NOT NULL,
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
