-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2020 at 02:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGabung` ()  BEGIN
SELECT * FROM barang_masuk INNER JOIN barang_keluar on barang_masuk.kode_barang=barang_keluar.kode_barang;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `operator` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `kode_barang`, `nama_barang`, `tujuan`, `tanggal`, `operator`) VALUES
(1, '11181', 'Laptop', 'Bandung', '2020-05-14', 'Zen');

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `del_klr` AFTER DELETE ON `barang_keluar` FOR EACH ROW INSERT INTO log_klr VALUES ("Penghapusan Data",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ins_klr` AFTER INSERT ON `barang_keluar` FOR EACH ROW INSERT INTO log_klr VALUES ("Tambah Data",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upt_klr` AFTER UPDATE ON `barang_keluar` FOR EACH ROW INSERT INTO log_klr VALUES ("Perubahan Data",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `kode_barang`, `nama_barang`, `pengirim`, `penerima`, `tanggal`) VALUES
(1, '2031923', 'Komputer', 'Rasil', 'Ryan', '2020-05-14'),
(2, '11181', 'Laptop', 'Joni', 'Agus', '2020-05-14');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `del_msk` AFTER DELETE ON `barang_masuk` FOR EACH ROW INSERT INTO log_msk VALUES ("Delete Data",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ins_msk` AFTER INSERT ON `barang_masuk` FOR EACH ROW INSERT INTO log_msk VALUES ("Tambah Data",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upt_msk` AFTER UPDATE ON `barang_masuk` FOR EACH ROW INSERT INTO log_msk VALUES ("Update Data",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`id`, `kode_barang`, `nama_barang`, `pengirim`, `penerima`, `tanggal`) VALUES
(1, '2031923', 'Komputer', 'Rasil', 'Ryan', '2020-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `log_klr`
--

CREATE TABLE `log_klr` (
  `kejadian` varchar(40) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_msk`
--

CREATE TABLE `log_msk` (
  `kejadian` varchar(40) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin','member') NOT NULL DEFAULT 'member',
  `divisi` varchar(100) NOT NULL,
  `loker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `alamat`, `telepon`, `username`, `password`, `level`, `divisi`, `loker`) VALUES
(1, '001', 'Admin', 'Admin', '1500-102', 'Admin', 'Admin', 'admin', 'Admin', 'Admin'),
(2, '002', 'Member', 'Member', '1500-102', 'Member', 'Member', 'member', 'Member', 'Member');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewrekap`
-- (See below for the actual view)
--
CREATE TABLE `viewrekap` (
`id` int(11)
,`kode_barang` varchar(100)
,`nama_barang` varchar(100)
,`pengirim` varchar(100)
,`tanggal` varchar(100)
,`tujuan` varchar(100)
,`operator` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `viewrekap`
--
DROP TABLE IF EXISTS `viewrekap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewrekap`  AS  select `a`.`id` AS `id`,`a`.`kode_barang` AS `kode_barang`,`a`.`nama_barang` AS `nama_barang`,`a`.`pengirim` AS `pengirim`,`a`.`tanggal` AS `tanggal`,`b`.`tujuan` AS `tujuan`,`b`.`operator` AS `operator` from (`barang_masuk` `a` join `barang_keluar` `b`) where `a`.`kode_barang` = `b`.`kode_barang` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
