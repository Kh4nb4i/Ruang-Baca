-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 10, 2026 at 07:34 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `th_terbit` year NOT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `no_klasifikasi` varchar(50) DEFAULT NULL,
  `id_rak` int DEFAULT NULL,
  `id_penulis` int DEFAULT NULL,
  `id_penerbit` int DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  `jumlah_eksemplar` int DEFAULT '0',
  `deskripsi` text,
  `tipe_buku` enum('Buku Umum','Skripsi') NOT NULL DEFAULT 'Buku Umum',
  `nim_penulis` varchar(50) DEFAULT NULL,
  `pembimbing1` varchar(255) DEFAULT NULL,
  `pembimbing2` varchar(255) DEFAULT NULL,
  `file_buku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `th_terbit`, `isbn`, `no_klasifikasi`, `id_rak`, `id_penulis`, `id_penerbit`, `id_kategori`, `jumlah_eksemplar`, `deskripsi`, `tipe_buku`, `nim_penulis`, `pembimbing1`, `pembimbing2`, `file_buku`) VALUES
('B001', 'Matematika', 'anastasya', 'armi print', 2010, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, 'Buku Umum', NULL, NULL, NULL, NULL),
('B002', 'RPL 2', 'Eko', 'UMK', 2020, NULL, NULL, NULL, 2, 2, NULL, 0, NULL, 'Buku Umum', NULL, NULL, NULL, NULL),
('B003', 'C++', 'Anton', 'Toni Perc', 2010, NULL, NULL, NULL, 3, 3, NULL, 0, NULL, 'Buku Umum', NULL, NULL, NULL, NULL),
('B004', 'CI 4', 'anastasya', 'armi print', 2009, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, 'Buku Umum', NULL, NULL, NULL, NULL),
('B005', 'Data Mining', 'Anton', 'Toni Perc', 2020, NULL, NULL, NULL, 3, 3, NULL, 0, NULL, 'Buku Umum', NULL, NULL, NULL, NULL),
('B006', 'Pelatihan pengolahan data bagi staf PT.Pos Indonesia Regional VII Surabaya  di UPT. Kantor pos indonesia', 'Brodjol Sutijo dkk', 'ITS press', 2019, NULL, '658.401 2 Ula p', 5, 4, 4, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Human capital management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B007', 'Prakiraan musim hujan2013/2014 di indonesia', 'BMKG', 'BMKG', 2013, NULL, '551.576 Bmk p', 2, 5, 5, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Microphysics Cloud Physics Rain and Rainfall', 'Buku Umum', NULL, NULL, NULL, NULL),
('B008', 'Analisis hujan September 2013 Dan prakiraan hujan Oktober,November,Desember 2013', 'BMKG', 'BMKG', 2013, NULL, '551.576 Bmk p', 2, 5, 5, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Microphysics Cloud Physics Rain and Rainfall', 'Buku Umum', NULL, NULL, NULL, NULL),
('B009', 'Pelatihan pengolahan data bagi staf PT.Pos Indonesia Regional VII Surabaya  di UPT. Kantor pos indonesia', 'Brodjol Sutijo dkk', 'ITS press', 2019, NULL, '658.401 2 Ula p', 5, 4, 4, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Human capital management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B010', 'Berkalah Ilmiah MIPA Majalah ilmiah matematika dan ilmu pengetahuan alam', 'Dr.Kusminarto', 'FMIPA UGM', 2002, NULL, '050 Kus b', 5, 6, 6, 7, 5, 'Tempat Terbit: Yogyakarta, Subyek: Periodicals-indxes', 'Buku Umum', NULL, NULL, NULL, NULL),
('B011', 'Applied Statistics: Analysis of variance and regression', 'Olive jean dunn & Virginia A. Clark', 'John wiley & Sons,Inc', 1974, NULL, '519.5 Oli a', 2, 7, 7, 3, 5, 'Tempat Terbit: USA, Subyek: Statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B012', 'Membangun jaringan syaraf tiruan menggunakan matlab & excel link', 'Sri kusuma dewi', 'Graha ilmu', 2004, NULL, '005.3 Sri m', 5, 8, 8, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Electronics spreadsheet-computer programs. Engineering mathematics. Excel (computer programs)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B013', 'Probability & statistics for engineers & scientists', 'Ediburgh Gate', 'Pearson', 2016, NULL, '519.024 62 Edi p', 2, 9, 9, 3, 5, 'Tempat Terbit: England, Subyek: Engineering--statistical methods Probabilities', 'Buku Umum', NULL, NULL, NULL, NULL),
('B014', 'Engineering mathematics', 'R.S.L.Srivastava', 'Tata McGraw-hill', 1982, NULL, '510.246 2 Rsl e', 2, 10, 10, 3, 5, 'Tempat Terbit: New Delhi, Subyek: Engineering mathematics Engineering mathematics--problems, exerceses', 'Buku Umum', NULL, NULL, NULL, NULL),
('B015', 'Jawaban soal-soal Statistika untuk ekonomi &  niaga', 'DR.Sudjana M.A.,M. Sc', 'Tarsito', 1984, NULL, '028.9 Sud j', 5, 11, 11, 8, 5, 'Tempat Terbit: Bandung, Subyek: Books and reading', 'Buku Umum', NULL, NULL, NULL, NULL),
('B016', 'Linear Algebra and differential equations using matlab', 'Golubitsky, Martin  ; Dellnitz, Michael', 'A Gary w. Ostedt book', 1999, NULL, '512.502 85 Gol l', 2, 12, 12, 3, 5, 'Tempat Terbit: USA, Subyek: Algebras, linear--data processing Differential equations--data processing MATLAB', 'Buku Umum', NULL, NULL, NULL, NULL),
('B017', 'Mathematical and statistical psychology', 'Smith, Philip T. S', 'The British psychological society', 1993, NULL, '519 Smi m', 2, 13, 13, 3, 5, 'Tempat Terbit: London, Subyek: Mathematical statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B018', 'Mathematical and statistical psychology', 'Smith, Philip T. S', 'The British psychological society', 1994, NULL, '519 Smi m', 2, 13, 13, 3, 5, 'Tempat Terbit: London, Subyek: Mathematical statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B019', 'Exploratory data analysis in business and economics', 'Cleff, Thomas', 'Markono print media Pte Ltd', 2014, NULL, '001.422 5 Cle e', 5, 14, 14, 5, 5, 'Tempat Terbit: Germany, Subyek: Data analysis', 'Buku Umum', NULL, NULL, NULL, NULL),
('B020', 'Handbook of design and analysis of experiments', 'Dean, Angela ; Morris, Max ; Stufken, John ; Bingham, Derek', 'Crc press', 2015, NULL, '519.5 Dea h-1', 2, 15, 15, 3, 1, 'Tempat Terbit: London, Subyek: Statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B021', 'Applied multivariate statistics for the social sciences', 'Stevens, James P.', 'Lawrence  erlbaum associates', 2002, NULL, '519.535 Ste a', 2, 16, 16, 3, 1, 'Tempat Terbit: London, Edisi: fourth edition, Subyek: multivariate analysis, statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B022', 'Applied Bioinformatics', 'Selzer, Paul M. ; Marhofer, Richard J. ;  Rohwer, Andreas', 'Springer', 2008, NULL, '572.802 85 Sel a', 2, 17, 17, 3, 1, 'Tempat Terbit: Germany, Edisi: second edition, Subyek: Bio informatics Algorithms', 'Buku Umum', NULL, NULL, NULL, NULL),
('B023', 'Linear models for unbalanced data', 'Searle, Shayle R.', 'Wiley', 2006, NULL, '519.535 Sea l', 5, 18, 18, 5, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Linear models (statistics)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B024', 'Computational Statistics Handbook with Matlab', 'Martinez, Wendy L. ; Martinez, Angel R.', 'Chapman & Hall/CRC Press', 2002, NULL, '', 2, 19, 19, 9, 1, 'Tempat Terbit: London, Edisi: first edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B025', 'Applied multivariate statistics with sas software', 'Khattree, Ravindra ; Naik, Dayanand N.', 'SAS Press', 2003, NULL, '', 2, 20, 20, 9, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B026', 'Applied econometrics with R', 'Kleiber, Christian ; Zeileis, Achim', 'Springer', 2008, NULL, '', 2, 21, 17, 9, 1, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B027', 'Basic econometrics', 'Gurajati, Damodar N.', 'Mc Graw-hill', 1995, NULL, '', 2, 22, 21, 9, 1, 'Tempat Terbit: USA, Edisi: fourth edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B028', 'Bioinformatics', 'Polanski, Andrzej ; Kimmel, Marek', 'Spinger', 2007, NULL, '', 2, 23, 22, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B029', 'Pengenalan umum analisis statistika dengan SAS 9.2 (seri 2 : analisis statistika sederhana)', 'Saefuddin, Asep ; Sartono, Bagus ; Setiabudi, Nur Andi', 'Dep Statistika Fakultas Matematika dan IPA Institut Pertanian Bogor', 2010, NULL, '', 2, 24, 23, 9, 1, 'Tempat Terbit: Bogor, Edisi: seri 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B030', 'Pengenalan umum analisis statistika dengan SAS 9.2 (seri 1 : peringkasan dan penyajian data)', 'Saefuddin, Asep ; Sartono, Bagus ; Setiabudi, Nur Andi', 'Dep Statistika Fakultas Matematika dan IPA Institut Pertanian Bogor', 2010, NULL, '658.83 Ase p', 5, 24, 23, 5, 1, 'Tempat Terbit: Bogor, Edisi: seri 1, Subyek: Marketing research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B031', 'Metode perencanaan tenaga kerja tingkat nasional, regional dan perusahaan', 'Swasono, Yudo ; Sulistyaningsih, Endang', 'BPFE Yogyakarta', 1987, NULL, '658.301 Swa m-1', 5, 25, 24, 10, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan kedua, Subyek: Manpower planning Manpower policy Personal management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B032', 'Prinsip dasar ekonomi pertanian teori dan aplikasi', 'Soekartawi', 'PT Raja Grafindo Persada', 1993, NULL, '630.141 Soe p-1', 5, 26, 25, 11, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan ketiga, Subyek: Communication in agriculture', 'Buku Umum', NULL, NULL, NULL, NULL),
('B033', 'Pengantar perencanaan pembangunan', 'Sanusi, Bachrawi', 'Fakultas ekonomi Universitas Indonesia', 2000, NULL, '333.731 506 84 San p-1', 2, 27, 26, 12, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan pertama, Subyek: Real estate-development planning', 'Buku Umum', NULL, NULL, NULL, NULL),
('B034', 'Pengantar ekonomi sumber daya manusia', 'Simanjuntak, Payaman J.', 'Fakultas ekonomi Universitas Indonesia', 1985, NULL, '', 2, 28, 26, 9, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan pertama, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B035', 'Fortran 77 a structured, disciplined style', 'Hoffmann, Davis', 'Mc Graw-hill', 1988, NULL, '', 2, 29, 21, 9, 1, 'Tempat Terbit: Singapore, Edisi: third edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B036', 'Spatial econometrics statistical foundations and applications to regional convergence', 'Arbia, Giuseppe', 'Spingers', 2006, NULL, '', 2, 30, 27, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B037', 'Spatial Econometrics  method and applications', 'Arbia, Gius ; Baltagi, Badi H.', 'Physica-verlag A spinger company', 2009, NULL, '', 2, 31, 28, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B038', 'Applied spatial data analysis with R', 'Bivand, Roger S. ; Pebesma, Edzer J. ; Rubio, Virgilio Gomez', 'Spinger', 2008, NULL, '', 5, 32, 22, 5, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B039', 'Support vector machines', 'Steinwart, Ingo ; Christmann, Andreas', 'Spinger', 2008, NULL, '', 2, 33, 22, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B040', 'Applied statistics : using SPSS, statistica, matlab and R', 'Marques de Sa, J.P.', 'Spinger', 2007, NULL, '', 2, 34, 22, 9, 1, 'Tempat Terbit: Germany, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B041', 'Modern econometric analysis', 'Hubler, Olaf ; Frohn, Joachim', 'Spinger', 2006, NULL, '', 2, 35, 22, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B042', 'Neural networks theory', 'Galushkin, Alexander I.', 'Spinger', 2007, NULL, '', 2, 36, 22, 9, 1, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B043', 'Econometrics', 'Baltagi, Badi H.', 'Spinger', 2008, NULL, '', 2, 37, 22, 9, 1, 'Tempat Terbit: Berlin, Edisi: fourth edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B044', 'Soft computing for kwoledge discovery and data mining', 'Maimon, Oded ; Rokach, Lior', 'Springer', 2008, NULL, '', 5, 38, 17, 5, 1, 'Tempat Terbit: Israel, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B045', 'Babad tanah jawi : menelusuri jejak konflik', 'Purwadi', 'Pustaka Alif', 2001, NULL, '959.82 Pur b-1', 3, 39, 29, 13, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan pertama, Subyek: Java (Indonesia)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B046', 'Riset operasi suatu pengantar', 'Taha, Hamdy A.', 'Binarupa Aksara', 1996, NULL, '003 Tah o', 5, 40, 30, 14, 1, 'Tempat Terbit: Jakarta, Edisi: edisi kelima, Subyek: operations research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B047', 'Ekonometrik', 'Supranto, J.', 'Fakultas ekonomi Universitas Indonesia', 1995, NULL, '330.015 195 Sup e-1', 2, 41, 26, 15, 1, 'Tempat Terbit: Jakarta, Edisi: buku dua, Subyek: Econometrics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B048', 'Operations research  model-model pengambilan keputusan', 'Dimyati, Tjutju Tarliah ; Dimyati, Ahmad', 'Sinar Baru Algensindo', 2004, NULL, '003 Dim o-1', 5, 42, 31, 16, 1, 'Tempat Terbit: Bandung, Edisi: cetakan ketujuh, Subyek: Operation research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B049', 'Pengantar pengendalian kualitas statistik', 'Montgomery, Douglas C.', 'Gadjah Mada University Press', 1996, NULL, '658.562 Mon p-1', 5, 43, 32, 17, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan keempat, Subyek: Quality control-statistical methodsProcess control-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B050', 'Kimia untuk Universitas', 'Keenan, Charles W. ; Kleinfelter, Donald C. ; Wood, Jesse H.', 'Erlangga', 1984, NULL, '540 Kee i-1', 2, 44, 33, 3, 1, 'Tempat Terbit: Jakarta, Edisi: edisi kelima, Subyek: Chemistry', 'Buku Umum', NULL, NULL, NULL, NULL),
('B051', 'SIG : Sistem informasi geografis tutorial ArcGis untuk bidang geodesi & geomatika', 'Prahasta, Eddy', 'Informatika', 2015, NULL, '910.285 Pra s-1', 5, 45, 34, 5, 1, 'Tempat Terbit: Bandung, Edisi: edisi revisi, Subyek: Geographic Information Systems', 'Buku Umum', NULL, NULL, NULL, NULL),
('B052', 'Introduction to optimum design', 'Arora, Jasbir S.', 'Mc Graw-hill', 1989, NULL, '620.004 25 Aro i-1', 5, 46, 21, 18, 1, 'Tempat Terbit: Singapore, Edisi: international edition, Subyek: Engineering design-mathematical models', 'Buku Umum', NULL, NULL, NULL, NULL),
('B053', 'Engineering optimization : theory and practice', 'Rao, Singiresu S.', 'Wiley', 1996, NULL, '620 Rao e-1', 5, 47, 18, 18, 1, 'Tempat Terbit: America, Edisi: third edition, Subyek: Engineering', 'Buku Umum', NULL, NULL, NULL, NULL),
('B054', 'Kumpulan soal hitung peluang dan teori statistika beserta penyelesaiannya', 'Sartono, Bagus ; Kurnia, Anang ; Bakri, Rizal ; Bodro, Dewi Kiswani', 'IPB Press', 2019, NULL, '519.5 Sar k-1', 2, 48, 35, 3, 1, 'Tempat Terbit: Bogor, Edisi: cetakan pertama, Subyek: theory statistik', 'Buku Umum', NULL, NULL, NULL, NULL),
('B055', 'Writing R. Extensions', 'R.Core Team', 'Unknown Penerbit', 2013, NULL, '519.72 Tea w-1', 2, 49, 36, 3, 5, 'Subyek: writing system', 'Buku Umum', NULL, NULL, NULL, NULL),
('B056', 'Service and operation management', 'Tasmin, Rosmaini ; Ruslan, Rumaizah', 'University Tun Hussein Onn Malaysia', 2018, NULL, '658.787 Tas s-1', 5, 50, 37, 19, 1, 'Tempat Terbit: Malaysia, Edisi: first edition, Subyek: service management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B057', 'Hari-hari terpanjang menjelang mundurnya presiden Soeharto dan beberapa peristiwa terkait', 'Luhulima, James', 'kompas', 2005, NULL, '361.24 Luh h-1', 2, 51, 38, 20, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan IV, Subyek: reformation', 'Buku Umum', NULL, NULL, NULL, NULL),
('B058', 'Exploratory data analysis in business and economics an introduction using SPSS, Stata, and Excel', 'Cleff, Thomas', 'spinger', 2011, NULL, '519.5 Cle e-1', 5, 14, 22, 5, 1, 'Tempat Terbit: Germany, Subyek: analysis system', 'Buku Umum', NULL, NULL, NULL, NULL),
('B059', 'Belajar pemrograman bahasa python', 'Wibowo, Wahyu ; Ulama, Brodjol Sutijo Suprih ; Al Azies, Harun', 'ITS press', 2020, NULL, '005.13 Wib b', 5, 52, 4, 5, 3, 'Tempat Terbit: Surabaya, Edisi: cetakan pertama, Subyek: Python (Computer program language)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B060', 'Higher education: handbook of theory and research', 'Smart, John C.', 'Kluwer academic', 2002, NULL, '378.598 Sma h-1', 2, 53, 39, 21, 1, 'Tempat Terbit: London, Edisi: volume XVII, Subyek: Education, higher', 'Buku Umum', NULL, NULL, NULL, NULL),
('B061', 'Applied multivariate statistical analysis', 'Johnson, Richard A. ; Wichern, Dean W.', 'Prentice Hall', 2002, NULL, '519.575 Joh a-1', 2, 54, 40, 3, 1, 'Tempat Terbit: USA, Edisi: fifth edition, Subyek: Multivariate analysis', 'Buku Umum', NULL, NULL, NULL, NULL),
('B062', 'Introduction to mathematical programming', 'Walker, Russell C.', 'Prentice Hall', 1999, NULL, '519.7 Wal i-1', 2, 55, 40, 3, 1, 'Tempat Terbit: USA, Subyek: Programming (mathematics)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B063', 'Discrete mathematics', 'Lipschutz, Seymour', 'Mc Graw-hill', 1976, NULL, '004.015 1 Lip d-1', 5, 56, 21, 5, 1, 'Tempat Terbit: USA, Subyek: mathematics. computer science-mathematics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B064', 'Schaums\'s outline series theory and problems of linear algebra', 'Lipschutz, Seymour', 'Mc Graw-hill', 1974, NULL, '512.5 Lip s-1', 2, 56, 21, 3, 1, 'Tempat Terbit: Singapore, Edisi: metric edition, Subyek: Algebras, linear', 'Buku Umum', NULL, NULL, NULL, NULL),
('B065', 'Integer programming', 'Wolsey, Laurence A.', 'Wiley', 1998, NULL, '519.72 Wol i-1', 2, 57, 18, 3, 1, 'Tempat Terbit: USA, Subyek: Linear programming; Integer programming', 'Buku Umum', NULL, NULL, NULL, NULL),
('B066', 'Numerical solution of stochastic differential equations', 'Kloeden, Peter E. ; Platen, Eckhard', 'Springer', 1999, NULL, '519.2 Klo n-1', 2, 58, 17, 3, 1, 'Tempat Terbit: USA, Subyek: Stochastic differential equations', 'Buku Umum', NULL, NULL, NULL, NULL),
('B067', 'Applied mathematics for business, economics, and the social sciences', 'Budnick, Frank S.', 'Mc Graw-hill', 1993, NULL, '510 Bud a-1', 2, 59, 21, 3, 1, 'Tempat Terbit: USA, Edisi: fourth edition, Subyek: Mathematics Social sciences-mathematics Biomathematics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B068', 'Arbitrage theory in continuos time', 'Bjork, Tomas', 'oxford', 2004, NULL, '', 2, 60, 41, 9, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B069', 'Asking for touble = Cari gara-gara', 'Young, Elizabeth', 'Gramedia Pustaka Utama', 2006, NULL, '808.83 You a-1', 2, 61, 42, 22, 1, 'Tempat Terbit: Jakarta, Subyek: fiction', 'Buku Umum', NULL, NULL, NULL, NULL),
('B070', 'Bergdorf blondes = Cewek-cewek berdorf', 'Sykes, Plum', 'Gramedia Pustaka Utama', 2005, NULL, '808.83 Syk b-1', 2, 62, 42, 22, 1, 'Tempat Terbit: Jakarta, Subyek: fiction', 'Buku Umum', NULL, NULL, NULL, NULL),
('B071', 'Dasar-dasar operations research', 'Subagyo, Pangestu ; Asri, Marwan ; Handoko, T. Hani', 'BPFE Yogyakarta', 1985, NULL, '519.7 Sub d', 2, 63, 24, 3, 1, 'Tempat Terbit: Yogyakarta, Edisi: edisi kedua, Subyek: Dynamic programming Integer programming', 'Buku Umum', NULL, NULL, NULL, NULL),
('B072', 'Pengendalian mutu statistis', 'Grant, Eugene L. ; Leavenworth, Richard S.', 'Erlangga', 1989, NULL, '658.568 Gra p', 5, 64, 33, 17, 1, 'Tempat Terbit: Jakarta, Edisi: Edisi keenam, Subyek: Quality control-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B073', 'Applied statistics and probability for engineering', 'Montgomery, Douglas C. ; Runger, George C.', 'Wiley', 2014, NULL, '519.5 Mon a', 2, 65, 18, 3, 1, 'Tempat Terbit: USA, Edisi: six edition, Subyek: statistics. probabilities', 'Buku Umum', NULL, NULL, NULL, NULL),
('B074', 'A primer on the taguchi method', 'Roy, Ranjit K.', 'Van Nostrand Reinhold', 1990, NULL, '658.562 Roy d', 5, 66, 43, 23, 1, 'Tempat Terbit: USA, Subyek: Quality control--statistical methods Taguchi methods (quality control)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B075', 'Probability & statistics for engineers & scientists', 'Walpole, Ronald E. ; Myers, Raymond H. ; Myers, Sharon L. ; Keying Ye', 'Pearson', 2016, NULL, '519.2 Wal p', 2, 67, 9, 3, 1, 'Tempat Terbit: USA, Edisi: Global edition, Subyek: Engineering-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B076', 'Analisis regresi terapan', 'Draper, N.R. ; Smith, H.', 'Gramedia Pustaka Utama', 1992, NULL, '519.536 Dra a', 2, 68, 42, 3, 1, 'Tempat Terbit: Jakarta, Edisi: Edisi kedua, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B077', 'Principles of Inventory Management', 'John A. Muckstadt Amar Sapra', 'Springer', 2010, NULL, '658.8 Muc p', 5, 69, 17, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B078', 'Fundamentals of quality control and improvement', 'Amitava Mitra', 'Macmillan Publishing', 1993, NULL, '6,584,013', 5, 70, 44, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B079', 'Ordinal Data Modeling', 'Valen E. Johnson', 'springer', 1998, NULL, '519.5 Joh O', 5, 71, 17, 5, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B080', 'An Introduction to Categorial Data Analysis', 'Alan Agresti', 'Wiley', 1995, NULL, '519.5 Agr c', 5, 72, 18, 5, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B081', 'Introduction to Mathematikal Statistics', 'Robert V. Hogg', 'Macmillan Publishing', 1978, NULL, '519.5 Hog I', 2, 73, 44, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B082', 'Numerical uIssues in Statistical Computing for the Social Scientist', ' Mican Altman   Jeff Gill  Michael P. McDonald', 'Wiley Interscience', 2004, NULL, '519.502 Alt N', 2, 74, 45, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B083', 'Applied Statistics and Probality for Engineers', 'Douglas C. Montgomery George  C. Runger', 'Wiley', 2014, NULL, '519.5 Mon A', 2, 75, 18, 3, 5, 'Tempat Terbit: Eropa, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B084', 'Perarson New Internasional Edition (Probability and Scientists Walpole Myers Myers Ye Ninth Edition)', 'Edinburgh Gate', 'Pearson', 2014, NULL, '519.5 Mye P', 2, 76, 9, 3, 5, 'Tempat Terbit: England, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B085', 'A First Course in Probability', 'Sheldon Ros', 'United Statis Of America', 1976, NULL, '519.5 Ros A', 2, 77, 46, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B086', '(Pengantar) Analisis Abstrak', 'Prof. Dr. Soeparna Darmawijaya', 'Universitas Gajah Mada', 2007, NULL, '519.5 Soe P', 2, 78, 47, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B087', 'Ilmu Peluang dan Statistika untuk Insinyur dan Ilmuwan', 'Ronald E Walpole & Raymond H Myers', 'ITB Bandung', 1995, NULL, '519.2 Wal I', 2, 79, 48, 3, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B088', 'Statistical Decision Theory and Bayesian Analysis', 'James O. Berger', 'Springer - Verlag', 1985, NULL, '519.542 Ber S', 2, 80, 49, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B089', 'Analisis Data Kualitatif', 'Ir. Sri Pinggit Wulandari, MS & Ir. Mutiah Salamah,M.Kes & Dra. Destri Susilaningrum', 'Institut Teknologi Sepuluh November (ITS)', 2010, NULL, '371.3 Sri a', 5, 81, 50, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B090', 'Theory Of Point Estimation', 'E. L. Lehmann', 'Wiley', 1983, NULL, '519.542 Leh T', 2, 82, 18, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B091', 'Pelatihan pengolahan data bagi staf PT.Pos Indonesia Regional VII Surabaya  di UPT. Kantor pos indonesia', 'Brodjol Sutijo dkk', 'ITS press', 2019, NULL, '658.401 2 Ula p', 5, 4, 4, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Human capital management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B092', 'Prakiraan musim hujan2013/2014 di indonesia', 'BMKG', 'BMKG', 2013, NULL, '551.576 Bmk p', 2, 5, 5, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Microphysics Cloud Physics Rain and Rainfall', 'Buku Umum', NULL, NULL, NULL, NULL),
('B093', 'Analisis hujan September 2013 Dan prakiraan hujan Oktober,November,Desember 2013', 'BMKG', 'BMKG', 2013, NULL, '551.576 Bmk p', 2, 5, 5, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Microphysics Cloud Physics Rain and Rainfall', 'Buku Umum', NULL, NULL, NULL, NULL),
('B094', 'Pelatihan pengolahan data bagi staf PT.Pos Indonesia Regional VII Surabaya  di UPT. Kantor pos indonesia', 'Brodjol Sutijo dkk', 'ITS press', 2019, NULL, '658.401 2 Ula p', 5, 4, 4, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Human capital management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B095', 'Berkalah Ilmiah MIPA Majalah ilmiah matematika dan ilmu pengetahuan alam', 'Dr.Kusminarto', 'FMIPA UGM', 2002, NULL, '050 Kus b', 5, 6, 6, 7, 5, 'Tempat Terbit: Yogyakarta, Subyek: Periodicals-indxes', 'Buku Umum', NULL, NULL, NULL, NULL),
('B096', 'Applied Statistics: Analysis of variance and regression', 'Olive jean dunn & Virginia A. Clark', 'John wiley & Sons,Inc', 1974, NULL, '519.5 Oli a', 2, 7, 7, 3, 5, 'Tempat Terbit: USA, Subyek: Statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B097', 'Membangun jaringan syaraf tiruan menggunakan matlab & excel link', 'Sri kusuma dewi', 'Graha ilmu', 2004, NULL, '005.3 Sri m', 5, 8, 8, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Electronics spreadsheet-computer programs. Engineering mathematics. Excel (computer programs)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B098', 'Probability & statistics for engineers & scientists', 'Ediburgh Gate', 'Pearson', 2016, NULL, '519.024 62 Edi p', 2, 9, 9, 3, 5, 'Tempat Terbit: England, Subyek: Engineering--statistical methods Probabilities', 'Buku Umum', NULL, NULL, NULL, NULL),
('B099', 'Engineering mathematics', 'R.S.L.Srivastava', 'Tata McGraw-hill', 1982, NULL, '510.246 2 Rsl e', 2, 10, 10, 3, 5, 'Tempat Terbit: New Delhi, Subyek: Engineering mathematics Engineering mathematics--problems, exerceses', 'Buku Umum', NULL, NULL, NULL, NULL),
('B100', 'Jawaban soal-soal Statistika untuk ekonomi &  niaga', 'DR.Sudjana M.A.,M. Sc', 'Tarsito', 1984, NULL, '028.9 Sud j', 5, 11, 11, 8, 5, 'Tempat Terbit: Bandung, Subyek: Books and reading', 'Buku Umum', NULL, NULL, NULL, NULL),
('B101', 'Linear Algebra and differential equations using matlab', 'Golubitsky, Martin  ; Dellnitz, Michael', 'A Gary w. Ostedt book', 1999, NULL, '512.502 85 Gol l', 2, 12, 12, 3, 5, 'Tempat Terbit: USA, Subyek: Algebras, linear--data processing Differential equations--data processing MATLAB', 'Buku Umum', NULL, NULL, NULL, NULL),
('B102', 'Mathematical and statistical psychology', 'Smith, Philip T. S', 'The British psychological society', 1993, NULL, '519 Smi m', 2, 13, 13, 3, 5, 'Tempat Terbit: London, Subyek: Mathematical statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B103', 'Mathematical and statistical psychology', 'Smith, Philip T. S', 'The British psychological society', 1994, NULL, '519 Smi m', 2, 13, 13, 3, 5, 'Tempat Terbit: London, Subyek: Mathematical statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B104', 'Exploratory data analysis in business and economics', 'Cleff, Thomas', 'Markono print media Pte Ltd', 2014, NULL, '001.422 5 Cle e', 5, 14, 14, 5, 5, 'Tempat Terbit: Germany, Subyek: Data analysis', 'Buku Umum', NULL, NULL, NULL, NULL),
('B105', 'Handbook of design and analysis of experiments', 'Dean, Angela ; Morris, Max ; Stufken, John ; Bingham, Derek', 'Crc press', 2015, NULL, '519.5 Dea h-1', 2, 15, 15, 3, 1, 'Tempat Terbit: London, Subyek: Statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B106', 'Applied multivariate statistics for the social sciences', 'Stevens, James P.', 'Lawrence  erlbaum associates', 2002, NULL, '519.535 Ste a', 2, 16, 16, 3, 1, 'Tempat Terbit: London, Edisi: fourth edition, Subyek: multivariate analysis, statistics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B107', 'Applied Bioinformatics', 'Selzer, Paul M. ; Marhofer, Richard J. ;  Rohwer, Andreas', 'Springer', 2008, NULL, '572.802 85 Sel a', 2, 17, 17, 3, 1, 'Tempat Terbit: Germany, Edisi: second edition, Subyek: Bio informatics Algorithms', 'Buku Umum', NULL, NULL, NULL, NULL),
('B108', 'Linear models for unbalanced data', 'Searle, Shayle R.', 'Wiley', 2006, NULL, '519.535 Sea l', 5, 18, 18, 5, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Linear models (statistics)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B109', 'Computational Statistics Handbook with Matlab', 'Martinez, Wendy L. ; Martinez, Angel R.', 'Chapman & Hall/CRC Press', 2002, NULL, '', 2, 19, 19, 9, 1, 'Tempat Terbit: London, Edisi: first edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B110', 'Applied multivariate statistics with sas software', 'Khattree, Ravindra ; Naik, Dayanand N.', 'SAS Press', 2003, NULL, '', 2, 20, 20, 9, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B111', 'Applied econometrics with R', 'Kleiber, Christian ; Zeileis, Achim', 'Springer', 2008, NULL, '', 2, 21, 17, 9, 1, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B112', 'Basic econometrics', 'Gurajati, Damodar N.', 'Mc Graw-hill', 1995, NULL, '', 2, 22, 21, 9, 1, 'Tempat Terbit: USA, Edisi: fourth edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B113', 'Bioinformatics', 'Polanski, Andrzej ; Kimmel, Marek', 'Spinger', 2007, NULL, '', 2, 23, 22, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B114', 'Pengenalan umum analisis statistika dengan SAS 9.2 (seri 2 : analisis statistika sederhana)', 'Saefuddin, Asep ; Sartono, Bagus ; Setiabudi, Nur Andi', 'Dep Statistika Fakultas Matematika dan IPA Institut Pertanian Bogor', 2010, NULL, '', 2, 24, 23, 9, 1, 'Tempat Terbit: Bogor, Edisi: seri 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B115', 'Pengenalan umum analisis statistika dengan SAS 9.2 (seri 1 : peringkasan dan penyajian data)', 'Saefuddin, Asep ; Sartono, Bagus ; Setiabudi, Nur Andi', 'Dep Statistika Fakultas Matematika dan IPA Institut Pertanian Bogor', 2010, NULL, '658.83 Ase p', 5, 24, 23, 5, 1, 'Tempat Terbit: Bogor, Edisi: seri 1, Subyek: Marketing research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B116', 'Metode perencanaan tenaga kerja tingkat nasional, regional dan perusahaan', 'Swasono, Yudo ; Sulistyaningsih, Endang', 'BPFE Yogyakarta', 1987, NULL, '658.301 Swa m-1', 5, 25, 24, 10, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan kedua, Subyek: Manpower planning Manpower policy Personal management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B117', 'Prinsip dasar ekonomi pertanian teori dan aplikasi', 'Soekartawi', 'PT Raja Grafindo Persada', 1993, NULL, '630.141 Soe p-1', 5, 26, 25, 11, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan ketiga, Subyek: Communication in agriculture', 'Buku Umum', NULL, NULL, NULL, NULL),
('B118', 'Pengantar perencanaan pembangunan', 'Sanusi, Bachrawi', 'Fakultas ekonomi Universitas Indonesia', 2000, NULL, '333.731 506 84 San p-1', 2, 27, 26, 12, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan pertama, Subyek: Real estate-development planning', 'Buku Umum', NULL, NULL, NULL, NULL),
('B119', 'Pengantar ekonomi sumber daya manusia', 'Simanjuntak, Payaman J.', 'Fakultas ekonomi Universitas Indonesia', 1985, NULL, '', 2, 28, 26, 9, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan pertama, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B120', 'Fortran 77 a structured, disciplined style', 'Hoffmann, Davis', 'Mc Graw-hill', 1988, NULL, '', 2, 29, 21, 9, 1, 'Tempat Terbit: Singapore, Edisi: third edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B121', 'Spatial econometrics statistical foundations and applications to regional convergence', 'Arbia, Giuseppe', 'Spingers', 2006, NULL, '', 2, 30, 27, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B122', 'Spatial Econometrics  method and applications', 'Arbia, Gius ; Baltagi, Badi H.', 'Physica-verlag A spinger company', 2009, NULL, '', 2, 31, 28, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B123', 'Applied spatial data analysis with R', 'Bivand, Roger S. ; Pebesma, Edzer J. ; Rubio, Virgilio Gomez', 'Spinger', 2008, NULL, '', 5, 32, 22, 5, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B124', 'Support vector machines', 'Steinwart, Ingo ; Christmann, Andreas', 'Spinger', 2008, NULL, '', 2, 33, 22, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B125', 'Applied statistics : using SPSS, statistica, matlab and R', 'Marques de Sa, J.P.', 'Spinger', 2007, NULL, '', 2, 34, 22, 9, 1, 'Tempat Terbit: Germany, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B126', 'Modern econometric analysis', 'Hubler, Olaf ; Frohn, Joachim', 'Spinger', 2006, NULL, '', 2, 35, 22, 9, 1, 'Tempat Terbit: Germany, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B127', 'Neural networks theory', 'Galushkin, Alexander I.', 'Spinger', 2007, NULL, '', 2, 36, 22, 9, 1, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B128', 'Econometrics', 'Baltagi, Badi H.', 'Spinger', 2008, NULL, '', 2, 37, 22, 9, 1, 'Tempat Terbit: Berlin, Edisi: fourth edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B129', 'Soft computing for kwoledge discovery and data mining', 'Maimon, Oded ; Rokach, Lior', 'Springer', 2008, NULL, '', 5, 38, 17, 5, 1, 'Tempat Terbit: Israel, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B130', 'Babad tanah jawi : menelusuri jejak konflik', 'Purwadi', 'Pustaka Alif', 2001, NULL, '959.82 Pur b-1', 3, 39, 29, 13, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan pertama, Subyek: Java (Indonesia)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B131', 'Riset operasi suatu pengantar', 'Taha, Hamdy A.', 'Binarupa Aksara', 1996, NULL, '003 Tah o', 5, 40, 30, 14, 1, 'Tempat Terbit: Jakarta, Edisi: edisi kelima, Subyek: operations research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B132', 'Ekonometrik', 'Supranto, J.', 'Fakultas ekonomi Universitas Indonesia', 1995, NULL, '330.015 195 Sup e-1', 2, 41, 26, 15, 1, 'Tempat Terbit: Jakarta, Edisi: buku dua, Subyek: Econometrics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B133', 'Operations research  model-model pengambilan keputusan', 'Dimyati, Tjutju Tarliah ; Dimyati, Ahmad', 'Sinar Baru Algensindo', 2004, NULL, '003 Dim o-1', 5, 42, 31, 16, 1, 'Tempat Terbit: Bandung, Edisi: cetakan ketujuh, Subyek: Operation research', 'Buku Umum', NULL, NULL, NULL, NULL),
('B134', 'Pengantar pengendalian kualitas statistik', 'Montgomery, Douglas C.', 'Gadjah Mada University Press', 1996, NULL, '658.562 Mon p-1', 5, 43, 32, 17, 1, 'Tempat Terbit: Yogyakarta, Edisi: cetakan keempat, Subyek: Quality control-statistical methodsProcess control-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B135', 'Kimia untuk Universitas', 'Keenan, Charles W. ; Kleinfelter, Donald C. ; Wood, Jesse H.', 'Erlangga', 1984, NULL, '540 Kee i-1', 2, 44, 33, 3, 1, 'Tempat Terbit: Jakarta, Edisi: edisi kelima, Subyek: Chemistry', 'Buku Umum', NULL, NULL, NULL, NULL),
('B136', 'SIG : Sistem informasi geografis tutorial ArcGis untuk bidang geodesi & geomatika', 'Prahasta, Eddy', 'Informatika', 2015, NULL, '910.285 Pra s-1', 5, 45, 34, 5, 1, 'Tempat Terbit: Bandung, Edisi: edisi revisi, Subyek: Geographic Information Systems', 'Buku Umum', NULL, NULL, NULL, NULL),
('B137', 'Introduction to optimum design', 'Arora, Jasbir S.', 'Mc Graw-hill', 1989, NULL, '620.004 25 Aro i-1', 5, 46, 21, 18, 1, 'Tempat Terbit: Singapore, Edisi: international edition, Subyek: Engineering design-mathematical models', 'Buku Umum', NULL, NULL, NULL, NULL),
('B138', 'Engineering optimization : theory and practice', 'Rao, Singiresu S.', 'Wiley', 1996, NULL, '620 Rao e-1', 5, 47, 18, 18, 1, 'Tempat Terbit: America, Edisi: third edition, Subyek: Engineering', 'Buku Umum', NULL, NULL, NULL, NULL),
('B139', 'Kumpulan soal hitung peluang dan teori statistika beserta penyelesaiannya', 'Sartono, Bagus ; Kurnia, Anang ; Bakri, Rizal ; Bodro, Dewi Kiswani', 'IPB Press', 2019, NULL, '519.5 Sar k-1', 2, 48, 35, 3, 1, 'Tempat Terbit: Bogor, Edisi: cetakan pertama, Subyek: theory statistik', 'Buku Umum', NULL, NULL, NULL, NULL),
('B140', 'Writing R. Extensions', 'R.Core Team', 'Unknown Penerbit', 2013, NULL, '519.72 Tea w-1', 2, 49, 36, 3, 5, 'Subyek: writing system', 'Buku Umum', NULL, NULL, NULL, NULL),
('B141', 'Service and operation management', 'Tasmin, Rosmaini ; Ruslan, Rumaizah', 'University Tun Hussein Onn Malaysia', 2018, NULL, '658.787 Tas s-1', 5, 50, 37, 19, 1, 'Tempat Terbit: Malaysia, Edisi: first edition, Subyek: service management', 'Buku Umum', NULL, NULL, NULL, NULL),
('B142', 'Hari-hari terpanjang menjelang mundurnya presiden Soeharto dan beberapa peristiwa terkait', 'Luhulima, James', 'kompas', 2005, NULL, '361.24 Luh h-1', 2, 51, 38, 20, 1, 'Tempat Terbit: Jakarta, Edisi: cetakan IV, Subyek: reformation', 'Buku Umum', NULL, NULL, NULL, NULL),
('B143', 'Exploratory data analysis in business and economics an introduction using SPSS, Stata, and Excel', 'Cleff, Thomas', 'spinger', 2011, NULL, '519.5 Cle e-1', 5, 14, 22, 5, 1, 'Tempat Terbit: Germany, Subyek: analysis system', 'Buku Umum', NULL, NULL, NULL, NULL),
('B144', 'Belajar pemrograman bahasa python', 'Wibowo, Wahyu ; Ulama, Brodjol Sutijo Suprih ; Al Azies, Harun', 'ITS press', 2020, NULL, '005.13 Wib b', 5, 52, 4, 5, 3, 'Tempat Terbit: Surabaya, Edisi: cetakan pertama, Subyek: Python (Computer program language)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B145', 'Higher education: handbook of theory and research', 'Smart, John C.', 'Kluwer academic', 2002, NULL, '378.598 Sma h-1', 2, 53, 39, 21, 1, 'Tempat Terbit: London, Edisi: volume XVII, Subyek: Education, higher', 'Buku Umum', NULL, NULL, NULL, NULL),
('B146', 'Applied multivariate statistical analysis', 'Johnson, Richard A. ; Wichern, Dean W.', 'Prentice Hall', 2002, NULL, '519.575 Joh a-1', 2, 54, 40, 3, 1, 'Tempat Terbit: USA, Edisi: fifth edition, Subyek: Multivariate analysis', 'Buku Umum', NULL, NULL, NULL, NULL),
('B147', 'Introduction to mathematical programming', 'Walker, Russell C.', 'Prentice Hall', 1999, NULL, '519.7 Wal i-1', 2, 55, 40, 3, 1, 'Tempat Terbit: USA, Subyek: Programming (mathematics)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B148', 'Discrete mathematics', 'Lipschutz, Seymour', 'Mc Graw-hill', 1976, NULL, '004.015 1 Lip d-1', 5, 56, 21, 5, 1, 'Tempat Terbit: USA, Subyek: mathematics. computer science-mathematics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B149', 'Schaums\'s outline series theory and problems of linear algebra', 'Lipschutz, Seymour', 'Mc Graw-hill', 1974, NULL, '512.5 Lip s-1', 2, 56, 21, 3, 1, 'Tempat Terbit: Singapore, Edisi: metric edition, Subyek: Algebras, linear', 'Buku Umum', NULL, NULL, NULL, NULL),
('B150', 'Integer programming', 'Wolsey, Laurence A.', 'Wiley', 1998, NULL, '519.72 Wol i-1', 2, 57, 18, 3, 1, 'Tempat Terbit: USA, Subyek: Linear programming; Integer programming', 'Buku Umum', NULL, NULL, NULL, NULL),
('B151', 'Numerical solution of stochastic differential equations', 'Kloeden, Peter E. ; Platen, Eckhard', 'Springer', 1999, NULL, '519.2 Klo n-1', 2, 58, 17, 3, 1, 'Tempat Terbit: USA, Subyek: Stochastic differential equations', 'Buku Umum', NULL, NULL, NULL, NULL),
('B152', 'Applied mathematics for business, economics, and the social sciences', 'Budnick, Frank S.', 'Mc Graw-hill', 1993, NULL, '510 Bud a-1', 2, 59, 21, 3, 1, 'Tempat Terbit: USA, Edisi: fourth edition, Subyek: Mathematics Social sciences-mathematics Biomathematics', 'Buku Umum', NULL, NULL, NULL, NULL),
('B153', 'Arbitrage theory in continuos time', 'Bjork, Tomas', 'oxford', 2004, NULL, '', 2, 60, 41, 9, 1, 'Tempat Terbit: USA, Edisi: second edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B154', 'Asking for touble = Cari gara-gara', 'Young, Elizabeth', 'Gramedia Pustaka Utama', 2006, NULL, '808.83 You a-1', 2, 61, 42, 22, 1, 'Tempat Terbit: Jakarta, Subyek: fiction', 'Buku Umum', NULL, NULL, NULL, NULL),
('B155', 'Bergdorf blondes = Cewek-cewek berdorf', 'Sykes, Plum', 'Gramedia Pustaka Utama', 2005, NULL, '808.83 Syk b-1', 2, 62, 42, 22, 1, 'Tempat Terbit: Jakarta, Subyek: fiction', 'Buku Umum', NULL, NULL, NULL, NULL),
('B156', 'Dasar-dasar operations research', 'Subagyo, Pangestu ; Asri, Marwan ; Handoko, T. Hani', 'BPFE Yogyakarta', 1985, NULL, '519.7 Sub d', 2, 63, 24, 3, 1, 'Tempat Terbit: Yogyakarta, Edisi: edisi kedua, Subyek: Dynamic programming Integer programming', 'Buku Umum', NULL, NULL, NULL, NULL),
('B157', 'Pengendalian mutu statistis', 'Grant, Eugene L. ; Leavenworth, Richard S.', 'Erlangga', 1989, NULL, '658.568 Gra p', 5, 64, 33, 17, 1, 'Tempat Terbit: Jakarta, Edisi: Edisi keenam, Subyek: Quality control-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B158', 'Applied statistics and probability for engineering', 'Montgomery, Douglas C. ; Runger, George C.', 'Wiley', 2014, NULL, '519.5 Mon a', 2, 65, 18, 3, 1, 'Tempat Terbit: USA, Edisi: six edition, Subyek: statistics. probabilities', 'Buku Umum', NULL, NULL, NULL, NULL),
('B159', 'A primer on the taguchi method', 'Roy, Ranjit K.', 'Van Nostrand Reinhold', 1990, NULL, '658.562 Roy d', 5, 66, 43, 23, 1, 'Tempat Terbit: USA, Subyek: Quality control--statistical methods Taguchi methods (quality control)', 'Buku Umum', NULL, NULL, NULL, NULL),
('B160', 'Probability & statistics for engineers & scientists', 'Walpole, Ronald E. ; Myers, Raymond H. ; Myers, Sharon L. ; Keying Ye', 'Pearson', 2016, NULL, '519.2 Wal p', 2, 67, 9, 3, 1, 'Tempat Terbit: USA, Edisi: Global edition, Subyek: Engineering-statistical methods', 'Buku Umum', NULL, NULL, NULL, NULL),
('B161', 'Analisis regresi terapan', 'Draper, N.R. ; Smith, H.', 'Gramedia Pustaka Utama', 1992, NULL, '519.536 Dra a', 2, 68, 42, 3, 1, 'Tempat Terbit: Jakarta, Edisi: Edisi kedua, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B162', 'Principles of Inventory Management', 'John A. Muckstadt Amar Sapra', 'Springer', 2010, NULL, '658.8 Muc p', 5, 69, 17, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B163', 'Fundamentals of quality control and improvement', 'Amitava Mitra', 'Macmillan Publishing', 1993, NULL, '6,584,013', 5, 70, 44, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B164', 'Ordinal Data Modeling', 'Valen E. Johnson', 'springer', 1998, NULL, '519.5 Joh O', 5, 71, 17, 5, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B165', 'An Introduction to Categorial Data Analysis', 'Alan Agresti', 'Wiley', 1995, NULL, '519.5 Agr c', 5, 72, 18, 5, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B166', 'Introduction to Mathematikal Statistics', 'Robert V. Hogg', 'Macmillan Publishing', 1978, NULL, '519.5 Hog I', 2, 73, 44, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B167', 'Numerical uIssues in Statistical Computing for the Social Scientist', ' Mican Altman   Jeff Gill  Michael P. McDonald', 'Wiley Interscience', 2004, NULL, '519.502 Alt N', 2, 74, 45, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B168', 'Applied Statistics and Probality for Engineers', 'Douglas C. Montgomery George  C. Runger', 'Wiley', 2014, NULL, '519.5 Mon A', 2, 75, 18, 3, 5, 'Tempat Terbit: Eropa, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B169', 'Perarson New Internasional Edition (Probability and Scientists Walpole Myers Myers Ye Ninth Edition)', 'Edinburgh Gate', 'Pearson', 2014, NULL, '519.5 Mye P', 2, 76, 9, 3, 5, 'Tempat Terbit: England, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B170', 'A First Course in Probability', 'Sheldon Ros', 'United Statis Of America', 1976, NULL, '519.5 Ros A', 2, 77, 46, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B171', '(Pengantar) Analisis Abstrak', 'Prof. Dr. Soeparna Darmawijaya', 'Universitas Gajah Mada', 2007, NULL, '519.5 Soe P', 2, 78, 47, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B172', 'Ilmu Peluang dan Statistika untuk Insinyur dan Ilmuwan', 'Ronald E Walpole & Raymond H Myers', 'ITB Bandung', 1995, NULL, '519.2 Wal I', 2, 79, 48, 3, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B173', 'Statistical Decision Theory and Bayesian Analysis', 'James O. Berger', 'Springer - Verlag', 1985, NULL, '519.542 Ber S', 2, 80, 49, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B174', 'Analisis Data Kualitatif', 'Ir. Sri Pinggit Wulandari, MS & Ir. Mutiah Salamah,M.Kes & Dra. Destri Susilaningrum', 'Institut Teknologi Sepuluh November (ITS)', 2010, NULL, '371.3 Sri a', 5, 81, 50, 5, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B175', 'Theory Of Point Estimation', 'E. L. Lehmann', 'Wiley', 1983, NULL, '519.542 Leh T', 2, 82, 18, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B176', 'Statistical Inference under Order Restrictions', 'R. E. Barlow & D. J. Bartholomew and J. M. Bremner & H. D. Brunk', 'Wiley', 2020, NULL, '519.5 Bar S', 2, 83, 18, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B177', 'Nonparametric Function Estimation, Modeling, and Simulation', 'James R. Thompson & Richard A Tapia', 'Siam', 1980, NULL, '519.5 Tho N', 2, 84, 51, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B178', 'Statistik Nonparametri Untuk Ilmu-Ilmu Sosial', 'Sidney Siegel', 'Gramedia', 1992, NULL, '519.5 Sie S', 2, 85, 52, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B179', 'Sampling Methods For Applied Research', 'Peter Tryfos', 'Wiley', 1996, NULL, '519.52 Try S', 2, 86, 18, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B180', 'Statistical Concepts And Methods', 'Gouri K. Bhattacharyya & Richard A. Johnson', 'Wiley', 1977, NULL, '519.5 Bha S', 2, 87, 18, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B181', 'Reproducing Kernel Hilbert Spaces In Probability And Statistic', 'Alanin Berlinet & Christine Thomas-Agnan', 'Kluwer Academic Publishers', 2004, NULL, '519.2 Ber R', 2, 88, 53, 3, 5, 'Tempat Terbit: France, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B182', 'Statistical Analysis of Financial Data in S-Plus', 'Rene A. Carmona', 'Springer', 2004, NULL, '519.502 Car S', 5, 89, 17, 5, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B183', 'Pengantar Metode Statistik Jilid II', 'Anto Dajan', 'PT. Pertja', 1984, NULL, '519.5 Daj P', 2, 90, 54, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B184', 'MATLAB (High-Performance Numeric Computation and Visualization Software', 'Matlab', 'User\'s Guide', 1992, NULL, '519.402 Gui M', 2, 91, 55, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B185', 'Materi Pokok Struktur Data Statistik', 'Dr. Maman A. Djauhari', 'Departemen Pendidikan Dan Kebudayaan Universitas Terbuka', 1998, NULL, '519.5 Dja M', 5, 92, 56, 5, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B186', 'Applied Nonparametric Regression', 'Wolfgang Hardle', 'Humboldt - Universitat Zu Berlin spandaver Str.1', 1994, NULL, 'D 10178', 2, 93, 57, 9, 5, 'Tempat Terbit: Berlin, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B187', 'Modeling Analysis,Design,and Control Of Stochastic Systems', 'V.G. Kulkarni', 'Springer', 1999, NULL, 'NC 27599', 2, 94, 17, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B188', 'Statistics for Business and Economics', 'Anderson Sweeney', 'South - Western', 2009, NULL, 'OH 45040', 2, 95, 58, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B189', 'Simulation and Monte Carlo', 'J.S Dagpunar', 'Willey', 2007, NULL, 'PO19 8SQ', 2, 96, 59, 9, 5, 'Tempat Terbit: England, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B190', 'Simulation Modeling And Analysis', 'W.David Kelton', 'Industrial Engineering Series', 1991, NULL, 'QA76.9.C65L38', 2, 97, 60, 9, 5, 'Tempat Terbit: Singapore, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B191', 'Pengenalan Komputer', 'Prof.Dr.Jogiyanto H.M, M.B.A.,Akt.', 'Andi Yogyakarta', 1999, NULL, 'DDC 21004', 5, 98, 61, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B192', 'Sas/Stat Guide for personal Computers', 'Dwiratmono Agus Widodo', 'SAS Institute INC', 1987, NULL, 'NC 27512', 2, 99, 62, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B193', 'The Elements Of Statistical Learning', 'Robert Tibshirani', 'Springer', 2001, NULL, 'CA 94305-5405', 2, 100, 17, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B194', 'Sas/Stat Guide for personal Computers', 'Wiwiek Suleman', 'SAS Institute INC', 1987, NULL, 'NC 27512', 2, 101, 62, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B195', 'Sistem Komputer Manajemen Lindo', 'Siswanto', 'PT ELEX MEDIA KOMPUTINDO KELOMPOK GRAMEDIA', 1990, NULL, '12190076', 5, 102, 63, 5, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B196', 'Sistem Basis Data', 'Edhy Sutanta', 'GRAHA ILMU', 2004, NULL, '126500703', 5, 103, 8, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B197', 'Metode Research', 'Prof.Dr.S. Nasutio.M.A', 'JEMMARS', 1991, NULL, '28093011', 2, 104, 64, 9, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B198', 'Penuntun Praktis Belajar Database Menggunakan Microsoft Access', 'Abdul Kadir', 'Andi Yogyakarta', 2002, NULL, 'DCC 21 005 437 69', 5, 105, 61, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B199', 'Soft Computing in Data Science', 'Azlinah Mohammed', 'Springer', 2017, NULL, '2017959596', 5, 106, 17, 5, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B200', 'Sampling Techniques', 'William G. Cochran', 'John Wiley', 1977, NULL, '276 6 C6', 2, 107, 65, 9, 5, 'Tempat Terbit: Singapore, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B201', 'An Introduction To Stochastic Modeling', 'Howard M. Taylor', 'Academic Press', 1998, NULL, 'MA 02167', 2, 108, 66, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B202', 'Teknik Sampling', 'Dra. Destri Susila Ningrum. MSI ', 'Institut Teknologi Sepuluh November (ITS)', 2002, NULL, '1.433 Sus T', 2, 109, 50, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B203', 'The Statistical Analysis of failure Time Data', 'John D.Kalbfleisch', 'Wiley Interscience', 2008, NULL, '006 312', 5, 110, 45, 5, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL);
INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `th_terbit`, `isbn`, `no_klasifikasi`, `id_rak`, `id_penulis`, `id_penerbit`, `id_kategori`, `jumlah_eksemplar`, `deskripsi`, `tipe_buku`, `nim_penulis`, `pembimbing1`, `pembimbing2`, `file_buku`) VALUES
('B204', 'Longitudinal Data Analysis', 'garret Fitzmaurice', 'CRC Press', 2009, NULL, '001  42', 5, 111, 15, 5, 5, 'Tempat Terbit: Belgium, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B205', 'Pak Beye Dan Istananya', 'Muhammad Bayu Setiadi', 'PT Kompas Media Nusantara', 2010, NULL, '923159', 3, 112, 67, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B206', 'Perjalanan Pemikiran Konsep Pemasaran', 'Hermawan Kartajaya', 'Erlangga', 2003, NULL, '13740', 2, 113, 33, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B207', 'Kamus Inggris Indonesia', ' John M. Echols', 'PT Gramedia Pustaka Utama,Jakarta', 1975, NULL, 'GM 214 88 451', 2, 114, 68, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B208', 'Jam Belajar Komputer Microsoft Excel 2000', 'Budi Permana', 'Elex Media Komputindo', 2000, NULL, '12100015', 5, 115, 69, 5, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B209', 'Experimental Design', 'John Willey', 'Wiley', 1950, NULL, '001 43 Coc', 5, 116, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B210', 'Panduan Dasar Spss', 'Edy Winarno ST,M.Eng', 'Elex Media Komputindo', 2015, NULL, '121151023', 2, 117, 69, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B211', '99 Inspiras Kehidupan', ' Joni Hermana', 'Joni Hermana.Self Publishing', 2019, NULL, '177.7', 2, 118, 70, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B212', 'Metode Penelitian Survei', 'Masri Singarimbun', 'LP3ES,Jakarta,Anggota IKAPI', 1982, NULL, '001 42', 5, 119, 71, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B213', 'Stable Non Gausian Random Processes', ' Gennady sanorodnitsky Murad S. Taqqu', 'Chapman & Hall', 1994, NULL, 'NY 10119', 2, 120, 72, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B214', 'Aplikasi Pemodelan Rasch', 'Bambang Sumintono', 'wahyu Widhiarso', 2015, NULL, '40513', 4, 121, 73, 9, 5, 'Tempat Terbit: Cimahi, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B215', 'Sistem Simulasi', 'Thomas J.Kakiay', 'Andi Yogyakarta', 2004, NULL, 'DDc 21 003 3', 2, 122, 61, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B216', 'Pemrograman Microsoft Visual Basic 6', 'Adi Kurniadi', 'PT Elex Media Komputindo', 2000, NULL, '1210086', 5, 123, 74, 5, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B217', 'An Introduction Categorical Data Analysis', ' Alan Agresti', 'Wiley', 1996, NULL, 'QA 278 A 355', 5, 124, 18, 5, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B218', 'Kartun Statistik', 'Larry Gonick', 'Kepustakaan Populer Gramedia', 1933, NULL, '741 5', 2, 125, 75, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B219', 'Kartun Statistik', 'Larry Gonick', 'Kepustakaan Populer Gramedia', 1933, NULL, '741 5', 2, 125, 75, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B220', 'Statistika', 'Prof.DR.Sudjana, M. A.,M.Sc.', 'Tarsito', 2000, NULL, '330 021', 2, 126, 11, 9, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B221', 'Nonparametric Regression and Generalized Linear Models', 'J.Green ', 'Chaoman & Hall', 1994, NULL, '519 5', 2, 127, 76, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B222', 'Metode Numerik Untuk Teknik', 'Steven C.Chapra,Raymond P.Canale', 'Universitas  Indonesia', 1991, NULL, '519', 2, 128, 77, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B223', 'Asymptotic Statistics', 'A.W. Van Der Vaart', 'Cambridge University', 1998, NULL, 'CB2 2RU', 2, 129, 78, 9, 5, 'Tempat Terbit: Australia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B224', 'Smoothing Techniques', 'J.Berger.s.Feinberg', 'Springer', 1990, NULL, 'QA 278 H 348', 2, 130, 17, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B225', 'Statistika Matematis Lanjutan', 'Drs.Nar Herrhyanto, M.Pd.', 'CV. Pustaka Setia', 2003, NULL, '40253', 4, 131, 79, 9, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B226', 'Stastical Inference', 'Roger L.Berger', 'Duxbury', 1990, NULL, 'QA 276 C37', 2, 132, 80, 9, 5, 'Tempat Terbit: C alifornia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B227', 'Pelatihan Statistical Process Control Untuk Umum', 'Drs.Haryono, MSIE', 'Institut Teknologi Sepuluh November (ITS)', 1996, NULL, '519 86', 2, 133, 50, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B228', 'Statistical Process Control', 'Unknown Penulis', 'Institut Teknologi Sepuluh November (ITS)', 1995, NULL, '519 86', 2, 134, 50, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B229', 'Statiscal Process Control', 'Unknown Penulis', 'Institut Teknologi Sepuluh November (ITS)', 1996, NULL, '51989', 2, 134, 50, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B230', 'statistical Econometrics', 'John Aliano', 'Schaum\'s Outlines', 1982, NULL, '519 5', 2, 135, 81, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B231', 'An Introduction to Categorial Data Analysis', 'Alan Agresti', 'Wiley', 1996, NULL, 'NY 10158', 5, 72, 18, 5, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B232', 'Causal Inference In Statistics', 'Judea Perl', 'Wiley', 2016, NULL, 'PO19 8SQ', 2, 136, 18, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B233', 'An Introduction Numerical Analysis', 'Kendal E.Atkinson', 'Wiley', 1978, NULL, 'QA 297 A84', 2, 137, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B234', 'Numerical Methods Using Matlab', 'George Lindfield', 'Prentice Hall', 2000, NULL, 'QA 297 P45', 2, 138, 40, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B235', 'Metode Numerik', 'Steven  C. Chapra', 'Erlangga', 1998, NULL, '519', 2, 139, 33, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B236', 'Approximation Theorems of Mathemathical Statistics', 'John Willey', 'Serfling', 1980, NULL, 'QA276 S45', 2, 116, 82, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B237', 'Stastical For Experimenters', 'George E.P.BOX', 'Wiley', 1978, NULL, 'QA 279 B68', 2, 140, 18, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B238', 'Teori Statistika', 'Andi Hakim Nasution', 'Bhratara Karya Aksara', 1984, NULL, '519', 2, 141, 83, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B239', 'Statistika Inferens Untuk Ekonomi Dan Niaga', 'Prof.DR.Sudjana, M. A.,M.Sc.', 'Tarsito', 1990, NULL, '519 5', 2, 126, 11, 3, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B240', 'Statistika Inferens Untuk Ekonomi Dan Niaga II Edisi Baru', 'Prof.Dr.Sudjana,M.A.,M.Sc.', 'Tarsito', 1982, NULL, '519 5', 2, 142, 11, 3, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B241', 'An Introduction to Optimization', 'Edwin K.P.Chong.', 'Wiley', 1996, NULL, '519 6', 2, 143, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B242', 'The Mathematichs of Nonlinear Programming', 'A.L.Peressini', 'Springer', 1988, NULL, '519 72', 2, 144, 17, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B243', 'Pengantar Analisis Real', 'Prof.Dr.Soeparna Darmawijaya', 'Universitas Gajah Mada', 2006, NULL, '519 5', 2, 145, 47, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B244', 'Applied Multivariate Analysis', 'Neil H. Timm', 'Springer', 2002, NULL, 'QA 278 t53', 2, 146, 17, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B245', 'Regression analysis of count Data', 'Pravin K.Trivedi', 'Cambridge University', 1998, NULL, '519 536', 5, 147, 78, 5, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B246', 'Probabillity And statistical inference', 'Robert Bartoszynski', 'wiley', 1996, NULL, '519 2', 2, 148, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B247', 'Regression Analysis Theory,Methods,and Applications', 'Ashish Sen', 'Springer', 1990, NULL, 'QA 278 2 S46', 2, 149, 17, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B248', 'Probability And Measure', 'Patrick Billingsley', 'Wiley', 1979, NULL, 'QA 273 B575', 2, 150, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B249', 'Applied Multivariate Statistical Analysis', 'Wolfgang Karl Hardle', 'Springer', 2003, NULL, '519 535', 2, 151, 17, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B250', 'Linear Models In Statistic', 'Alvin C.Rencher.', 'Wiley', 2000, NULL, 'QA 276 R 425', 2, 152, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B251', 'Numerical Analysis Mathematics of Scientific Computing Third Edition', 'david Kincaid', 'Brooks/cole thomson Learning', 2002, NULL, 'CA 93950', 2, 153, 84, 9, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B252', 'Ergonomi Konsep Dasar Dan Aplikasinya', 'Eko Nurmianto', 'Guna Widya', 2004, NULL, '620 8', 5, 154, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B253', 'Operation Management', 'Jay Heizer', 'Salemba Empat', 2010, NULL, '658 404', 5, 155, 86, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B254', 'Dasar Dasar Manajement Investasi Dan Portofolio', 'Kamaruddin Ahmad,S.E., M.M.', 'Rineka Cipta', 2004, NULL, '658 15', 5, 156, 87, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B255', 'Operation Research', 'Ahmad Dimyati', 'PT Sinar Baru ALGENSINDO', 1987, NULL, '658 403', 5, 157, 88, 9, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B256', 'Statistical Quality Control', 'R.C. Gupta', 'Khanna Publisher', 1981, NULL, '658 568', 5, 158, 89, 9, 5, 'Tempat Terbit: Delhi, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B257', 'Manajemen Sumber daya Manusia', 'Drs.Faustino Cardoso Gomes', 'Andi Offset', 1995, NULL, '658 3', 5, 159, 90, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B258', 'Analisis Ekonomi Teknik', 'Robert J.Kodoatie', 'Andi', 1995, NULL, '658 152', 5, 160, 91, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B259', 'Solutions Manual To Accompany Introduction To Quantitative Methods In Business', 'Bharat Kolluri', 'Wiley', 2017, NULL, '658 403', 5, 161, 18, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B260', 'Solution Manual To Accompany Introduction To Quantitative Methods In Business', 'Bharat Kolluri', 'Wiley', 2017, NULL, '658 403', 5, 161, 18, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B261', 'Arch Models And Financial Applications', 'Christian Gourierouk', 'Springer', 1997, NULL, 'HG 176 5 G 68', 2, 162, 17, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B262', 'Statistical Analysis of Reliability Data', 'M.J.Crowder', 'Chapman & Hall', 1991, NULL, '620 004', 5, 163, 72, 5, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B263', 'Principles of Inventory Management', ' John A. Muckstadt', 'Springer', 2010, NULL, '658 8', 5, 164, 17, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B264', 'Reliabilty Modelling', 'Linda C.Wolstenholme', 'Chapman & Hall', 1999, NULL, '620 004 52', 5, 165, 72, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B265', 'Riset Operasi Untuk Pengmabilan Keputusan', 'Prof.Johannes Supranto, M.A.,', 'PT Raja Grafindo Persada', 2013, NULL, '658 403', 5, 166, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B266', 'Prosiding Seminar Nasional Pasca Sarjana XIII', 'Dr. .Suhartno', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2013, NULL, '658 575', 5, 167, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B267', 'Prosiding Seminar Nasional Statistika V', 'Drs. H. Nur Iriawan, M. Ikom, Ph.D.', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2001, NULL, '658 575', 5, 168, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B268', 'Proceeding 4Th Internatiomal Conference On Mathematics And Stastictics 2009', 'Ling Lukman, Ph.D', 'Nalahayati University Bandar Lampung', 2009, NULL, '627 98', 5, 169, 93, 9, 5, 'Tempat Terbit: Lampung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B269', 'Engineering Economy', 'William G. Sulivan', 'Prentice Hall', 2009, NULL, '620', 5, 170, 40, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B270', 'Seminar Nasional Statistika V', 'Drs. H.Nur Iriawan,M. Ikom,Ph.D', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2001, NULL, '658 575', 5, 171, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B271', 'Seminar Nasional Pasca Sarjana XIII', 'Dr.Suhartono', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2013, NULL, '658 575', 5, 172, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B272', 'Marketing Research An Applied Orientation', 'Naresh K.Malhotra', 'Prentice Hall', 1996, NULL, '658 53', 5, 173, 40, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B273', 'International Financial Mangement', 'Jeff Madura', 'South - Western', 2000, NULL, '658 159', 5, 174, 58, 9, 5, 'Tempat Terbit: Australia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B274', 'Stochastic Methods In Realibility Zheory', 'N Rvichandran', 'Wiley', 1990, NULL, '620 001', 5, 175, 18, 9, 5, 'Tempat Terbit: Delhi, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B275', 'Pengantar Komputasi Numerik dengan Matlab', 'Drs.Sahid, M.Sc.', 'Andi', 2005, NULL, '621 382', 5, 176, 91, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B276', 'An Introduction To Realibility And Maintainability Engineering', 'Charles E.Ebeling', 'Mc Graw Hill', 1997, NULL, '620 004', 5, 177, 94, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B277', 'Riset Operasi Suatu Pengantar', 'Hamdy A Taha', 'Binarupa Aksara', 1996, NULL, '658 403 4', 5, 178, 30, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B278', 'Practical Optimization Methods', 'M.Asghar Bhatti', 'Springer', 2000, NULL, '620 004', 5, 179, 17, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B279', 'Operation Management', 'Jay Heizer', 'Salemba Empat', 2010, NULL, '658 404', 5, 155, 86, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B280', 'Applied Stochastic System Modeling', 'Shunji Osaki', 'Springer', 2003, NULL, '511 8', 2, 180, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B281', 'Real Analysis And Probability', 'Robert B. Ash', 'Academic Press', 1972, NULL, '515 8', 2, 181, 66, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B282', 'Mathematical Models', 'Richard Haberman', 'Prentice Hall', 1977, NULL, '511 8', 2, 182, 40, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B283', 'Boundary Value Problems And Partial Differential Equations', 'Mayer Humi', 'Publishing Company', 1922, NULL, '515 35', 2, 183, 95, 3, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B284', 'Applied Wavelet Analysis With S Plus', 'Andrew Bruee', 'Springer', 1996, NULL, '515 243', 2, 184, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B285', 'Essential Wavelets For Statistical applications And Data Analysis', 'R Todd Ogden', 'Birkhauser', 1997, NULL, '551 220', 5, 185, 96, 5, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B286', 'Aljabar Modern', 'Drs.Wahyudin.M.Pd.', 'Tarsito', 1989, NULL, '512 5', 2, 186, 11, 3, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B287', 'Technician Mathemathics', 'J.O.Bird', 'Longman', 1978, NULL, '510 3', 2, 187, 97, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B288', 'Partially Linear Models', 'Wolfgang Hardle', 'Springer', 1993, NULL, '519 535', 2, 93, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B289', 'The Statistics Problem Solver', 'Dr.M.Fogiel,Director', 'REA', 1978, NULL, '519 5', 2, 188, 98, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B290', 'Multivariate Descriptive Statistical analysis', 'John Wiley', 'Wilety', 1984, NULL, '519 5', 2, 189, 99, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B291', 'Using SAS For Univariate & Multivariate Statistics', 'Norm O\'Rourke', 'Wiley', 2005, NULL, '519 535', 2, 190, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B292', 'Introduction To Hilbert Spaces With applications', 'Lokenath Debnath', 'Accademic Press', 1999, NULL, '515 353', 2, 191, 100, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B293', 'The Advanced Theory Of Statistic', 'Maurice G.Kendall, M.A., Sc.D.', 'Charles Griffin', 1969, NULL, '519 5', 2, 192, 101, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B294', 'Matematika Dasar', 'Dosen Dosen Matematika', 'Fakultas Ilmu Pasti Dan Ilmu Alam Institut Teknologi Sepuluh November (ITS)', 1976, NULL, '510', 2, 193, 102, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B295', 'Rumus Rumus Soal Dan Penyelesaian Kalkulus', 'Soehardjo', 'Teknik Matematika Institut Teknologi Sepuluh November (ITS)', 2002, NULL, '51 5', 2, 194, 103, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B296', 'Measure Integral And Probability', 'Second Edition', 'springer', 2004, NULL, '514 42', 2, 195, 17, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B297', 'Discrete Multivariate Distributions', 'Norman L. Johnson', 'Wiley', 1997, NULL, '511 1', 2, 196, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B298', 'Value At Risk', 'Philippe Jorion', 'Mc Graw Hill', 2007, NULL, '515 243', 2, 197, 94, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B299', 'Maximum Penalized Likelihood Estimation', 'P.P.B. Eggermont', 'Springer', 2009, NULL, '510', 2, 198, 17, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B300', 'Modern Applied Statistic With S Plus', 'W.N. Venables', 'springer', 1994, NULL, '519 502', 2, 199, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B301', 'Algebra An Approach Via Module theory', 'William A. Adkins', 'Springer', 1992, NULL, '512', 2, 200, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B302', 'Multivariate Data Analysis', 'Pearson International edition', 'Prentice Hall', 2007, NULL, '519 535', 5, 201, 40, 5, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B303', 'Fuzzy Sets,Uncertainty,An Information', 'George J.Klir', 'Prentice Hall', 1988, NULL, '511 32', 2, 202, 40, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B304', 'Applied Mathematichal sciences', 'Carl De Boor', 'Springer', 2001, NULL, '511 42', 2, 203, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B305', 'Introduction To Matrices With', 'Franklin A.Graybill', 'Michigan State University', 1969, NULL, '512 943', 2, 204, 104, 3, 5, 'Tempat Terbit: California, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B306', 'Rumus Rumus Soal Dan Penyelesaian Matematika Rekayasa (Matematika Teknik)', 'Soehardjo', 'Teknik Matematika Institut Teknologi Sepuluh November (ITS)', 2002, NULL, '510 246', 2, 194, 103, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B307', 'Matematika', 'Soehardjo', 'Institut Teknologi Sepuluh November (ITS)', 1996, NULL, '510', 2, 194, 50, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B308', 'Seminar Nasional Matematika Dan Statistika VI', 'Dr.I Nyoman Budiantara, Ms.', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2003, NULL, '510', 2, 205, 92, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B309', 'Smoothing Spline Anova Models', 'Chong Gu', 'Springer', 2002, NULL, '518 5', 2, 206, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B310', 'Linear Algebra & Differential Equations', 'Charles G.Cullen', 'Prindle', 1979, NULL, '512 5', 2, 207, 105, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B311', 'Kalkulus & Geometri Analitis', 'Dale Varberg', 'Erlangga', 1987, NULL, '515 1', 2, 208, 33, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B312', 'Teori Bilangan Pengantar Ilmu Hitung', 'Prof.Dr.Soeparna Darmawijaya', 'jurusan Matematika FMIPA Universitas Gajah Mada', 2009, NULL, '526 3', 2, 145, 106, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B313', 'Simulation And The Monte Carlo Method', 'Reuven Y. Rubinstein', 'Wiley', 2008, NULL, '518 282', 2, 209, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B314', 'Seminar Nasional Matematika Dan Statistika VI', 'Dr. I Nyoman Budiantara,MS', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2003, NULL, '510', 2, 210, 92, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B315', 'Density Estimation For Statistics and Data Analysis', 'B.W.Silverman', 'Chapman & Hall', 1986, NULL, '519 24', 5, 211, 72, 5, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B316', 'Spline Regression Models', 'Lawrence C.Marsh', 'Sage University Paper', 2002, NULL, '519 536', 2, 212, 107, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B317', 'Probability, Random variables And Stochastic Process', 'Athanasios Papoulis', 'Mc Graw Hill', 2002, NULL, '519 2', 2, 213, 94, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B318', 'Applied Nonparametric Regression', 'W. Hardle', 'Cambridge University', 1990, NULL, '519 5', 2, 214, 78, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B319', 'Problems In Higher Mathemathics', 'V.P.Minorsky', 'Mir Publishers Moscow', 1975, NULL, '510', 2, 215, 108, 3, 5, 'Tempat Terbit: Russian, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B320', 'Statistical Process Control', 'Drs. Mashuri MT', 'Jurusan Statistika  Institut Teknologi Sepuluh November (ITS)', 1995, NULL, '519 86', 2, 216, 109, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B321', 'Statistika Matematika', 'Prof.SubhanarPh.D', 'GRAHA ILMU', 2013, NULL, '519 5', 2, 217, 8, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B322', 'Matematika Rekayasa (Matematika Teknik)', 'Soehardjo', 'Teknik Matematika Institut Teknologi Sepuluh November (ITS)', 2003, NULL, '510 246', 2, 194, 103, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B323', 'Matematika Kalkulus', 'Soehardjo', 'Institut Teknologi Sepuluh November (ITS)', 2000, NULL, '515', 2, 194, 50, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B324', 'Data Compression', 'David Salomon', 'Springer', 2007, NULL, '510 285', 5, 218, 17, 5, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B325', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B326', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B327', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B328', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B329', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B330', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B331', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B332', 'Pengantar Teori Ekonomi', 'Suherman Rosyidi', 'PT Raja Grafindo Persada', 1996, NULL, '330 01', 2, 219, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B333', 'Ekonomi Teknik', 'I Nyoman Pujawan', 'Guna Widya', 1995, NULL, '330 1', 2, 220, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B334', 'Ekonometrika', 'Setiawan', 'Andi', 2010, NULL, '330 015', 2, 221, 91, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B335', 'Applied Econometrics', 'Dimitrios Asteriou', 'Palgrave Macmillan', 2006, NULL, '330 015', 2, 222, 110, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B336', 'Ekonomi Teknik', 'I Nyoman Pujawan', 'Guna Widya', 1995, NULL, '330 1', 2, 220, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B337', 'Ekonomi Teknik', 'I Nyoman Pujawan', 'Guna Widya', 1995, NULL, '330 1', 2, 220, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B338', 'Analysis Of Financial Time Series', 'Ruey S. Tsay', 'Wiley', 2002, NULL, '332 015', 2, 223, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B339', 'Buku Panduan Akademik Jurusan Statistika', 'Dr.Muhammad Mashuri,MT', 'Jurusan Statistika Institut Teknologi Sepuluh November (ITS)', 2012, NULL, '378', 2, 224, 111, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B340', 'Undang Undang Perbankan Syariah Dan surat Berharga syariah', 'Unknown Penulis', 'Fokus Media', 2008, NULL, '332 1', 2, 134, 112, 9, 5, 'Tempat Terbit: Bandung, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B341', 'Ergonomi , Studi Gerak dan Waktu', 'Sritomo Wignjosoebroto', 'Guna Widya', 1995, NULL, '330 011 2', 2, 225, 85, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B342', 'Linear Models', 'S.R.Searlf', 'Wiley', 1971, NULL, '519 5', 2, 226, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B343', 'Dari Perguruan Tinggi Bnagun Negeri', 'Asep Saefuddin', 'PT Raja Grafindo Persada', 2017, NULL, '333 916', 2, 227, 25, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B344', 'Konflik Sosial Nelayan', 'Drs.Kusnadi,M.A.', 'LKIS', 2002, NULL, '362 53', 2, 228, 113, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B345', 'Statistika Dasar', 'Khairil Anwar Notidiputro', 'PT grasindo', 2009, NULL, '310', 2, 229, 114, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B346', 'Ekonomi Teknik', 'I Nyoman Pujawan', 'Guna Widya', 1995, NULL, '330 1', 2, 220, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B347', 'Operations Research', 'Maurice sasieni', 'Wiley', 1959, NULL, '3', 2, 230, 18, 9, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B348', 'Metodologi Penelitian Ekonomi', 'Sritua Arief', 'Universitas Indonesia', 1993, NULL, '330 072', 2, 231, 115, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B349', 'Econometrics', 'Ronald J. Wonnacott', 'Wiley', 1970, NULL, '330 015', 2, 232, 18, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B350', 'Guru Besar Dan Doktor ITS', 'Drs.Djoko Hartanto,M.Si', 'Institut Teknologi Sepuluh November (ITS)', 2012, NULL, '378 12', 2, 233, 50, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B351', 'Cakrawala', 'Daniel Mohammad Rosyid', 'JaringPena', 2010, NULL, '370', 2, 234, 116, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B352', 'Indikator Ekonomi', 'Unknown Penulis', 'Biro Pusat Statistik', 1995, NULL, '658 87', 5, 134, 117, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B353', 'Risk Management', 'Michel Crouhy', 'Mc Graw Hill', 1979, NULL, '338 272', 2, 235, 94, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B354', 'Asymptotic Theory Of statistics and Probability', 'Anirban Dasgupta', 'Springer', 2008, NULL, '519 5', 2, 236, 17, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B355', 'Konsep Peluang Dan Statistika dalam Rekayasa', 'Dra. Destri Susila Ningrum. MSI ', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 1998, NULL, '519 2', 2, 109, 92, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B356', 'Introduction To Empirical Processes And Semiparametric Inference', 'Michael R.Korosok', 'Springer', 2006, NULL, '519 55', 2, 237, 17, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B357', 'Kernel Smoothing', 'M.P. Wand', 'Chaoman & Hall', 1995, NULL, '519 5', 2, 238, 76, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B358', 'Pearson New International Edition', 'Joseph F.Hair Jr.', 'Pearson', 2014, NULL, '515 535', 2, 239, 9, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B359', 'An Introduction To statitistical Computing', 'Jochen Voss', 'Wiley', 2014, NULL, '685 562', 5, 240, 18, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B360', 'Seminar Nasional Statistika III', 'Prof. Ir.Soegiono', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 1995, NULL, '658 575', 5, 241, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B361', 'Seminar Nasional Statistika VII', 'Dra. Agnes Tuti Rumiati , M. Sc.', 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)', 2005, NULL, '658 575', 5, 242, 92, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B362', 'Survival Analysis', 'David G.Kleinbaum', 'Springer', 2005, NULL, '519 2', 2, 243, 17, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B363', 'Principal Componenr Analysis', 'I.T. Jolliffe', 'Springer', 1986, NULL, 'QA 278 5 J65', 2, 244, 17, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B364', 'Statistical Modelling In GLIM', 'Murray Aitkin', 'Clarendeon Press', 1989, NULL, '001 422', 5, 245, 118, 9, 5, 'Tempat Terbit: France, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B365', 'Applied Survival Analysis', 'David W. Hosmer ,Jr.', 'Wiley', 1999, NULL, '610 727', 5, 246, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B366', 'Probabilitas dan Statistik', 'Schaum\'s', 'Erlangga', 2004, NULL, '519 207', 2, 247, 33, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B367', 'Realibility Centered Maintenance', 'John Moubray.', 'Industrial Press', 1997, NULL, '658 202', 5, 248, 119, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B368', 'Introduction To Probability Models', 'Sheldon Ros', 'Academic Press', 1997, NULL, '519 2', 2, 77, 66, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B369', 'Applied Multivariate Statistical Analysis', 'Richard A. Johnson', 'Prentice Hall', 1992, NULL, '519 575', 2, 249, 40, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B370', 'Generalized Linear Moedels', 'P.McCullagh Frs', 'Chapman & Hall', 1983, NULL, '519 536', 2, 250, 72, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B371', 'Multivariate Density Estimation', 'David W. Scott', 'Wiley', 1922, NULL, '519 5', 2, 251, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B372', 'Generalized Linear Moedels', 'P.McCullagh Frs', 'Chapman & Hall', 1983, NULL, '519 536', 2, 250, 72, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B373', 'Analisis Regresi Terapan', 'Norman Draper.', 'PT Gramedia Pustaka Utama,Jakarta', 1992, NULL, '519 536', 2, 252, 68, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B374', 'Sepenggal Perjalanan Menuju Asa', 'Siti Nurhalimah,dkk', 'Mahasiswa Bidik Misi Institut Teknologi Sepuluh November Surabaya', 2017, NULL, '650 1', 5, 253, 120, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B375', '99 Inspiras Kehidupan', 'Joni Hermana', 'Joni Hermana.Self Publishing', 2019, NULL, '177 7', 2, 254, 70, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B376', 'Pengantar Analisis Statistik', 'Wilfrid J.Dixon', 'University Gajah Mada', 1983, NULL, '519 5', 2, 255, 121, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B377', 'Ekonomi Teknik', 'I Nyoman Pujawan', 'Guna Widya', 1995, NULL, '330 1', 2, 220, 85, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B378', 'Statistik Nonparametrik Terapan', 'Wayne W. Daniel', 'Pt Gramedia,Jakarta', 1989, NULL, 'GM 211 89 640', 2, 256, 122, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B379', 'Profil Guru Besar Dan Doktor ITS', 'Drs.Djoko Hartanto,M.Si', 'Institut Teknologi Sepuluh November (ITS)', 2012, NULL, '378 12', 2, 233, 50, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B380', 'Applied Multivariate Statistical Analysis', 'Richard A. Johnson', 'Prentice Hall', 2007, NULL, '519 535', 2, 249, 40, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B381', 'konsep Konsep Probabilitas Dalam Perencanaan Dan Perangan Rekayasa', 'Alfredo H S . Ang', 'Erlangga', 1975, NULL, '519 2', 2, 257, 33, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B382', 'Applied Statistics and Probality for Engineers', 'Douglas C. Montgomery', 'Wiley', 2014, NULL, '519 5', 2, 258, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B383', 'Applied Statistics and Probality for Engineers', 'Douglas C.Montgomery', 'Wiley', 2014, NULL, '519 5', 2, 259, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B384', 'Applied Statistic And Probability For Engineers', 'Dougla C. Montgomery', 'Wiley', 2014, NULL, '519 5', 2, 260, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B385', 'Applied Statistic And Probability For Engineers', 'Dougla C. Montgomery', 'Wiley', 2014, NULL, '519 5', 2, 260, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B386', 'Probability & Statistics For Engineers & Scientist', 'Ronald E Walpole', 'Pearson', 2016, NULL, '519 2', 2, 261, 9, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B387', 'Probability & Statistics For Engineers & Scientist', 'Ronald E Walpole', 'Pearson', 2016, NULL, '519 2', 2, 261, 9, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B388', 'Probability & Statistics For Engineers & Scientist', 'Ronald E Walpole', 'Pearson', 2016, NULL, '519 2', 2, 261, 9, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B389', 'Probability & Statistics For Engineers & Scientist', 'Ronald E Walpole', 'Pearson', 2016, NULL, '519 2', 2, 261, 9, 3, 5, 'Tempat Terbit: London, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B390', 'Applied Statistics and Probality for Engineers', 'Dougla C. Montgomery', 'Wiley', 2014, NULL, '519 5', 2, 260, 18, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B391', 'Simulation Modeling And Analysis', 'W.David Kelton', 'Mc Graw Hill', 1991, NULL, '003 3', 5, 97, 94, 9, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B392', 'Metode Statistika Menggunakan SAS', 'Shofi Andari', 'ITS Press', 2015, NULL, '519 2', 2, 262, 4, 3, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B393', 'Optimasi', 'Ir Adi Suryanto', 'Institut Teknologi Sepuluh November (ITS)', 1985, NULL, '006 31', 5, 263, 50, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B394', 'Microeconomic Theory', 'Walter Nicholson', 'Thomson', 2005, NULL, '330 1', 2, 264, 123, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B395', 'Statistical Procedures For Engineering Management And Science>', 'Leland Blank PE', 'Mc Graw Hill', 1997, NULL, '519 5', 2, 265, 94, 3, 5, 'Tempat Terbit: New York, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B396', 'Linear Programming And Network Flows', 'John Jarvis', 'Wiley', 1977, NULL, '519 72', 2, 266, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B397', 'Statistical Quality Design And Control', 'Richar E Dover', 'Wiley', 1992, NULL, '658 568', 5, 267, 18, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B398', 'Operations Management', 'Roberta S. Rusell', 'Prentice Hall', 2003, NULL, '658', 5, 268, 40, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B399', 'Operations Management For Competitive Advantage', 'Chase', 'Mc Graw Hill', 2001, NULL, '658 5', 5, 269, 94, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B400', 'Teknik Penarikan Sampel', 'William G. Cochran', 'Universitas Indonesia', 1991, NULL, '519.52', 2, 107, 115, 3, 5, 'Tempat Terbit: Indonesia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B401', 'Mathematical and Statistical Psychology', 'Unknown Penulis', 'Journal (The British Psychological Society', 1993, NULL, '519.5', 2, 134, 124, 3, 5, 'Tempat Terbit: Letchworth, Herts, UK, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B402', 'A First Course In The Theory Of Linear Statistical Models', 'Raymond H. Myers, Janet S. Milton', 'PWS-KENT Publishing Company Boston', 1991, NULL, '519.5', 2, 270, 125, 3, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B403', 'Statistika Nonparametrik Terapan', 'Wayne W. Daniel', 'Pt.Gramedia, jakarta', 1989, NULL, '519.5', 2, 256, 126, 3, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B404', 'Dasar Pemograman Web Dinamis Penggunaan Php', 'Abdul Kadir', 'Andi Yogyakarta', 2002, NULL, '5.73', 2, 105, 61, 3, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B405', 'A Panorama Of Statistics', 'Eric Sowey', 'Wiley', 2017, NULL, '512.01499999999999', 2, 271, 18, 3, 5, 'Tempat Terbit: United Kingdom, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B406', 'The Elements Of Statistics', 'James B. Ramsey', 'Duxbury', 2002, NULL, '6.3', 5, 272, 80, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B407', 'Visualizing Financial Data', 'Julie Rodriguez', 'Wiley', 2016, NULL, '519.5', 5, 273, 18, 5, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B408', 'Introduction To Quantitative Methods In Business', 'Bharat Kolluri', 'Wiley', 2017, NULL, '650.02099999999996', 5, 161, 18, 9, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B409', 'Applied analystics using SAS enterprise miner : course notes book 1 of 2', 'Unknown Penulis', 'Unknown Penerbit', 2020, NULL, '515.2 Sas a', 2, 134, 36, 3, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B410', 'SAS Programming I: Essentials', 'sas', 'SAS publishing', 2020, NULL, '515.20000000000005', 2, 274, 127, 3, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B411', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B412', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B413', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B414', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B415', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B416', 'DB Documentation', 'Advisionario', 'Dbxtra', 2014, NULL, '', 2, 275, 128, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B417', 'SAS ENTERPRISE GUIDE : ANOVA,Regression,and Logistic Regression', 'sas', 'SAS publishing', 2012, NULL, '515.20000000000005', 2, 274, 127, 3, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B418', 'Applying Data Mining Techniques Using Enterprise Miner', 'sas', 'SAS publishing', 2003, NULL, '519.53', 5, 274, 127, 5, 5, 'Tempat Terbit: USA, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B419', 'SAS Programming I: Essentials', 'sas', 'SAS publishing', 2020, NULL, '', 2, 274, 127, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B420', 'Applied Analystics using SAS enterprise miner : course notes book 1 of 2', 'Unknown Penulis', 'Unknown Penerbit', 2020, NULL, '', 2, 134, 36, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B421', 'Applied analystics using SAS enterprise miner : course notes book 1 of 2', 'Unknown Penulis', 'Unknown Penerbit', 2020, NULL, '', 2, 134, 36, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B422', 'Applied analystics using SAS enterprise miner : course notes book 1 of 2', 'Unknown Penulis', 'Unknown Penerbit', 2020, NULL, '', 2, 134, 36, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B423', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B424', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B425', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B426', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B427', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B428', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B429', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B430', 'Encyclopedia Of Statistical Sciences', 'Samuel Kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B431', 'Encyclopedia Of Statistical Sciences', 'Samuel kotz', 'Wiley', 1982, NULL, '519.5', 2, 276, 18, 3, 5, 'Tempat Terbit: Canada, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B432', 'Matematika 4', 'Soehardjo', 'ITS, ITATS', 1996, NULL, '519.5', 2, 194, 129, 3, 5, 'Tempat Terbit: Indonesia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B433', 'Buku Ajar Kalkulus 1', 'Dosen Jurusan Mmatematika', 'ITS, ITATS', 1999, NULL, '515.1', 2, 277, 129, 3, 5, 'Tempat Terbit: Indonesia, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B434', 'Kuliah Sampling', 'M.Abdulmajid', 'Biro Pusat Statistik', 1976, NULL, '1.4', 2, 278, 117, 9, 5, 'Tempat Terbit: Jakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B435', 'Elementary Statistics A step by Step Approach', 'Allan G Bluman', 'mcgraw hill', 2006, NULL, '519.5', 2, 279, 130, 3, 5, 'Tempat Terbit: Hoboken, NJ, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B436', 'Buku Tabel Statistika', 'HIMADATA ITS', 'Departemen Kewirausahaan HIMADATA -ITS', 2023, NULL, '', 2, 280, 131, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B437', 'Teknik Pengambilan Sampel untuk Peneliti & Pemula', 'Susilaningrum, Destri', 'Kanzun Books', 2018, NULL, '', 2, 281, 132, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B438', 'Spatial Econometrics Methods and Models', 'Luc Anselin', 'Spriger', 1988, NULL, '', 2, 282, 133, 9, 5, 'Tempat Terbit: America, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B439', 'Ergonomi Studi Gerak dan Waktu', 'Wignjosoebroto, Sritomo', 'Guna Widya', 2008, NULL, '', 2, 283, 85, 9, 5, 'Tempat Terbit: Surabaya, Edisi: cetakae empat, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B440', 'Analisis Multivariat dan Ekonometrika Teori, Konsep, dan Aplikasi dengan Eviews 10', 'Ghozali, Imam; Ratmono, Dwi', 'Universitas Diponegoro', 2013, NULL, '', 2, 284, 134, 9, 5, 'Tempat Terbit: Surabaya, Edisi: edisi 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B441', 'The Elements of Style', 'William Strunk JR. And E.B. White', 'Pearson', 2000, NULL, '', 2, 285, 9, 9, 5, 'Tempat Terbit: USA, Edisi: fourth edition, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B442', 'Analisis Efisiensi dengan Data Envelopment Analysis (DEA) di Rumah Sakit dan Puskesmas Provinsi Jawa Barat, Banten, Bali, Riau, Sulawesi Selatan, Aceh, Kalimantan Timur, Kalimantan Selatan, Papua, dan Nusa Tenggara Timur', 'Fitriana; Hendarwan, Harimat', 'Amerta Media', 2021, NULL, '', 5, 286, 135, 5, 5, 'Tempat Terbit: Banyumas, Jawa Tengah, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B443', 'Analisis Multivariat Regresi Logistik', 'Dahlan, M. Sopiyudin', 'Epidemiologi', 2012, NULL, '', 2, 287, 136, 9, 5, 'Tempat Terbit: Jakarta, Edisi: Edisi 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B444', 'Metode Kuantitatif Pendekatan Pengambilan Keputusasn untuk Ilmu Sosial dan Bisnis', 'Nugroho, Bernardus Y ; Saragih, Ferdinand D ; Eko, Umanto', 'Salemba Humanika', 2012, NULL, '', 2, 288, 137, 9, 5, 'Tempat Terbit: Jakarta, Edisi: edisi 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B445', 'Belajar fotografi untuk hobby dan bisnis', 'Aditiawan, Rangga ; Bianca, Ferren', 'Dunia Komputer', 2010, NULL, '', 2, 289, 138, 9, 5, 'Tempat Terbit: Jakarta, Edisi: cetakan iii, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B446', 'The Learning of English Language : General Science and Technology', 'Hermanto; Fahmi, Arfan', 'Litera Jannata Perkasa', 2022, NULL, '', 2, 290, 139, 9, 5, 'Tempat Terbit: Surabaya, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL);
INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `th_terbit`, `isbn`, `no_klasifikasi`, `id_rak`, `id_penulis`, `id_penerbit`, `id_kategori`, `jumlah_eksemplar`, `deskripsi`, `tipe_buku`, `nim_penulis`, `pembimbing1`, `pembimbing2`, `file_buku`) VALUES
('B447', 'Pengantar pengendalian kualitas statistik', 'Soejieti, Zanzawi', 'Gadjah Mada University Press', 1990, NULL, '', 2, 291, 32, 9, 5, 'Tempat Terbit: Yogyakarta, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B448', 'Probabilitas Variabel Random, dan Proses Stokastik', 'Subanar', 'Gadjah Mada University Press', 1992, NULL, '', 2, 292, 32, 9, 5, 'Tempat Terbit: Yogyakarta, Edisi: edisi 2, Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B449', 'Applied Logiatic Regression', 'David W.Hosmer,Jr.,Stanley Lemeshow', 'John Wiley&Son', 1989, NULL, '', 2, 293, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B450', 'Econometric Analysis', 'William H. Greene', 'Macmillan Publishing Company', 1990, NULL, '', 2, 294, 141, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B451', 'Nonparametric Methods in Multivariate Analyis', 'Madan Lal Puri,Pranab Kumar Sen', 'John Wiley&Son', 1971, NULL, '', 2, 295, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B452', 'Geographically Weighted Regression', 'A.Steward Fotheringham,Chris Brunsdon,Martin Charlton', 'John Wiley&Son', 2002, NULL, '', 2, 296, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B453', 'Introduction to Liner Regression Analysis', 'Douglas C.Montgomery,Elizabeth A. Peck,G. Geoffrey Vining', 'John Wiley&Son', 2001, NULL, '', 2, 297, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B454', 'Statistical Inference', 'George Casella,Roger L. Berger', 'Wadsworth&Brooks/Cole Advance Books&Software', 1990, NULL, '', 2, 298, 142, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B455', 'An Introduction to Stockhastic Modeling', 'Howard M.Taylor,Samuel Karlin', 'Academic Press', 1998, NULL, '', 2, 299, 66, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B456', 'Algoritma Genetika', 'Zainudin Zukhri', 'Andi Yogyakarta', 2014, NULL, '', 2, 300, 61, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B457', 'Modern Probability Theory', 'B R Bhat', 'A Halste Press Book', 1981, NULL, '', 2, 301, 143, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B458', 'Pratical Genetic Algorithms', 'Randy L. Haupt,Sue Ellen Haupt', 'John Wiley&Son', 2004, NULL, '', 2, 302, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B459', 'Exploratory Data Analysis', 'John W. Turkey', 'Addison Wesley Publishing Company', 2020, NULL, '', 5, 303, 144, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B460', 'Teknik Penarikan Sample', 'William G. Cochran', 'Universitas Indonesia Prees', 1991, NULL, '', 2, 107, 145, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B461', 'MATLAB', 'Duane Hanselman,Bruce Littlefield', 'Andi Yogyakarta', 2000, NULL, '', 2, 304, 61, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B462', 'Springer Series in Statistics', 'Wolfgang Hardle', 'Springer Verlag', 1991, NULL, '', 2, 93, 146, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B463', 'Approximation Theorems of Mathematical Statistics', 'Robert J. Serfling', 'John Wiley&Son', 1980, NULL, '', 2, 305, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B464', 'Statistical Analysis with Missing Data', 'Roderick J. A. Little,Donald B.rubin', 'John Wiley&Son', 2002, NULL, '', 5, 306, 140, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B465', 'Metode dan Aplikas Peramalan', 'Ir. Hari Suminto', 'Interaksara', 2000, NULL, '', 2, 307, 147, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B466', 'Time Series Analysis', 'Jonathan D.Cryer', 'PWS Publishers', 1986, NULL, '', 2, 308, 148, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B467', 'Process Capability Indices', 'Samuel Kotz,Norman L. Johnson', 'Chapman &Hall', 1993, NULL, '', 2, 309, 149, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B468', 'Numerical Metdhod Using Matlab', 'G. Lindfield,J .Penny', 'Ellis Horwood', 1995, NULL, '', 2, 310, 150, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B469', 'Applied Statistics and the SAS Programming Language', 'Ronald P.Cody,Jeffrey K. Smith', 'Prentice Hall', 1997, NULL, '', 2, 311, 40, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B470', 'Classical and Modern Regression with Applications', 'Raymod H. Myers', 'PWS Publishers', 1990, NULL, '', 2, 312, 148, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B471', 'Applied Multivariate Statistical Analysis', 'Richard A. johnson,Dean W.Wichern', 'Prentice Hall', 1992, NULL, '', 2, 313, 40, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B472', 'Time Series Analysis Univariate and Multivariet Methods', 'William W. S. Wei', 'Addison Wesley Publishing Company', 1990, NULL, '', 2, 314, 144, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B473', 'Matrix Analysis for Statistics', 'James R. Schott', 'Unknown Penerbit', 2020, NULL, '', 2, 315, 36, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B474', 'Categorical Data Analysis using The SAS System', 'Maura E. Stokes,Charles S. Davis,Gary G. Koch', 'SAS Institute', 1991, NULL, '', 5, 316, 151, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B475', 'Fundamental Methods of Mathematical Economics', 'Alpha C. Chiang,Kevin WainWright', 'McGraw Hill Irwin', 2005, NULL, '', 2, 317, 152, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B476', 'Workshop on Bayesian Modelling', 'Dr. Irhamah,M.Si', 'Department of Statistics', 2014, NULL, '', 2, 318, 153, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B477', 'Statistical Methods in Hydrology', 'Charles T. Haan', 'The Iowa State University Press', 1977, NULL, '', 2, 319, 154, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B478', 'Technometrics', 'Daniel Pena', 'America Statistical Assosiaciation', 2005, NULL, '', 2, 320, 155, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B479', 'Statistics for Experimenters', 'George E.P Box,William G.Hunter,J.Stuart Hunter', 'John Wiley&Son', 1978, NULL, '', 2, 321, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B480', 'Introduction to the Theory and Pratice of Econometrics', 'George G. Judge', 'John Wiley&Son', 1982, NULL, '', 2, 322, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B481', 'Metode-metode Numeris dan Penerapan Dalam Komputer Pribadi', 'sg Ferryanto', 'Satya Wacana', 1988, NULL, '', 5, 323, 156, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B482', 'Advance Calculus with Application in Statistics', 'Andre I.Khuri', 'John Wiley&Son', 2003, NULL, '', 2, 324, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B483', 'Statistics in Engineering', 'Andrew V. Metcalfe', 'Chapman &Hall', 1994, NULL, '', 2, 325, 149, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B484', 'Regression Analysis of Count Data', 'A. Colin Cameron,Pravin K. Triveda', 'The Press Syndicate of the University of Cambridge', 1998, NULL, '', 5, 326, 157, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B485', 'Empirical Economics', 'Badi H. Baltagi', 'Springer Verlag', 2001, NULL, '', 2, 327, 146, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B486', 'Time Series Analysis Forecasting and Control', 'George E.P Box', 'Prentice Hall', 1994, NULL, '', 2, 328, 40, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B487', 'Numerical Metdhod for Stochastic Environmental Model', 'Dr. Ir H.x. Lin', 'J.W. Stijnen', 2002, NULL, '', 2, 329, 158, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B488', 'Statistical Concepts and Methods', 'Gouri K. Bhattacharyya,Richard A. Johnson', 'John Wiley&Son', 1977, NULL, '', 2, 330, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B489', 'Riset Operasi', 'Hamdy A Taha', 'Binarupa Aksara', 1997, NULL, '', 2, 178, 30, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B490', 'Sistem Informasi Geografis', 'Vini Indriasari, S.T.,M.Sc,Ph.D.', 'Mobius', 2018, NULL, '', 5, 331, 159, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B491', 'Survival Model', 'Dick London', 'Actex', 1988, NULL, '', 2, 332, 160, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B492', 'Pengambilan Keputusan', 'Thomas L. Saaty', 'PT Pustaka Binaman Pressindo', 1991, NULL, '', 2, 333, 161, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B493', 'Peubah Kompleks untuk Ilmuwan Dan Insinyur', 'John D. paliouras,Wibisono Gunawan', 'Erlangga', 1975, NULL, '', 2, 334, 33, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B494', 'Analisis Desain Sistem Fuzzy mengunakan Tool Box Matlab', 'Sri Kusumadewi', 'Graha Ilmu', 2002, NULL, '', 2, 335, 8, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B495', 'Stochastic Differential Equations', 'Bernt Oksendal', 'Springer Verlag', 1995, NULL, '', 2, 336, 146, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B496', 'Reabilitas dan Validitas', 'Saifuddin Azwar', 'Pusaka pelajar', 2012, NULL, '', 2, 337, 162, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B497', 'Pengolahan Data statistik Mengunakan Turbo Pascal', 'R. Soegeng', 'Andi Yogyakarta', 1996, NULL, '', 5, 338, 61, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B498', 'Discrete Multivariate Analysis Theory and Practice', 'Yvonne M. M. Bishop', 'The MIT Press', 1975, NULL, '', 2, 339, 163, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B499', 'Pengolahan Citra Digital mengunakan Matlab', 'Marvin Ch. Wijaya', 'Informatika', 2007, NULL, '', 2, 340, 34, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B500', 'GUI Matlab', 'Erick Paulus, S.Si, M.Kom,Yessica Natalia, S.Si., M.Kom.', 'Andi Yogyakarta', 2007, NULL, '', 2, 341, 61, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B501', 'Applied Regression Analysis', 'Norman Draper,Harry Smith', 'John Wiley&Son', 1966, NULL, '', 2, 342, 140, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B502', 'Konsep dan aplikasi Struktural Equation Modeling', 'Prof. Jogiyanto HM, M.B.A., Ph.D.,Ak.', 'UPP STIM YKPN', 2011, NULL, '', 2, 343, 164, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B503', 'Multivariate Data Analysis', 'Joseph f. Hair, JR.', 'Pearson Education', 2010, NULL, '', 5, 344, 165, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B504', 'Data Mining Mengolah Data MMEnjadi Informasi mengunakan Matlab', 'Eko Pratseyo', 'Andi Yogyakarta', 2014, NULL, '', 5, 345, 61, 5, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B505', 'Machine Learning', 'Suyanto', 'Informatika', 2018, NULL, '', 2, 346, 34, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B506', 'Essentials of Econometrics', 'Damodar N. Gujarati', 'McGraw Hill Irwin', 2006, NULL, '', 2, 347, 152, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B507', 'Multivariate Analysis with Aplication in Education and Psychology', 'Neil H. TIMM', 'Brooks/Cole Publishing Company', 1975, NULL, '', 2, 146, 166, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B508', 'Structural Equation Model dengan Lisrel8.8', 'Setyo Hari Wijanto', 'Graha Ilmu', 2008, NULL, '', 2, 348, 8, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL),
('B509', 'The Student Edition of Matlab', 'Duane Hanselman,Bruce Littlefield', 'Math Works', 1995, NULL, '', 2, 304, 167, 9, 5, 'Subyek: Umum', 'Buku Umum', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Fiksi'),
(2, 'Non-Fiksi'),
(3, 'Sains'),
(4, 'Sejarah'),
(5, 'Komputer'),
(6, 'Sastra'),
(7, 'Periodicals-indxes'),
(8, 'Books and reading'),
(9, 'Umum'),
(10, 'Manpower planning Manpower policy Personal management'),
(11, 'Communication in agriculture'),
(12, 'Real estate-development planning'),
(13, 'Java (Indonesia)'),
(14, 'operations research'),
(15, 'Econometrics'),
(16, 'Operation research'),
(17, 'Quality control-statistical methodsProcess control-statistical methods'),
(18, 'Engineering design-mathematical models'),
(19, 'service management'),
(20, 'reformation'),
(21, 'Education, higher'),
(22, 'fiction'),
(23, 'Quality control--statistical methods Taguchi methods (quality control)');

-- --------------------------------------------------------

--
-- Table structure for table `tb_magang`
--

CREATE TABLE `tb_magang` (
  `id_magang` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `tempat_magang` varchar(255) NOT NULL,
  `file_laporan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pa`
--

CREATE TABLE `tb_pa` (
  `id_pa` int NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_mahasiswa` varchar(255) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `file_laporan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pa`
