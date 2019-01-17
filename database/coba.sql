-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2018 at 09:12 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `no_faktur` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `pemasukan` int(50) NOT NULL,
  `pengeluaran` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `no_faktur`, `tanggal`, `keterangan`, `pemasukan`, `pengeluaran`) VALUES
(1, '', '2018-05-01', 'Saldo awal bulan', 72480000, 0),
(10, '', '2018-05-06', 'Diambil per Bank Dana BOS SDN Binakrya Triwulan II TA. 2018', 0, 24000000),
(11, '', '2018-05-09', 'Diterima per Kas Dana BOS SDN Binakarya Triwulan II TA. 2018', 24000000, 0),
(12, '5.2.2.15.001', '2018-05-09', 'Dibayarkan transfort pengambilan Dana BOS SDN Binakrya', 0, 100000),
(13, '5.2.1.07.001', '2018-05-09', 'Dibayarkan honor pegawai honorer TT, 4 Guru TT, 1 OPS TT, dan 1 Penjaga TT, bulan April 2018', 0, 2200000),
(14, '5.2.2.06.001', '2018-05-09', 'Dibayarkan belanja cetak soal TKD Tahun Pelajaran 2017/2018', 0, 525000),
(15, '5.2.2.01.001', '2018-05-09', 'Dibayarkan belanja ATK SDN Binakarya untuk bulan April 2018', 0, 2281000),
(16, '5.2.2.37.049', '2018-05-02', 'Dibayarkan pengadaan alat praktek peraga siswa', 0, 1000000),
(17, '5.2.2.02.001', '2018-05-09', 'Dibayarkan belanja bahan baku bangunan', 0, 1500000),
(18, '5.2.2.20.003', '2018-05-09', 'Dibayarkan belanja pemeliharaan gedung/bangunan WC', 0, 1500000),
(19, '5.2.2.15.001', '2018-05-09', 'Dibayarkan transfort KKG guru SDN Binakarya bulan April 2018', 0, 400000),
(20, '5.2.1.07.001', '2018-05-09', 'Dibayarkan insentif pengelola BOS SDN Binakarya bulna April 2018', 0, 400000),
(21, '5.2.2.01.021', '2018-05-09', 'Dibayarkan makan dan minum tamu bulan April 2018', 0, 250000),
(22, '5.2.1.07.001', '2018-05-09', 'Dibayarkan honor pegawai Honorer TT, 4 Guru TT, 1 OPS TT, dan 1 Penjaga TT bulan Mei 2018', 0, 2200000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_saldo`
-- (See below for the actual view)
--
CREATE TABLE `view_saldo` (
`saldo` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_total`
-- (See below for the actual view)
--
CREATE TABLE `view_total` (
`tot_pemasukan` decimal(65,0)
,`tot_pengeluaran` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Structure for view `view_saldo`
--
DROP TABLE IF EXISTS `view_saldo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_saldo`  AS  select (`view_total`.`tot_pemasukan` - `view_total`.`tot_pengeluaran`) AS `saldo` from `view_total` ;

-- --------------------------------------------------------

--
-- Structure for view `view_total`
--
DROP TABLE IF EXISTS `view_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total`  AS  select sum(`data`.`pemasukan`) AS `tot_pemasukan`,sum(`data`.`pengeluaran`) AS `tot_pengeluaran` from `data` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