--

INSERT INTO `tb_pa` (`id_pa`, `judul`, `nama_mahasiswa`, `nim`, `angkatan`, `file_laporan`) VALUES
(1, 'w', 'w', '230', '12', '1783599295_IEEEtranHOWTO.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbit`
--

CREATE TABLE `tb_penerbit` (
  `id_penerbit` int NOT NULL,
  `nama_penerbit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penerbit`
--

INSERT INTO `tb_penerbit` (`id_penerbit`, `nama_penerbit`) VALUES
(1, 'armi print'),
(2, 'UMK'),
(3, 'Toni Perc'),
(4, 'ITS press'),
(5, 'BMKG'),
(6, 'FMIPA UGM'),
(7, 'John wiley & Sons,Inc'),
(8, 'Graha ilmu'),
(9, 'Pearson'),
(10, 'Tata McGraw-hill'),
(11, 'Tarsito'),
(12, 'A Gary w. Ostedt book'),
(13, 'The British psychological society'),
(14, 'Markono print media Pte Ltd'),
(15, 'Crc press'),
(16, 'Lawrence  erlbaum associates'),
(17, 'Springer'),
(18, 'Wiley'),
(19, 'Chapman & Hall/CRC Press'),
(20, 'SAS Press'),
(21, 'Mc Graw-hill'),
(22, 'Spinger'),
(23, 'Dep Statistika Fakultas Matematika dan IPA Institut Pertanian Bogor'),
(24, 'BPFE Yogyakarta'),
(25, 'PT Raja Grafindo Persada'),
(26, 'Fakultas ekonomi Universitas Indonesia'),
(27, 'Spingers'),
(28, 'Physica-verlag A spinger company'),
(29, 'Pustaka Alif'),
(30, 'Binarupa Aksara'),
(31, 'Sinar Baru Algensindo'),
(32, 'Gadjah Mada University Press'),
(33, 'Erlangga'),
(34, 'Informatika'),
(35, 'IPB Press'),
(36, 'Unknown Penerbit'),
(37, 'University Tun Hussein Onn Malaysia'),
(38, 'kompas'),
(39, 'Kluwer academic'),
(40, 'Prentice Hall'),
(41, 'oxford'),
(42, 'Gramedia Pustaka Utama'),
(43, 'Van Nostrand Reinhold'),
(44, 'Macmillan Publishing'),
(45, 'Wiley Interscience'),
(46, 'United Statis Of America'),
(47, 'Universitas Gajah Mada'),
(48, 'ITB Bandung'),
(49, 'Springer - Verlag'),
(50, 'Institut Teknologi Sepuluh November (ITS)'),
(51, 'Siam'),
(52, 'Gramedia'),
(53, 'Kluwer Academic Publishers'),
(54, 'PT. Pertja'),
(55, 'User\'s Guide'),
(56, 'Departemen Pendidikan Dan Kebudayaan Universitas Terbuka'),
(57, 'Humboldt - Universitat Zu Berlin spandaver Str.1'),
(58, 'South - Western'),
(59, 'Willey'),
(60, 'Industrial Engineering Series'),
(61, 'Andi Yogyakarta'),
(62, 'SAS Institute INC'),
(63, 'PT ELEX MEDIA KOMPUTINDO KELOMPOK GRAMEDIA'),
(64, 'JEMMARS'),
(65, 'John Wiley'),
(66, 'Academic Press'),
(67, 'PT Kompas Media Nusantara'),
(68, 'PT Gramedia Pustaka Utama,Jakarta'),
(69, 'Elex Media Komputindo'),
(70, 'Joni Hermana.Self Publishing'),
(71, 'LP3ES,Jakarta,Anggota IKAPI'),
(72, 'Chapman & Hall'),
(73, 'wahyu Widhiarso'),
(74, 'PT Elex Media Komputindo'),
(75, 'Kepustakaan Populer Gramedia'),
(76, 'Chaoman & Hall'),
(77, 'Universitas  Indonesia'),
(78, 'Cambridge University'),
(79, 'CV. Pustaka Setia'),
(80, 'Duxbury'),
(81, 'Schaum\'s Outlines'),
(82, 'Serfling'),
(83, 'Bhratara Karya Aksara'),
(84, 'Brooks/cole thomson Learning'),
(85, 'Guna Widya'),
(86, 'Salemba Empat'),
(87, 'Rineka Cipta'),
(88, 'PT Sinar Baru ALGENSINDO'),
(89, 'Khanna Publisher'),
(90, 'Andi Offset'),
(91, 'Andi'),
(92, 'Jurusan Statistika FMIPA Institut Teknologi Sepuluh November (ITS)'),
(93, 'Nalahayati University Bandar Lampung'),
(94, 'Mc Graw Hill'),
(95, 'Publishing Company'),
(96, 'Birkhauser'),
(97, 'Longman'),
(98, 'REA'),
(99, 'Wilety'),
(100, 'Accademic Press'),
(101, 'Charles Griffin'),
(102, 'Fakultas Ilmu Pasti Dan Ilmu Alam Institut Teknologi Sepuluh November (ITS)'),
(103, 'Teknik Matematika Institut Teknologi Sepuluh November (ITS)'),
(104, 'Michigan State University'),
(105, 'Prindle'),
(106, 'jurusan Matematika FMIPA Universitas Gajah Mada'),
(107, 'Sage University Paper'),
(108, 'Mir Publishers Moscow'),
(109, 'Jurusan Statistika  Institut Teknologi Sepuluh November (ITS)'),
(110, 'Palgrave Macmillan'),
(111, 'Jurusan Statistika Institut Teknologi Sepuluh November (ITS)'),
(112, 'Fokus Media'),
(113, 'LKIS'),
(114, 'PT grasindo'),
(115, 'Universitas Indonesia'),
(116, 'JaringPena'),
(117, 'Biro Pusat Statistik'),
(118, 'Clarendeon Press'),
(119, 'Industrial Press'),
(120, 'Mahasiswa Bidik Misi Institut Teknologi Sepuluh November Surabaya'),
(121, 'University Gajah Mada'),
(122, 'Pt Gramedia,Jakarta'),
(123, 'Thomson'),
(124, 'Journal (The British Psychological Society'),
(125, 'PWS-KENT Publishing Company Boston'),
(126, 'Pt.Gramedia, jakarta'),
(127, 'SAS publishing'),
(128, 'Dbxtra'),
(129, 'ITS, ITATS'),
(130, 'mcgraw hill'),
(131, 'Departemen Kewirausahaan HIMADATA -ITS'),
(132, 'Kanzun Books'),
(133, 'Spriger'),
(134, 'Universitas Diponegoro'),
(135, 'Amerta Media'),
(136, 'Epidemiologi'),
(137, 'Salemba Humanika'),
(138, 'Dunia Komputer'),
(139, 'Litera Jannata Perkasa'),
(140, 'John Wiley&Son'),
(141, 'Macmillan Publishing Company'),
(142, 'Wadsworth&Brooks/Cole Advance Books&Software'),
(143, 'A Halste Press Book'),
(144, 'Addison Wesley Publishing Company'),
(145, 'Universitas Indonesia Prees'),
(146, 'Springer Verlag'),
(147, 'Interaksara'),
(148, 'PWS Publishers'),
(149, 'Chapman &Hall'),
(150, 'Ellis Horwood'),
(151, 'SAS Institute'),
(152, 'McGraw Hill Irwin'),
(153, 'Department of Statistics'),
(154, 'The Iowa State University Press'),
(155, 'America Statistical Assosiaciation'),
(156, 'Satya Wacana'),
(157, 'The Press Syndicate of the University of Cambridge'),
(158, 'J.W. Stijnen'),
(159, 'Mobius'),
(160, 'Actex'),
(161, 'PT Pustaka Binaman Pressindo'),
(162, 'Pusaka pelajar'),
(163, 'The MIT Press'),
(164, 'UPP STIM YKPN'),
(165, 'Pearson Education'),
(166, 'Brooks/Cole Publishing Company'),
(167, 'Math Works');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(35) NOT NULL,
  `level` enum('Administrator','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Naufa', 'admin', '202cb962ac59075b964b07152d234b70', 'Administrator'),
(5, 'admin', 'Admin', '202cb962ac59075b964b07152d234b70', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengunjung`
--

CREATE TABLE `tb_pengunjung` (
  `id_pengunjung` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `tgl_kunjungan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penulis`
--

CREATE TABLE `tb_penulis` (
  `id_penulis` int NOT NULL,
  `nama_penulis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penulis`
--

INSERT INTO `tb_penulis` (`id_penulis`, `nama_penulis`) VALUES
(1, 'anastasya'),
(2, 'Eko'),
(3, 'Anton'),
(4, 'Brodjol Sutijo dkk'),
(5, 'BMKG'),
(6, 'Dr.Kusminarto'),
(7, 'Olive jean dunn & Virginia A. Clark'),
(8, 'Sri kusuma dewi'),
(9, 'Ediburgh Gate'),
(10, 'R.S.L.Srivastava'),
(11, 'DR.Sudjana M.A.,M. Sc'),
(12, 'Golubitsky, Martin  ; Dellnitz, Michael'),
(13, 'Smith, Philip T. S'),
(14, 'Cleff, Thomas'),
(15, 'Dean, Angela ; Morris, Max ; Stufken, John ; Bingham, Derek'),
(16, 'Stevens, James P.'),
(17, 'Selzer, Paul M. ; Marhofer, Richard J. ;  Rohwer, Andreas'),
(18, 'Searle, Shayle R.'),
(19, 'Martinez, Wendy L. ; Martinez, Angel R.'),
(20, 'Khattree, Ravindra ; Naik, Dayanand N.'),
(21, 'Kleiber, Christian ; Zeileis, Achim'),
(22, 'Gurajati, Damodar N.'),
(23, 'Polanski, Andrzej ; Kimmel, Marek'),
(24, 'Saefuddin, Asep ; Sartono, Bagus ; Setiabudi, Nur Andi'),
(25, 'Swasono, Yudo ; Sulistyaningsih, Endang'),
(26, 'Soekartawi'),
(27, 'Sanusi, Bachrawi'),
(28, 'Simanjuntak, Payaman J.'),
(29, 'Hoffmann, Davis'),
(30, 'Arbia, Giuseppe'),
(31, 'Arbia, Gius ; Baltagi, Badi H.'),
(32, 'Bivand, Roger S. ; Pebesma, Edzer J. ; Rubio, Virgilio Gomez'),
(33, 'Steinwart, Ingo ; Christmann, Andreas'),
(34, 'Marques de Sa, J.P.'),
(35, 'Hubler, Olaf ; Frohn, Joachim'),
(36, 'Galushkin, Alexander I.'),
(37, 'Baltagi, Badi H.'),
(38, 'Maimon, Oded ; Rokach, Lior'),
(39, 'Purwadi'),
(40, 'Taha, Hamdy A.'),
(41, 'Supranto, J.'),
(42, 'Dimyati, Tjutju Tarliah ; Dimyati, Ahmad'),
(43, 'Montgomery, Douglas C.'),
(44, 'Keenan, Charles W. ; Kleinfelter, Donald C. ; Wood, Jesse H.'),
(45, 'Prahasta, Eddy'),
(46, 'Arora, Jasbir S.'),
(47, 'Rao, Singiresu S.'),
(48, 'Sartono, Bagus ; Kurnia, Anang ; Bakri, Rizal ; Bodro, Dewi Kiswani'),
(49, 'R.Core Team'),
(50, 'Tasmin, Rosmaini ; Ruslan, Rumaizah'),
(51, 'Luhulima, James'),
(52, 'Wibowo, Wahyu ; Ulama, Brodjol Sutijo Suprih ; Al Azies, Harun'),
(53, 'Smart, John C.'),
(54, 'Johnson, Richard A. ; Wichern, Dean W.'),
(55, 'Walker, Russell C.'),
(56, 'Lipschutz, Seymour'),
(57, 'Wolsey, Laurence A.'),
(58, 'Kloeden, Peter E. ; Platen, Eckhard'),
(59, 'Budnick, Frank S.'),
(60, 'Bjork, Tomas'),
(61, 'Young, Elizabeth'),
(62, 'Sykes, Plum'),
(63, 'Subagyo, Pangestu ; Asri, Marwan ; Handoko, T. Hani'),
(64, 'Grant, Eugene L. ; Leavenworth, Richard S.'),
(65, 'Montgomery, Douglas C. ; Runger, George C.'),
(66, 'Roy, Ranjit K.'),
(67, 'Walpole, Ronald E. ; Myers, Raymond H. ; Myers, Sharon L. ; Keying Ye'),
(68, 'Draper, N.R. ; Smith, H.'),
(69, 'John A. Muckstadt Amar Sapra'),
(70, 'Amitava Mitra'),
(71, 'Valen E. Johnson'),
(72, 'Alan Agresti'),
(73, 'Robert V. Hogg'),
(74, ' Mican Altman   Jeff Gill  Michael P. McDonald'),
(75, 'Douglas C. Montgomery George  C. Runger'),
(76, 'Edinburgh Gate'),
(77, 'Sheldon Ros'),
(78, 'Prof. Dr. Soeparna Darmawijaya'),
(79, 'Ronald E Walpole & Raymond H Myers'),
(80, 'James O. Berger'),
(81, 'Ir. Sri Pinggit Wulandari, MS & Ir. Mutiah Salamah,M.Kes & Dra. Destri Susilaningrum'),
(82, 'E. L. Lehmann'),
(83, 'R. E. Barlow & D. J. Bartholomew and J. M. Bremner & H. D. Brunk'),
(84, 'James R. Thompson & Richard A Tapia'),
(85, 'Sidney Siegel'),
(86, 'Peter Tryfos'),
(87, 'Gouri K. Bhattacharyya & Richard A. Johnson'),
(88, 'Alanin Berlinet & Christine Thomas-Agnan'),
(89, 'Rene A. Carmona'),
(90, 'Anto Dajan'),
(91, 'Matlab'),
(92, 'Dr. Maman A. Djauhari'),
(93, 'Wolfgang Hardle'),
(94, 'V.G. Kulkarni'),
(95, 'Anderson Sweeney'),
(96, 'J.S Dagpunar'),
(97, 'W.David Kelton'),
(98, 'Prof.Dr.Jogiyanto H.M, M.B.A.,Akt.'),
(99, 'Dwiratmono Agus Widodo'),
(100, 'Robert Tibshirani'),
(101, 'Wiwiek Suleman'),
(102, 'Siswanto'),
(103, 'Edhy Sutanta'),
(104, 'Prof.Dr.S. Nasutio.M.A'),
(105, 'Abdul Kadir'),
(106, 'Azlinah Mohammed'),
(107, 'William G. Cochran'),
(108, 'Howard M. Taylor'),
(109, 'Dra. Destri Susila Ningrum. MSI '),
(110, 'John D.Kalbfleisch'),
(111, 'garret Fitzmaurice'),
(112, 'Muhammad Bayu Setiadi'),
(113, 'Hermawan Kartajaya'),
(114, ' John M. Echols'),
(115, 'Budi Permana'),
(116, 'John Willey'),
(117, 'Edy Winarno ST,M.Eng'),
(118, ' Joni Hermana'),
(119, 'Masri Singarimbun'),
(120, ' Gennady sanorodnitsky Murad S. Taqqu'),
(121, 'Bambang Sumintono'),
(122, 'Thomas J.Kakiay'),
(123, 'Adi Kurniadi'),
(124, ' Alan Agresti'),
(125, 'Larry Gonick'),
(126, 'Prof.DR.Sudjana, M. A.,M.Sc.'),
(127, 'J.Green '),
(128, 'Steven C.Chapra,Raymond P.Canale'),
(129, 'A.W. Van Der Vaart'),
(130, 'J.Berger.s.Feinberg'),
(131, 'Drs.Nar Herrhyanto, M.Pd.'),
(132, 'Roger L.Berger'),
(133, 'Drs.Haryono, MSIE'),
(134, 'Unknown Penulis'),
(135, 'John Aliano'),
(136, 'Judea Perl'),
(137, 'Kendal E.Atkinson'),
(138, 'George Lindfield'),
(139, 'Steven  C. Chapra'),
(140, 'George E.P.BOX'),
(141, 'Andi Hakim Nasution'),
(142, 'Prof.Dr.Sudjana,M.A.,M.Sc.'),
(143, 'Edwin K.P.Chong.'),
(144, 'A.L.Peressini'),
(145, 'Prof.Dr.Soeparna Darmawijaya'),
(146, 'Neil H. Timm'),
(147, 'Pravin K.Trivedi'),
(148, 'Robert Bartoszynski'),
(149, 'Ashish Sen'),
(150, 'Patrick Billingsley'),
(151, 'Wolfgang Karl Hardle'),
(152, 'Alvin C.Rencher.'),
(153, 'david Kincaid'),
(154, 'Eko Nurmianto'),
(155, 'Jay Heizer'),
(156, 'Kamaruddin Ahmad,S.E., M.M.'),
(157, 'Ahmad Dimyati'),
(158, 'R.C. Gupta'),
(159, 'Drs.Faustino Cardoso Gomes'),
(160, 'Robert J.Kodoatie'),
(161, 'Bharat Kolluri'),
(162, 'Christian Gourierouk'),
(163, 'M.J.Crowder'),
(164, ' John A. Muckstadt'),
(165, 'Linda C.Wolstenholme'),
(166, 'Prof.Johannes Supranto, M.A.,'),
(167, 'Dr. .Suhartno'),
(168, 'Drs. H. Nur Iriawan, M. Ikom, Ph.D.'),
(169, 'Ling Lukman, Ph.D'),
(170, 'William G. Sulivan'),
(171, 'Drs. H.Nur Iriawan,M. Ikom,Ph.D'),
(172, 'Dr.Suhartono'),
(173, 'Naresh K.Malhotra'),
(174, 'Jeff Madura'),
(175, 'N Rvichandran'),
(176, 'Drs.Sahid, M.Sc.'),
(177, 'Charles E.Ebeling'),
(178, 'Hamdy A Taha'),
(179, 'M.Asghar Bhatti'),
(180, 'Shunji Osaki'),
(181, 'Robert B. Ash'),
(182, 'Richard Haberman'),
(183, 'Mayer Humi'),
(184, 'Andrew Bruee'),
(185, 'R Todd Ogden'),
(186, 'Drs.Wahyudin.M.Pd.'),
(187, 'J.O.Bird'),
(188, 'Dr.M.Fogiel,Director'),
(189, 'John Wiley'),
(190, 'Norm O\'Rourke'),
(191, 'Lokenath Debnath'),
(192, 'Maurice G.Kendall, M.A., Sc.D.'),
(193, 'Dosen Dosen Matematika'),
(194, 'Soehardjo'),
(195, 'Second Edition'),
(196, 'Norman L. Johnson'),
(197, 'Philippe Jorion'),
(198, 'P.P.B. Eggermont'),
(199, 'W.N. Venables'),
(200, 'William A. Adkins'),
(201, 'Pearson International edition'),
(202, 'George J.Klir'),
(203, 'Carl De Boor'),
(204, 'Franklin A.Graybill'),
(205, 'Dr.I Nyoman Budiantara, Ms.'),
(206, 'Chong Gu'),
(207, 'Charles G.Cullen'),
(208, 'Dale Varberg'),
(209, 'Reuven Y. Rubinstein'),
(210, 'Dr. I Nyoman Budiantara,MS'),
(211, 'B.W.Silverman'),
(212, 'Lawrence C.Marsh'),
(213, 'Athanasios Papoulis'),
(214, 'W. Hardle'),
(215, 'V.P.Minorsky'),
(216, 'Drs. Mashuri MT'),
(217, 'Prof.SubhanarPh.D'),
(218, 'David Salomon'),
(219, 'Suherman Rosyidi'),
(220, 'I Nyoman Pujawan'),
(221, 'Setiawan'),
(222, 'Dimitrios Asteriou'),
(223, 'Ruey S. Tsay'),
(224, 'Dr.Muhammad Mashuri,MT'),
(225, 'Sritomo Wignjosoebroto'),
(226, 'S.R.Searlf'),
(227, 'Asep Saefuddin'),
(228, 'Drs.Kusnadi,M.A.'),
(229, 'Khairil Anwar Notidiputro'),
(230, 'Maurice sasieni'),
(231, 'Sritua Arief'),
(232, 'Ronald J. Wonnacott'),
(233, 'Drs.Djoko Hartanto,M.Si'),
(234, 'Daniel Mohammad Rosyid'),
(235, 'Michel Crouhy'),
(236, 'Anirban Dasgupta'),
(237, 'Michael R.Korosok'),
(238, 'M.P. Wand'),
(239, 'Joseph F.Hair Jr.'),
(240, 'Jochen Voss'),
(241, 'Prof. Ir.Soegiono'),
(242, 'Dra. Agnes Tuti Rumiati , M. Sc.'),
(243, 'David G.Kleinbaum'),
(244, 'I.T. Jolliffe'),
(245, 'Murray Aitkin'),
(246, 'David W. Hosmer ,Jr.'),
(247, 'Schaum\'s'),
(248, 'John Moubray.'),
(249, 'Richard A. Johnson'),
(250, 'P.McCullagh Frs'),
(251, 'David W. Scott'),
(252, 'Norman Draper.'),
(253, 'Siti Nurhalimah,dkk'),
(254, 'Joni Hermana'),
(255, 'Wilfrid J.Dixon'),
(256, 'Wayne W. Daniel'),
(257, 'Alfredo H S . Ang'),
(258, 'Douglas C. Montgomery'),
(259, 'Douglas C.Montgomery'),
(260, 'Dougla C. Montgomery'),
(261, 'Ronald E Walpole'),
(262, 'Shofi Andari'),
(263, 'Ir Adi Suryanto'),
(264, 'Walter Nicholson'),
(265, 'Leland Blank PE'),
(266, 'John Jarvis'),
(267, 'Richar E Dover'),
(268, 'Roberta S. Rusell'),
(269, 'Chase'),
(270, 'Raymond H. Myers, Janet S. Milton'),
(271, 'Eric Sowey'),
(272, 'James B. Ramsey'),
(273, 'Julie Rodriguez'),
(274, 'sas'),
(275, 'Advisionario'),
(276, 'Samuel Kotz'),
(277, 'Dosen Jurusan Mmatematika'),
(278, 'M.Abdulmajid'),
(279, 'Allan G Bluman'),
(280, 'HIMADATA ITS'),
(281, 'Susilaningrum, Destri'),
(282, 'Luc Anselin'),
(283, 'Wignjosoebroto, Sritomo'),
(284, 'Ghozali, Imam; Ratmono, Dwi'),
(285, 'William Strunk JR. And E.B. White'),
(286, 'Fitriana; Hendarwan, Harimat'),
(287, 'Dahlan, M. Sopiyudin'),
(288, 'Nugroho, Bernardus Y ; Saragih, Ferdinand D ; Eko, Umanto'),
(289, 'Aditiawan, Rangga ; Bianca, Ferren'),
(290, 'Hermanto; Fahmi, Arfan'),
(291, 'Soejieti, Zanzawi'),
(292, 'Subanar'),
(293, 'David W.Hosmer,Jr.,Stanley Lemeshow'),
(294, 'William H. Greene'),
(295, 'Madan Lal Puri,Pranab Kumar Sen'),
(296, 'A.Steward Fotheringham,Chris Brunsdon,Martin Charlton'),
(297, 'Douglas C.Montgomery,Elizabeth A. Peck,G. Geoffrey Vining'),
(298, 'George Casella,Roger L. Berger'),
(299, 'Howard M.Taylor,Samuel Karlin'),
(300, 'Zainudin Zukhri'),
(301, 'B R Bhat'),
(302, 'Randy L. Haupt,Sue Ellen Haupt'),
(303, 'John W. Turkey'),
(304, 'Duane Hanselman,Bruce Littlefield'),
(305, 'Robert J. Serfling'),
(306, 'Roderick J. A. Little,Donald B.rubin'),
(307, 'Ir. Hari Suminto'),
(308, 'Jonathan D.Cryer'),
(309, 'Samuel Kotz,Norman L. Johnson'),
(310, 'G. Lindfield,J .Penny'),
(311, 'Ronald P.Cody,Jeffrey K. Smith'),
(312, 'Raymod H. Myers'),
(313, 'Richard A. johnson,Dean W.Wichern'),
(314, 'William W. S. Wei'),
(315, 'James R. Schott'),
(316, 'Maura E. Stokes,Charles S. Davis,Gary G. Koch'),
(317, 'Alpha C. Chiang,Kevin WainWright'),
(318, 'Dr. Irhamah,M.Si'),
(319, 'Charles T. Haan'),
(320, 'Daniel Pena'),
(321, 'George E.P Box,William G.Hunter,J.Stuart Hunter'),
(322, 'George G. Judge'),
(323, 'sg Ferryanto'),
(324, 'Andre I.Khuri'),
(325, 'Andrew V. Metcalfe'),
(326, 'A. Colin Cameron,Pravin K. Triveda'),
(327, 'Badi H. Baltagi'),
(328, 'George E.P Box'),
(329, 'Dr. Ir H.x. Lin'),
(330, 'Gouri K. Bhattacharyya,Richard A. Johnson'),
(331, 'Vini Indriasari, S.T.,M.Sc,Ph.D.'),
(332, 'Dick London'),
(333, 'Thomas L. Saaty'),
(334, 'John D. paliouras,Wibisono Gunawan'),
(335, 'Sri Kusumadewi'),
(336, 'Bernt Oksendal'),
(337, 'Saifuddin Azwar'),
(338, 'R. Soegeng'),
(339, 'Yvonne M. M. Bishop'),
(340, 'Marvin Ch. Wijaya'),
(341, 'Erick Paulus, S.Si, M.Kom,Yessica Natalia, S.Si., M.Kom.'),
(342, 'Norman Draper,Harry Smith'),
(343, 'Prof. Jogiyanto HM, M.B.A., Ph.D.,Ak.'),
(344, 'Joseph f. Hair, JR.'),
(345, 'Eko Pratseyo'),
(346, 'Suyanto'),
(347, 'Damodar N. Gujarati'),
(348, 'Setyo Hari Wijanto');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rak`
--

CREATE TABLE `tb_rak` (
  `id_rak` int NOT NULL,
  `nama_rak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rak`
--

INSERT INTO `tb_rak` (`id_rak`, `nama_rak`) VALUES
(1, 'Rak A (Fiksi)'),
(2, 'Rak B (Sains)'),
(3, 'Rak C (Sejarah)'),
(4, 'Rak D (Bahasa)'),
(5, 'Rak E (Komputer)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_magang`
--
ALTER TABLE `tb_magang`
  ADD PRIMARY KEY (`id_magang`);

--
-- Indexes for table `tb_pa`
--
ALTER TABLE `tb_pa`
  ADD PRIMARY KEY (`id_pa`);

--
-- Indexes for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`);

--
-- Indexes for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indexes for table `tb_rak`
--
ALTER TABLE `tb_rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_magang`
--
ALTER TABLE `tb_magang`
  MODIFY `id_magang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pa`
--
ALTER TABLE `tb_pa`
  MODIFY `id_pa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_penerbit`
--
ALTER TABLE `tb_penerbit`
  MODIFY `id_penerbit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  MODIFY `id_pengunjung` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_penulis`
--
ALTER TABLE `tb_penulis`
  MODIFY `id_penulis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `tb_rak`
--
ALTER TABLE `tb_rak`
  MODIFY `id_rak` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
