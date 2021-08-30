-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2021 pada 04.12
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skydental-clinic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangs`
--

CREATE TABLE `barangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('barang','service') COLLATE utf8mb4_unicode_ci NOT NULL,
  `durasi` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barangs`
--

INSERT INTO `barangs` (`id`, `kode_barang`, `nama_barang`, `jenis`, `durasi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '343443', 'Pemutih Gigi', 'barang', 0, 1, '2021-07-16 20:15:37', '2021-07-16 20:15:37'),
(2, '232332', 'Obat Kumur', 'barang', 0, 1, '2021-07-16 20:15:45', '2021-07-16 20:15:45'),
(3, '556565', 'Bleaching', 'service', 20, 1, '2021-07-16 20:16:03', '2021-07-16 20:16:56'),
(4, '343445', 'Scalling', 'service', 25, 1, '2021-07-16 20:16:14', '2021-07-16 20:17:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_booking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `resepsionis_id` bigint(20) UNSIGNED NOT NULL,
  `ob_id` bigint(20) UNSIGNED NOT NULL,
  `perawat_id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `tindakan_id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` int(225) UNSIGNED NOT NULL,
  `status_pembayaran` int(11) NOT NULL,
  `tanggal_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_kedatangan_id` int(11) UNSIGNED NOT NULL,
  `jam_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_selesai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `no_booking`, `marketing_id`, `dokter_id`, `resepsionis_id`, `ob_id`, `perawat_id`, `cabang_id`, `customer_id`, `tindakan_id`, `jadwal_id`, `status_pembayaran`, `tanggal_status`, `status_kedatangan_id`, `jam_status`, `jam_selesai`, `is_active`, `created_at`, `updated_at`) VALUES
(22, 'Tebet1_20210819_54720883', 4, 2, 1, 2, 2, 1, 13, 1, 20, 1, '2021-08-20', 1, '09:00:00', '10:30:00', '1', '2021-08-19 15:20:23', '2021-08-19 15:20:23'),
(23, 'Tebet1_20210819_932361523', 4, 2, 1, 2, 2, 1, 14, 1, 20, 1, '2021-08-20', 1, '10:30:00', '12:25:00', '1', '2021-08-19 15:21:19', '2021-08-19 15:21:19'),
(25, 'Tebet1_20210819_1803562194', 4, 3, 1, 3, 3, 1, 15, 1, 51, 1, '2021-08-20', 1, '09:00:00', '09:50:00', '1', '2021-08-19 15:55:25', '2021-08-19 15:55:25'),
(36, 'Tebet1_20210819_1510031825', 4, 2, 1, 2, 2, 1, 13, 1, 79, 1, '2021-08-20', 1, '15:00:00', '15:45:00', '1', '2021-08-19 16:53:04', '2021-08-19 16:53:04'),
(38, 'Tebet1_20210819_1570933280', 4, 3, 1, 3, 3, 1, 15, 1, 82, 1, '2021-08-20', 1, '15:00:00', '16:05:00', '1', '2021-08-19 16:54:39', '2021-08-19 16:54:39'),
(39, 'Tebet1_20210820_139153006', 4, 3, 1, 3, 3, 1, 13, 1, 51, 1, '2021-08-20', 1, '10:47:18', '11:47:18', '1', '2021-08-20 03:47:37', '2021-08-20 03:47:37'),
(41, 'Tebet1_20210820_487468501', 4, 2, 1, 2, 2, 1, 13, 1, 79, 1, '2021-08-20', 1, '15:45:00', '16:55:00', '1', '2021-08-20 04:29:33', '2021-08-20 04:29:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabangs`
--

CREATE TABLE `cabangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telpon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cabangs`
--

INSERT INTO `cabangs` (`id`, `nama`, `alamat`, `telpon`, `email`, `wa`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tebet', 'Jl Tebet', '08977356372533', 'tebet@gmail.com', '08977356372533', 1, '2021-07-16 19:58:17', '2021-07-16 19:58:17'),
(2, 'Kemang', 'Kemang', '12344124', 'Kemang@gmail.com', '124135', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rek` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik_ktp` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('Laki-Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `suku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pict` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `cabang_id`, `nama`, `no_telp`, `no_rek`, `nik_ktp`, `email`, `ttl`, `jk`, `suku`, `alamat`, `pekerjaan`, `pict`, `is_active`, `created_at`, `updated_at`) VALUES
(13, 4, 1, 'Ichsan Arrizqi', '081296031743', '6634', '11806634', 'ichsanarrizqi@smkwikrama.sch.id', 'Bogor, 2002-11-25', 'Laki-Laki', 'Sunda', 'Bogor', 'Programmer', 'images/patients/J7va7zdB8ecXEMf.jpg', 1, '2021-08-19 15:17:24', '2021-08-19 15:17:24'),
(14, 4, 1, 'M Iqbal', '089678654872', '19876565', '8976', 'iqbal@gmail.com', 'Jakarta Timur, 1998-01-13', 'Laki-Laki', 'Betawi', 'Jakarta Timur', 'Programmer', 'images/patients/2Tmfh7q0WddVY9J.png', 1, '2021-08-19 15:19:13', '2021-08-19 15:19:13'),
(15, 4, 1, 'Rizal', '087653458798', '09876545', '676345', 'rizal@gmail.com', 'Caringin, 2005-06-19', 'Laki-Laki', 'Sunda', 'Caringin', 'Mancing Keributan', 'images/patients/qG3P7hto3Jbbo5d.png', 1, '2021-08-19 15:25:46', '2021-08-19 15:25:46'),
(16, 4, 1, 'Rizal', '12341241234', '9890789', '7568678967', 'rizal123@gmail.com', 'Jakarta Timur, 1998-03-20', 'Laki-Laki', 'British', 'Jakarta Timur', 'Miner', 'images/patients/JBCEZ4j8wGHWIME.jpg', 1, '2021-08-20 04:01:27', '2021-08-20 04:01:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gigipasien`
--

CREATE TABLE `gigipasien` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `p11c` varchar(32) NOT NULL DEFAULT 'sou',
  `p11t` varchar(32) NOT NULL DEFAULT 'sou',
  `p11b` varchar(32) NOT NULL DEFAULT 'sou',
  `p11l` varchar(32) NOT NULL DEFAULT 'sou',
  `p11r` varchar(32) NOT NULL DEFAULT 'sou',
  `p12c` varchar(32) NOT NULL DEFAULT 'sou',
  `p12t` varchar(32) NOT NULL DEFAULT 'sou',
  `p12b` varchar(32) NOT NULL DEFAULT 'sou',
  `p12l` varchar(32) NOT NULL DEFAULT 'sou',
  `p12r` varchar(32) NOT NULL DEFAULT 'sou',
  `p13c` varchar(32) NOT NULL DEFAULT 'sou',
  `p13t` varchar(32) NOT NULL DEFAULT 'sou',
  `p13b` varchar(32) NOT NULL DEFAULT 'sou',
  `p13l` varchar(32) NOT NULL DEFAULT 'sou',
  `p13r` varchar(32) NOT NULL DEFAULT 'sou',
  `p14c` varchar(32) NOT NULL DEFAULT 'sou',
  `p14t` varchar(32) NOT NULL DEFAULT 'sou',
  `p14b` varchar(32) NOT NULL DEFAULT 'sou',
  `p14l` varchar(32) NOT NULL DEFAULT 'sou',
  `p14r` varchar(32) NOT NULL DEFAULT 'sou',
  `p15c` varchar(32) NOT NULL DEFAULT 'sou',
  `p15t` varchar(32) NOT NULL DEFAULT 'sou',
  `p15b` varchar(32) NOT NULL DEFAULT 'sou',
  `p15l` varchar(32) NOT NULL DEFAULT 'sou',
  `p15r` varchar(32) NOT NULL DEFAULT 'sou',
  `p16c` varchar(32) NOT NULL DEFAULT 'sou',
  `p16t` varchar(32) NOT NULL DEFAULT 'sou',
  `p16b` varchar(32) NOT NULL DEFAULT 'sou',
  `p16l` varchar(32) NOT NULL DEFAULT 'sou',
  `p16r` varchar(32) NOT NULL DEFAULT 'sou',
  `p17c` varchar(32) NOT NULL DEFAULT 'sou',
  `p17t` varchar(32) NOT NULL DEFAULT 'sou',
  `p17b` varchar(32) NOT NULL DEFAULT 'sou',
  `p17l` varchar(32) NOT NULL DEFAULT 'sou',
  `p17r` varchar(32) NOT NULL DEFAULT 'sou',
  `p18c` varchar(32) NOT NULL DEFAULT 'sou',
  `p18t` varchar(32) NOT NULL DEFAULT 'sou',
  `p18b` varchar(32) NOT NULL DEFAULT 'sou',
  `p18l` varchar(32) NOT NULL DEFAULT 'sou',
  `p18r` varchar(32) NOT NULL DEFAULT 'sou',
  `p21c` varchar(32) NOT NULL DEFAULT 'sou',
  `p21t` varchar(32) NOT NULL DEFAULT 'sou',
  `p21b` varchar(32) NOT NULL DEFAULT 'sou',
  `p21l` varchar(32) NOT NULL DEFAULT 'sou',
  `p21r` varchar(32) NOT NULL DEFAULT 'sou',
  `p22c` varchar(32) NOT NULL DEFAULT 'sou',
  `p22t` varchar(32) NOT NULL DEFAULT 'sou',
  `p22b` varchar(32) NOT NULL DEFAULT 'sou',
  `p22l` varchar(32) NOT NULL DEFAULT 'sou',
  `p22r` varchar(32) NOT NULL DEFAULT 'sou',
  `p23c` varchar(32) NOT NULL DEFAULT 'sou',
  `p23t` varchar(32) NOT NULL DEFAULT 'sou',
  `p23b` varchar(32) NOT NULL DEFAULT 'sou',
  `p23l` varchar(32) NOT NULL DEFAULT 'sou',
  `p23r` varchar(32) NOT NULL DEFAULT 'sou',
  `p24c` varchar(32) NOT NULL DEFAULT 'sou',
  `p24t` varchar(32) NOT NULL DEFAULT 'sou',
  `p24b` varchar(32) NOT NULL DEFAULT 'sou',
  `p24l` varchar(32) NOT NULL DEFAULT 'sou',
  `p24r` varchar(32) NOT NULL DEFAULT 'sou',
  `p25c` varchar(32) NOT NULL DEFAULT 'sou',
  `p25t` varchar(32) NOT NULL DEFAULT 'sou',
  `p25b` varchar(32) NOT NULL DEFAULT 'sou',
  `p25l` varchar(32) NOT NULL DEFAULT 'sou',
  `p25r` varchar(32) NOT NULL DEFAULT 'sou',
  `p26c` varchar(32) NOT NULL DEFAULT 'sou',
  `p26t` varchar(32) NOT NULL DEFAULT 'sou',
  `p26b` varchar(32) NOT NULL DEFAULT 'sou',
  `p26l` varchar(32) NOT NULL DEFAULT 'sou',
  `p26r` varchar(32) NOT NULL DEFAULT 'sou',
  `p27c` varchar(32) NOT NULL DEFAULT 'sou',
  `p27t` varchar(32) NOT NULL DEFAULT 'sou',
  `p27b` varchar(32) NOT NULL DEFAULT 'sou',
  `p27l` varchar(32) NOT NULL DEFAULT 'sou',
  `p27r` varchar(32) NOT NULL DEFAULT 'sou',
  `p28c` varchar(32) NOT NULL DEFAULT 'sou',
  `p28t` varchar(32) NOT NULL DEFAULT 'sou',
  `p28b` varchar(32) NOT NULL DEFAULT 'sou',
  `p28l` varchar(32) NOT NULL DEFAULT 'sou',
  `p28r` varchar(32) NOT NULL DEFAULT 'sou',
  `p51c` varchar(32) NOT NULL DEFAULT 'sou',
  `p51t` varchar(32) NOT NULL DEFAULT 'sou',
  `p51b` varchar(32) NOT NULL DEFAULT 'sou',
  `p51l` varchar(32) NOT NULL DEFAULT 'sou',
  `p51r` varchar(32) NOT NULL DEFAULT 'sou',
  `p52c` varchar(32) NOT NULL DEFAULT 'sou',
  `p52t` varchar(32) NOT NULL DEFAULT 'sou',
  `p52b` varchar(32) NOT NULL DEFAULT 'sou',
  `p52l` varchar(32) NOT NULL DEFAULT 'sou',
  `p52r` varchar(32) NOT NULL DEFAULT 'sou',
  `p53c` varchar(32) NOT NULL DEFAULT 'sou',
  `p53t` varchar(32) NOT NULL DEFAULT 'sou',
  `p53b` varchar(32) NOT NULL DEFAULT 'sou',
  `p53l` varchar(32) NOT NULL DEFAULT 'sou',
  `p53r` varchar(32) NOT NULL DEFAULT 'sou',
  `p54c` varchar(32) NOT NULL DEFAULT 'sou',
  `p54t` varchar(32) NOT NULL DEFAULT 'sou',
  `p54b` varchar(32) NOT NULL DEFAULT 'sou',
  `p54l` varchar(32) NOT NULL DEFAULT 'sou',
  `p54r` varchar(32) NOT NULL DEFAULT 'sou',
  `p55c` varchar(32) NOT NULL DEFAULT 'sou',
  `p55t` varchar(32) NOT NULL DEFAULT 'sou',
  `p55b` varchar(32) NOT NULL DEFAULT 'sou',
  `p55l` varchar(32) NOT NULL DEFAULT 'sou',
  `p55r` varchar(32) NOT NULL DEFAULT 'sou',
  `p61c` varchar(32) NOT NULL DEFAULT 'sou',
  `p61t` varchar(32) NOT NULL DEFAULT 'sou',
  `p61b` varchar(32) NOT NULL DEFAULT 'sou',
  `p61l` varchar(32) NOT NULL DEFAULT 'sou',
  `p61r` varchar(32) NOT NULL DEFAULT 'sou',
  `p62c` varchar(32) NOT NULL DEFAULT 'sou',
  `p62t` varchar(32) NOT NULL DEFAULT 'sou',
  `p62b` varchar(32) NOT NULL DEFAULT 'sou',
  `p62l` varchar(32) NOT NULL DEFAULT 'sou',
  `p62r` varchar(32) NOT NULL DEFAULT 'sou',
  `p63c` varchar(32) NOT NULL DEFAULT 'sou',
  `p63t` varchar(32) NOT NULL DEFAULT 'sou',
  `p63b` varchar(32) NOT NULL DEFAULT 'sou',
  `p63l` varchar(32) NOT NULL DEFAULT 'sou',
  `p63r` varchar(32) NOT NULL DEFAULT 'sou',
  `p64c` varchar(32) NOT NULL DEFAULT 'sou',
  `p64t` varchar(32) NOT NULL DEFAULT 'sou',
  `p64b` varchar(32) NOT NULL DEFAULT 'sou',
  `p64l` varchar(32) NOT NULL DEFAULT 'sou',
  `p64r` varchar(32) NOT NULL DEFAULT 'sou',
  `p65c` varchar(32) NOT NULL DEFAULT 'sou',
  `p65t` varchar(32) NOT NULL DEFAULT 'sou',
  `p65b` varchar(32) NOT NULL DEFAULT 'sou',
  `p65l` varchar(32) NOT NULL DEFAULT 'sou',
  `p65r` varchar(32) NOT NULL DEFAULT 'sou',
  `p81c` varchar(32) NOT NULL DEFAULT 'sou',
  `p81t` varchar(32) NOT NULL DEFAULT 'sou',
  `p81b` varchar(32) NOT NULL DEFAULT 'sou',
  `p81l` varchar(32) NOT NULL DEFAULT 'sou',
  `p81r` varchar(32) NOT NULL DEFAULT 'sou',
  `p82c` varchar(32) NOT NULL DEFAULT 'sou',
  `p82t` varchar(32) NOT NULL DEFAULT 'sou',
  `p82b` varchar(32) NOT NULL DEFAULT 'sou',
  `p82l` varchar(32) NOT NULL DEFAULT 'sou',
  `p82r` varchar(32) NOT NULL DEFAULT 'sou',
  `p83c` varchar(32) NOT NULL DEFAULT 'sou',
  `p83t` varchar(32) NOT NULL DEFAULT 'sou',
  `p83b` varchar(32) NOT NULL DEFAULT 'sou',
  `p83l` varchar(32) NOT NULL DEFAULT 'sou',
  `p83r` varchar(32) NOT NULL DEFAULT 'sou',
  `p84c` varchar(32) NOT NULL DEFAULT 'sou',
  `p84t` varchar(32) NOT NULL DEFAULT 'sou',
  `p84b` varchar(32) NOT NULL DEFAULT 'sou',
  `p84l` varchar(32) NOT NULL DEFAULT 'sou',
  `p84r` varchar(32) NOT NULL DEFAULT 'sou',
  `p85c` varchar(32) NOT NULL DEFAULT 'sou',
  `p85t` varchar(32) NOT NULL DEFAULT 'sou',
  `p85b` varchar(32) NOT NULL DEFAULT 'sou',
  `p85l` varchar(32) NOT NULL DEFAULT 'sou',
  `p85r` varchar(32) NOT NULL DEFAULT 'sou',
  `p71c` varchar(32) NOT NULL DEFAULT 'sou',
  `p71t` varchar(32) NOT NULL DEFAULT 'sou',
  `p71b` varchar(32) NOT NULL DEFAULT 'sou',
  `p71l` varchar(32) NOT NULL DEFAULT 'sou',
  `p71r` varchar(32) NOT NULL DEFAULT 'sou',
  `p72c` varchar(32) NOT NULL DEFAULT 'sou',
  `p72t` varchar(32) NOT NULL DEFAULT 'sou',
  `p72b` varchar(32) NOT NULL DEFAULT 'sou',
  `p72l` varchar(32) NOT NULL DEFAULT 'sou',
  `p72r` varchar(32) NOT NULL DEFAULT 'sou',
  `p73c` varchar(32) NOT NULL DEFAULT 'sou',
  `p73t` varchar(32) NOT NULL DEFAULT 'sou',
  `p73b` varchar(32) NOT NULL DEFAULT 'sou',
  `p73l` varchar(32) NOT NULL DEFAULT 'sou',
  `p73r` varchar(32) NOT NULL DEFAULT 'sou',
  `p74c` varchar(32) NOT NULL DEFAULT 'sou',
  `p74t` varchar(32) NOT NULL DEFAULT 'sou',
  `p74b` varchar(32) NOT NULL DEFAULT 'sou',
  `p74l` varchar(32) NOT NULL DEFAULT 'sou',
  `p74r` varchar(32) NOT NULL DEFAULT 'sou',
  `p75c` varchar(32) NOT NULL DEFAULT 'sou',
  `p75t` varchar(32) NOT NULL DEFAULT 'sou',
  `p75b` varchar(32) NOT NULL DEFAULT 'sou',
  `p75l` varchar(32) NOT NULL DEFAULT 'sou',
  `p75r` varchar(32) NOT NULL DEFAULT 'sou',
  `p41c` varchar(32) NOT NULL DEFAULT 'sou',
  `p41t` varchar(32) NOT NULL DEFAULT 'sou',
  `p41b` varchar(32) NOT NULL DEFAULT 'sou',
  `p41l` varchar(32) NOT NULL DEFAULT 'sou',
  `p41r` varchar(32) NOT NULL DEFAULT 'sou',
  `p42c` varchar(32) NOT NULL DEFAULT 'sou',
  `p42t` varchar(32) NOT NULL DEFAULT 'sou',
  `p42b` varchar(32) NOT NULL DEFAULT 'sou',
  `p42l` varchar(32) NOT NULL DEFAULT 'sou',
  `p42r` varchar(32) NOT NULL DEFAULT 'sou',
  `p43c` varchar(32) NOT NULL DEFAULT 'sou',
  `p43t` varchar(32) NOT NULL DEFAULT 'sou',
  `p43b` varchar(32) NOT NULL DEFAULT 'sou',
  `p43l` varchar(32) NOT NULL DEFAULT 'sou',
  `p43r` varchar(32) NOT NULL DEFAULT 'sou',
  `p44c` varchar(32) NOT NULL DEFAULT 'sou',
  `p44t` varchar(32) NOT NULL DEFAULT 'sou',
  `p44b` varchar(32) NOT NULL DEFAULT 'sou',
  `p44l` varchar(32) NOT NULL DEFAULT 'sou',
  `p44r` varchar(32) NOT NULL DEFAULT 'sou',
  `p45c` varchar(32) NOT NULL DEFAULT 'sou',
  `p45t` varchar(32) NOT NULL DEFAULT 'sou',
  `p45b` varchar(32) NOT NULL DEFAULT 'sou',
  `p45l` varchar(32) NOT NULL DEFAULT 'sou',
  `p45r` varchar(32) NOT NULL DEFAULT 'sou',
  `p46c` varchar(32) NOT NULL DEFAULT 'sou',
  `p46t` varchar(32) NOT NULL DEFAULT 'sou',
  `p46b` varchar(32) NOT NULL DEFAULT 'sou',
  `p46l` varchar(32) NOT NULL DEFAULT 'sou',
  `p46r` varchar(32) NOT NULL DEFAULT 'sou',
  `p47c` varchar(32) NOT NULL DEFAULT 'sou',
  `p47t` varchar(32) NOT NULL DEFAULT 'sou',
  `p47b` varchar(32) NOT NULL DEFAULT 'sou',
  `p47l` varchar(32) NOT NULL DEFAULT 'sou',
  `p47r` varchar(32) NOT NULL DEFAULT 'sou',
  `p48c` varchar(32) NOT NULL DEFAULT 'sou',
  `p48t` varchar(32) NOT NULL DEFAULT 'sou',
  `p48b` varchar(32) NOT NULL DEFAULT 'sou',
  `p48l` varchar(32) NOT NULL DEFAULT 'sou',
  `p48r` varchar(32) NOT NULL DEFAULT 'sou',
  `p31c` varchar(32) NOT NULL DEFAULT 'sou',
  `p31t` varchar(32) NOT NULL DEFAULT 'sou',
  `p31b` varchar(32) NOT NULL DEFAULT 'sou',
  `p31l` varchar(32) NOT NULL DEFAULT 'sou',
  `p31r` varchar(32) NOT NULL DEFAULT 'sou',
  `p32c` varchar(32) NOT NULL DEFAULT 'sou',
  `p32t` varchar(32) NOT NULL DEFAULT 'sou',
  `p32b` varchar(32) NOT NULL DEFAULT 'sou',
  `p32l` varchar(32) NOT NULL DEFAULT 'sou',
  `p32r` varchar(32) NOT NULL DEFAULT 'sou',
  `p33c` varchar(32) NOT NULL DEFAULT 'sou',
  `p33t` varchar(32) NOT NULL DEFAULT 'sou',
  `p33b` varchar(32) NOT NULL DEFAULT 'sou',
  `p33l` varchar(32) NOT NULL DEFAULT 'sou',
  `p33r` varchar(32) NOT NULL DEFAULT 'sou',
  `p34c` varchar(32) NOT NULL DEFAULT 'sou',
  `p34t` varchar(32) NOT NULL DEFAULT 'sou',
  `p34b` varchar(32) NOT NULL DEFAULT 'sou',
  `p34l` varchar(32) NOT NULL DEFAULT 'sou',
  `p34r` varchar(32) NOT NULL DEFAULT 'sou',
  `p35c` varchar(32) NOT NULL DEFAULT 'sou',
  `p35t` varchar(32) NOT NULL DEFAULT 'sou',
  `p35b` varchar(32) NOT NULL DEFAULT 'sou',
  `p35l` varchar(32) NOT NULL DEFAULT 'sou',
  `p35r` varchar(32) NOT NULL DEFAULT 'sou',
  `p36c` varchar(32) NOT NULL DEFAULT 'sou',
  `p36t` varchar(32) NOT NULL DEFAULT 'sou',
  `p36b` varchar(32) NOT NULL DEFAULT 'sou',
  `p36l` varchar(32) NOT NULL DEFAULT 'sou',
  `p36r` varchar(32) NOT NULL DEFAULT 'sou',
  `p37c` varchar(32) NOT NULL DEFAULT 'sou',
  `p37t` varchar(32) NOT NULL DEFAULT 'sou',
  `p37b` varchar(32) NOT NULL DEFAULT 'sou',
  `p37l` varchar(32) NOT NULL DEFAULT 'sou',
  `p37r` varchar(32) NOT NULL DEFAULT 'sou',
  `p38c` varchar(32) NOT NULL DEFAULT 'sou',
  `p38t` varchar(32) NOT NULL DEFAULT 'sou',
  `p38b` varchar(32) NOT NULL DEFAULT 'sou',
  `p38l` varchar(32) NOT NULL DEFAULT 'sou',
  `p38r` varchar(32) NOT NULL DEFAULT 'sou',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gigipasien`
--

INSERT INTO `gigipasien` (`id`, `customer_id`, `p11c`, `p11t`, `p11b`, `p11l`, `p11r`, `p12c`, `p12t`, `p12b`, `p12l`, `p12r`, `p13c`, `p13t`, `p13b`, `p13l`, `p13r`, `p14c`, `p14t`, `p14b`, `p14l`, `p14r`, `p15c`, `p15t`, `p15b`, `p15l`, `p15r`, `p16c`, `p16t`, `p16b`, `p16l`, `p16r`, `p17c`, `p17t`, `p17b`, `p17l`, `p17r`, `p18c`, `p18t`, `p18b`, `p18l`, `p18r`, `p21c`, `p21t`, `p21b`, `p21l`, `p21r`, `p22c`, `p22t`, `p22b`, `p22l`, `p22r`, `p23c`, `p23t`, `p23b`, `p23l`, `p23r`, `p24c`, `p24t`, `p24b`, `p24l`, `p24r`, `p25c`, `p25t`, `p25b`, `p25l`, `p25r`, `p26c`, `p26t`, `p26b`, `p26l`, `p26r`, `p27c`, `p27t`, `p27b`, `p27l`, `p27r`, `p28c`, `p28t`, `p28b`, `p28l`, `p28r`, `p51c`, `p51t`, `p51b`, `p51l`, `p51r`, `p52c`, `p52t`, `p52b`, `p52l`, `p52r`, `p53c`, `p53t`, `p53b`, `p53l`, `p53r`, `p54c`, `p54t`, `p54b`, `p54l`, `p54r`, `p55c`, `p55t`, `p55b`, `p55l`, `p55r`, `p61c`, `p61t`, `p61b`, `p61l`, `p61r`, `p62c`, `p62t`, `p62b`, `p62l`, `p62r`, `p63c`, `p63t`, `p63b`, `p63l`, `p63r`, `p64c`, `p64t`, `p64b`, `p64l`, `p64r`, `p65c`, `p65t`, `p65b`, `p65l`, `p65r`, `p81c`, `p81t`, `p81b`, `p81l`, `p81r`, `p82c`, `p82t`, `p82b`, `p82l`, `p82r`, `p83c`, `p83t`, `p83b`, `p83l`, `p83r`, `p84c`, `p84t`, `p84b`, `p84l`, `p84r`, `p85c`, `p85t`, `p85b`, `p85l`, `p85r`, `p71c`, `p71t`, `p71b`, `p71l`, `p71r`, `p72c`, `p72t`, `p72b`, `p72l`, `p72r`, `p73c`, `p73t`, `p73b`, `p73l`, `p73r`, `p74c`, `p74t`, `p74b`, `p74l`, `p74r`, `p75c`, `p75t`, `p75b`, `p75l`, `p75r`, `p41c`, `p41t`, `p41b`, `p41l`, `p41r`, `p42c`, `p42t`, `p42b`, `p42l`, `p42r`, `p43c`, `p43t`, `p43b`, `p43l`, `p43r`, `p44c`, `p44t`, `p44b`, `p44l`, `p44r`, `p45c`, `p45t`, `p45b`, `p45l`, `p45r`, `p46c`, `p46t`, `p46b`, `p46l`, `p46r`, `p47c`, `p47t`, `p47b`, `p47l`, `p47r`, `p48c`, `p48t`, `p48b`, `p48l`, `p48r`, `p31c`, `p31t`, `p31b`, `p31l`, `p31r`, `p32c`, `p32t`, `p32b`, `p32l`, `p32r`, `p33c`, `p33t`, `p33b`, `p33l`, `p33r`, `p34c`, `p34t`, `p34b`, `p34l`, `p34r`, `p35c`, `p35t`, `p35b`, `p35l`, `p35r`, `p36c`, `p36t`, `p36b`, `p36l`, `p36r`, `p37c`, `p37t`, `p37b`, `p37l`, `p37r`, `p38c`, `p38t`, `p38b`, `p38l`, `p38r`, `created_at`, `updated_at`) VALUES
(1, 1, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'amf', 'sou', 'sou', 'sou', 'amf', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-07-27 05:21:12', '2021-07-27 05:21:12'),
(2, 2, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-10 08:26:18', '2021-08-10 15:26:18'),
(3, 3, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-10 08:30:14', '2021-08-10 15:30:14'),
(4, 4, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-12 07:33:12', '2021-08-12 14:33:12'),
(5, 6, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-13 06:02:28', '2021-08-13 13:02:28'),
(6, 8, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-13 19:23:00', '2021-08-14 02:23:00'),
(7, 9, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-13 19:28:14', '2021-08-14 02:28:14'),
(8, 10, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-13 19:29:11', '2021-08-14 02:29:11'),
(9, 11, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-13 19:31:20', '2021-08-14 02:31:20'),
(10, 12, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-18 05:30:50', '2021-08-18 12:30:50'),
(11, 13, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-19 15:17:24', '2021-08-19 22:17:24'),
(12, 14, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-19 15:19:13', '2021-08-19 22:19:13'),
(13, 15, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-19 15:25:46', '2021-08-19 22:25:46'),
(14, 16, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-20 04:01:27', '2021-08-20 11:01:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_produk_cabangs`
--

CREATE TABLE `harga_produk_cabangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL,
  `harga` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `harga_produk_cabangs`
--

INSERT INTO `harga_produk_cabangs` (`id`, `barang_id`, `cabang_id`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2000000, '2021-07-21 18:17:34', '2021-07-21 18:17:34'),
(2, 3, 1, 1500000, '2021-07-21 18:18:38', '2021-07-21 18:18:38'),
(3, 2, 1, 300000, NULL, NULL),
(4, 4, 1, 450000, NULL, NULL),
(5, 3, 2, 300000, NULL, NULL),
(6, 4, 2, 350000, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holiday_date` date NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `holiday_date`, `day`, `created_at`, `updated_at`) VALUES
(1, 'Hari Kemerdekaan', '2021-08-17', 'Tuesday', '2021-08-18 03:40:05', '2021-08-18 03:40:05'),
(2, 'Tahun Baru Islam', '2021-08-15', 'Sunday', '2021-08-18 03:40:35', '2021-08-18 03:40:35'),
(4, 'Pemilihan Umum', '2021-08-25', 'Wednesday', '2021-08-18 03:42:02', '2021-08-18 03:42:02'),
(6, 'Shopping', '2021-08-05', 'Thursday', '2021-08-18 03:47:10', '2021-08-18 03:47:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cabang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ruangan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `user_id`, `cabang_id`, `shift_id`, `ruangan_id`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 2, '2021-08-01', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(2, 2, 1, 1, 2, '2021-08-02', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(3, 2, 1, 1, 2, '2021-08-03', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(4, 2, 1, 1, 2, '2021-08-04', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(5, 2, 1, 3, 2, '2021-08-05', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(6, 2, 1, 1, 2, '2021-08-06', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(7, 2, 1, 1, 2, '2021-08-07', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(8, 2, 1, 1, 2, '2021-08-08', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(9, 2, 1, 1, 2, '2021-08-09', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(10, 2, 1, 1, 2, '2021-08-10', '2021-08-18 03:48:35', '2021-08-18 03:50:00'),
(11, 2, 1, 1, 2, '2021-08-11', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(12, 2, 1, 1, 2, '2021-08-12', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(13, 2, 1, 1, 2, '2021-08-13', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(14, 2, 1, 1, 2, '2021-08-14', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(15, 2, 1, 3, 2, '2021-08-15', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(16, 2, 1, 1, 2, '2021-08-16', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(17, 2, 1, 3, 2, '2021-08-17', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(18, 2, 1, 1, 2, '2021-08-18', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(19, 2, 1, 1, 2, '2021-08-19', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(20, 2, 1, 1, 2, '2021-08-20', '2021-08-18 03:48:35', '2021-08-18 03:50:42'),
(21, 2, 1, 1, 2, '2021-08-21', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(22, 2, 1, 1, 2, '2021-08-22', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(23, 2, 1, 1, 2, '2021-08-23', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(24, 2, 1, 1, 2, '2021-08-24', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(25, 2, 1, 3, 2, '2021-08-25', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(26, 2, 1, 1, 2, '2021-08-26', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(27, 2, 1, 1, 2, '2021-08-27', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(28, 2, 1, 1, 2, '2021-08-28', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(29, 2, 1, 1, 2, '2021-08-29', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(30, 2, 1, 1, 2, '2021-08-30', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(31, 2, 1, 1, 2, '2021-08-31', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(32, 3, 1, 1, 2, '2021-08-01', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(33, 3, 1, 1, 2, '2021-08-02', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(34, 3, 1, 1, 2, '2021-08-03', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(35, 3, 1, 1, 2, '2021-08-04', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(36, 3, 1, 3, 2, '2021-08-05', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(37, 3, 1, 1, 2, '2021-08-06', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(38, 3, 1, 1, 2, '2021-08-07', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(39, 3, 1, 1, 2, '2021-08-08', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(40, 3, 1, 1, 2, '2021-08-09', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(41, 3, 1, 1, 2, '2021-08-10', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(42, 3, 1, 1, 2, '2021-08-11', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(43, 3, 1, 1, 2, '2021-08-12', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(44, 3, 1, 1, 2, '2021-08-13', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(45, 3, 1, 1, 2, '2021-08-14', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(46, 3, 1, 3, 2, '2021-08-15', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(47, 3, 1, 1, 2, '2021-08-16', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(48, 3, 1, 3, 2, '2021-08-17', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(49, 3, 1, 1, 2, '2021-08-18', '2021-08-18 03:48:35', '2021-08-18 03:50:57'),
(50, 3, 1, 1, 2, '2021-08-19', '2021-08-18 03:48:35', '2021-08-18 03:50:57'),
(51, 3, 1, 1, 2, '2021-08-20', '2021-08-18 03:48:35', '2021-08-18 03:50:57'),
(52, 3, 1, 1, 2, '2021-08-21', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(53, 3, 1, 1, 2, '2021-08-22', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(54, 3, 1, 1, 2, '2021-08-23', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(55, 3, 1, 1, 2, '2021-08-24', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(56, 3, 1, 3, 2, '2021-08-25', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(57, 3, 1, 1, 2, '2021-08-26', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(58, 3, 1, 1, 2, '2021-08-27', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(59, 3, 1, 1, 2, '2021-08-28', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(60, 3, 1, 1, 2, '2021-08-29', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(61, 3, 1, 1, 2, '2021-08-30', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(62, 3, 1, 1, 2, '2021-08-31', '2021-08-18 03:48:35', '2021-08-18 03:48:35'),
(63, 2, 1, 2, 2, '2021-08-01', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(64, 2, 1, 2, 2, '2021-08-02', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(65, 2, 1, 2, 2, '2021-08-03', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(66, 2, 1, 2, 2, '2021-08-04', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(67, 2, 1, 2, 2, '2021-08-06', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(68, 2, 1, 2, 2, '2021-08-07', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(69, 2, 1, 2, 2, '2021-08-08', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(70, 2, 1, 2, 2, '2021-08-09', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(71, 2, 1, 2, 2, '2021-08-10', '2021-08-18 03:50:00', '2021-08-18 03:50:00'),
(72, 2, 1, 2, 2, '2021-08-11', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(73, 2, 1, 2, 2, '2021-08-12', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(74, 2, 1, 2, 2, '2021-08-13', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(75, 2, 1, 2, 2, '2021-08-14', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(76, 2, 1, 2, 2, '2021-08-16', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(77, 2, 1, 2, 2, '2021-08-18', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(78, 2, 1, 2, 2, '2021-08-19', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(79, 2, 1, 2, 2, '2021-08-20', '2021-08-18 03:50:42', '2021-08-18 03:50:42'),
(80, 3, 1, 2, 2, '2021-08-18', '2021-08-18 03:50:57', '2021-08-18 03:50:57'),
(81, 3, 1, 2, 2, '2021-08-19', '2021-08-18 03:50:57', '2021-08-18 03:50:57'),
(82, 3, 1, 2, 2, '2021-08-20', '2021-08-18 03:50:57', '2021-08-18 03:50:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komisis`
--

CREATE TABLE `komisis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `persentase` bigint(20) NOT NULL,
  `min_transaksi` bigint(20) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `komisis`
--

INSERT INTO `komisis` (`id`, `role_id`, `persentase`, `min_transaksi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 0, 1, '2021-07-21 05:53:55', '2021-07-21 06:02:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_10_030934_create_permission_tables', 1),
(5, '2021_07_13_080413_create_barangs_table', 1),
(6, '2021_07_14_043218_create_harga_produk_cabangs_table', 1),
(7, '2021_07_15_030150_create_customers_table', 1),
(8, '2021_07_16_002514_create_payments_table', 1),
(9, '2021_07_16_021433_create_status_pasiens_table', 1),
(10, '2021_07_16_031117_create_vouchers_table', 1),
(11, '2021_07_17_022654_create_cabangs_table', 1),
(12, '2021_07_21_123541_create_komisis_table', 2),
(13, '2021_07_22_003352_create_ruangans_table', 3),
(14, '2021_07_26_023617_create_odontograms_table', 4),
(15, '2021_07_26_025104_add_field_to_odontograms_table', 5),
(24, '2021_07_26_033809_create_simbol_odontograms_table', 6),
(25, '2021_07_27_041134_create_rekam_medis_table', 6),
(26, '2021_07_29_034407_create_holidays_table', 6),
(27, '2021_07_29_053600_create_shifts_table', 6),
(28, '2021_07_29_053632_create_jadwals_table', 6),
(29, '2021_08_11_150214_create_tindakans_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(3, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `odontogram_pasien`
--

CREATE TABLE `odontogram_pasien` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `p11c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p11t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p11b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p11l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p11r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p12c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p12t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p12b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p12l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p12r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p13c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p13t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p13b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p13l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p13r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p14c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p14t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p14b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p14l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p14r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p15c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p15t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p15b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p15l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p15r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p16c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p16t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p16b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p16l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p16r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p17c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p17t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p17b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p17l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p17r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p18c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p18t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p18b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p18l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p18r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p21c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p21t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p21b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p21l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p21r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p22c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p22t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p22b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p22l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p22r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p23c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p23t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p23b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p23l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p23r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p24c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p24t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p24b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p24l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p24r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p25c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p25t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p25b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p25l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p25r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p26c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p26t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p26b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p26l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p26r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p27c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p27t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p27b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p27l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p27r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p28c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p28t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p28b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p28l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p28r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p51c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p51t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p51b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p51l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p51r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p52c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p52t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p52b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p52l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p52r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p53c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p53t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p53b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p53l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p53r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p54c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p54t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p54b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p54l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p54r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p55c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p55t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p55b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p55l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p55r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p61c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p61t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p61b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p61l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p61r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p62c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p62t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p62b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p62l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p62r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p63c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p63t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p63b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p63l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p63r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p64c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p64t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p64b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p64l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p64r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p65c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p65t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p65b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p65l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p65r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p81c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p81t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p81b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p81l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p81r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p82c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p82t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p82b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p82l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p82r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p83c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p83t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p83b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p83l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p83r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p84c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p84t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p84b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p84l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p84r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p85c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p85t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p85b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p85l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p85r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p71c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p71t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p71b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p71l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p71r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p72c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p72t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p72b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p72l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p72r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p73c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p73t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p73b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p73l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p73r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p74c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p74t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p74b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p74l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p74r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p75c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p75t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p75b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p75l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p75r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p41c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p41t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p41b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p41l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p41r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p42c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p42t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p42b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p42l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p42r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p43c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p43t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p43b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p43l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p43r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p44c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p44t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p44b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p44l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p44r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p45c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p45t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p45b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p45l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p45r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p46c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p46t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p46b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p46l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p46r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p47c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p47t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p47b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p47l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p47r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p48c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p48t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p48b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p48l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p48r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p31c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p31t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p31b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p31l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p31r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p32c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p32t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p32b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p32l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p32r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p33c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p33t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p33b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p33l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p33r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p34c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p34t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p34b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p34l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p34r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p35c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p35t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p35b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p35l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p35r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p36c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p36t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p36b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p36l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p36r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p37c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p37t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p37b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p37l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p37r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p38c` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p38t` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p38b` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p38l` varchar(32) NOT NULL DEFAULT 'Ivory',
  `p38r` varchar(32) NOT NULL DEFAULT 'Ivory',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `odontogram_pasien`
--

INSERT INTO `odontogram_pasien` (`id`, `customer_id`, `p11c`, `p11t`, `p11b`, `p11l`, `p11r`, `p12c`, `p12t`, `p12b`, `p12l`, `p12r`, `p13c`, `p13t`, `p13b`, `p13l`, `p13r`, `p14c`, `p14t`, `p14b`, `p14l`, `p14r`, `p15c`, `p15t`, `p15b`, `p15l`, `p15r`, `p16c`, `p16t`, `p16b`, `p16l`, `p16r`, `p17c`, `p17t`, `p17b`, `p17l`, `p17r`, `p18c`, `p18t`, `p18b`, `p18l`, `p18r`, `p21c`, `p21t`, `p21b`, `p21l`, `p21r`, `p22c`, `p22t`, `p22b`, `p22l`, `p22r`, `p23c`, `p23t`, `p23b`, `p23l`, `p23r`, `p24c`, `p24t`, `p24b`, `p24l`, `p24r`, `p25c`, `p25t`, `p25b`, `p25l`, `p25r`, `p26c`, `p26t`, `p26b`, `p26l`, `p26r`, `p27c`, `p27t`, `p27b`, `p27l`, `p27r`, `p28c`, `p28t`, `p28b`, `p28l`, `p28r`, `p51c`, `p51t`, `p51b`, `p51l`, `p51r`, `p52c`, `p52t`, `p52b`, `p52l`, `p52r`, `p53c`, `p53t`, `p53b`, `p53l`, `p53r`, `p54c`, `p54t`, `p54b`, `p54l`, `p54r`, `p55c`, `p55t`, `p55b`, `p55l`, `p55r`, `p61c`, `p61t`, `p61b`, `p61l`, `p61r`, `p62c`, `p62t`, `p62b`, `p62l`, `p62r`, `p63c`, `p63t`, `p63b`, `p63l`, `p63r`, `p64c`, `p64t`, `p64b`, `p64l`, `p64r`, `p65c`, `p65t`, `p65b`, `p65l`, `p65r`, `p81c`, `p81t`, `p81b`, `p81l`, `p81r`, `p82c`, `p82t`, `p82b`, `p82l`, `p82r`, `p83c`, `p83t`, `p83b`, `p83l`, `p83r`, `p84c`, `p84t`, `p84b`, `p84l`, `p84r`, `p85c`, `p85t`, `p85b`, `p85l`, `p85r`, `p71c`, `p71t`, `p71b`, `p71l`, `p71r`, `p72c`, `p72t`, `p72b`, `p72l`, `p72r`, `p73c`, `p73t`, `p73b`, `p73l`, `p73r`, `p74c`, `p74t`, `p74b`, `p74l`, `p74r`, `p75c`, `p75t`, `p75b`, `p75l`, `p75r`, `p41c`, `p41t`, `p41b`, `p41l`, `p41r`, `p42c`, `p42t`, `p42b`, `p42l`, `p42r`, `p43c`, `p43t`, `p43b`, `p43l`, `p43r`, `p44c`, `p44t`, `p44b`, `p44l`, `p44r`, `p45c`, `p45t`, `p45b`, `p45l`, `p45r`, `p46c`, `p46t`, `p46b`, `p46l`, `p46r`, `p47c`, `p47t`, `p47b`, `p47l`, `p47r`, `p48c`, `p48t`, `p48b`, `p48l`, `p48r`, `p31c`, `p31t`, `p31b`, `p31l`, `p31r`, `p32c`, `p32t`, `p32b`, `p32l`, `p32r`, `p33c`, `p33t`, `p33b`, `p33l`, `p33r`, `p34c`, `p34t`, `p34b`, `p34l`, `p34r`, `p35c`, `p35t`, `p35b`, `p35l`, `p35r`, `p36c`, `p36t`, `p36b`, `p36l`, `p36r`, `p37c`, `p37t`, `p37b`, `p37l`, `p37r`, `p38c`, `p38t`, `p38b`, `p38l`, `p38r`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'red', 'Ivory', 'Ivory', 'Ivory', 'red', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-07-26 19:01:09', '2021-07-26 22:21:12'),
(2, 2, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-10 08:26:18', '2021-08-10 08:26:18'),
(3, 3, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-10 08:30:14', '2021-08-10 08:30:14'),
(4, 4, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-12 07:33:12', '2021-08-12 07:33:12'),
(5, 6, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-13 06:02:28', '2021-08-13 06:02:28'),
(6, 8, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-13 19:23:00', '2021-08-13 19:23:00'),
(7, 9, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-13 19:28:14', '2021-08-13 19:28:14'),
(8, 10, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-13 19:29:11', '2021-08-13 19:29:11'),
(9, 11, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-13 19:31:20', '2021-08-13 19:31:20'),
(10, 12, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-18 05:30:50', '2021-08-18 05:30:50'),
(11, 13, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-19 15:17:24', '2021-08-19 15:17:24'),
(12, 14, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-19 15:19:13', '2021-08-19 15:19:13'),
(13, 15, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-19 15:25:46', '2021-08-19 15:25:46'),
(14, 16, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-20 04:01:27', '2021-08-20 04:01:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_metode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `potongan` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `key`, `guard_name`, `created_at`, `updated_at`) VALUES
(6, 'permission-access', 'Permission Access', 'web', '2021-07-16 20:00:20', '2021-07-16 20:00:20'),
(7, 'permission-create', 'Permission Create', 'web', '2021-07-16 20:00:24', '2021-07-16 20:00:24'),
(8, 'permission-edit', 'Permission Edit', 'web', '2021-07-16 20:00:28', '2021-07-16 20:00:28'),
(9, 'permission-delete', 'Permission Delete', 'web', '2021-07-16 20:00:35', '2021-07-16 20:00:35'),
(11, 'roles-edit', 'Roles Edit', 'web', '2021-07-16 20:00:45', '2021-07-16 20:00:45'),
(12, 'roles-create', 'Roles Create', 'web', '2021-07-16 20:00:48', '2021-07-16 20:00:48'),
(13, 'roles-delete', 'Roles Delete', 'web', '2021-07-16 20:00:52', '2021-07-16 20:00:52'),
(14, 'user-access', 'User Access', 'web', '2021-07-16 20:02:15', '2021-07-16 20:02:15'),
(15, 'user-create', 'User Create', 'web', '2021-07-16 20:02:20', '2021-07-16 20:02:20'),
(16, 'user-edit', 'User Edit', 'web', '2021-07-16 20:02:23', '2021-07-16 20:02:23'),
(17, 'user-delete', 'User Delete', 'web', '2021-07-16 20:02:27', '2021-07-16 20:02:27'),
(18, 'roles-access', 'Roles Access', 'web', '2021-07-16 20:02:45', '2021-07-16 20:02:45'),
(19, 'cabang-access', 'Cabang Access', 'web', '2021-07-16 20:04:13', '2021-07-16 20:04:13'),
(20, 'cabang-create', 'Cabang Create', 'web', '2021-07-16 20:04:17', '2021-07-16 20:04:17'),
(21, 'cabang-edit', 'Cabang Edit', 'web', '2021-07-16 20:04:21', '2021-07-16 20:04:21'),
(22, 'cabang-delete', 'Cabang Delete', 'web', '2021-07-16 20:04:25', '2021-07-16 20:04:25'),
(23, 'product-access', 'Product Access', 'web', '2021-07-16 20:04:32', '2021-07-16 20:04:32'),
(24, 'product-create', 'Product Create', 'web', '2021-07-16 20:04:37', '2021-07-16 20:04:37'),
(25, 'product-edit', 'Product Edit', 'web', '2021-07-16 20:04:41', '2021-07-16 20:04:41'),
(26, 'product-delete', 'Product Delete', 'web', '2021-07-16 20:04:45', '2021-07-16 20:04:45'),
(27, 'service-access', 'Service Access', 'web', '2021-07-16 20:04:48', '2021-07-16 20:04:48'),
(28, 'service-create', 'Service Create', 'web', '2021-07-16 20:04:50', '2021-07-16 20:04:50'),
(29, 'service-delete', 'Service Delete', 'web', '2021-07-16 20:04:54', '2021-07-16 20:04:54'),
(30, 'service-edit', 'Service Edit', 'web', '2021-07-16 20:04:57', '2021-07-16 20:04:57'),
(31, 'patient-access', 'Patient Access', 'web', '2021-07-16 20:19:07', '2021-07-16 20:19:07'),
(32, 'patient-create', 'Patient Create', 'web', '2021-07-16 20:19:10', '2021-07-16 20:19:10'),
(33, 'patient-edit', 'Patient Edit', 'web', '2021-07-16 20:19:14', '2021-07-16 20:19:14'),
(34, 'patient-delete', 'Patient Delete', 'web', '2021-07-16 20:19:17', '2021-07-16 20:19:17'),
(35, 'payment-access', 'Payment Access', 'web', '2021-07-28 07:27:35', '2021-07-28 07:27:35'),
(36, 'payment-create', 'Payment Create', 'web', '2021-07-28 07:27:43', '2021-07-28 07:27:43'),
(37, 'payment-edit', 'Payment Edit', 'web', '2021-07-28 07:27:49', '2021-07-28 07:27:49'),
(38, 'payment-delete', 'Payment Delete', 'web', '2021-07-28 07:27:55', '2021-07-28 07:27:55'),
(39, 'status-access', 'Status Access', 'web', '2021-07-28 07:38:58', '2021-07-28 07:38:58'),
(40, 'status-create', 'Status Create', 'web', '2021-07-28 07:39:05', '2021-07-28 07:39:05'),
(41, 'status-edit', 'Status Edit', 'web', '2021-07-28 07:39:09', '2021-07-28 07:39:09'),
(42, 'status-delete', 'Status Delete', 'web', '2021-07-28 07:39:14', '2021-07-28 07:39:14'),
(43, 'voucher-access', 'Voucher Access', 'web', '2021-07-28 07:46:11', '2021-07-28 07:46:11'),
(44, 'voucher-create', 'Voucher Create', 'web', '2021-07-28 07:46:16', '2021-07-28 07:46:16'),
(45, 'voucher-edit', 'Voucher Edit', 'web', '2021-07-28 07:46:20', '2021-07-28 07:46:20'),
(46, 'voucher-delete', 'Voucher Delete', 'web', '2021-07-28 07:46:29', '2021-07-28 07:46:29'),
(47, 'komisi-access', 'Komisi Access', 'web', '2021-07-28 07:58:59', '2021-07-28 07:58:59'),
(48, 'komisi-create', 'Komisi Create', 'web', '2021-07-28 07:59:05', '2021-07-28 07:59:05'),
(49, 'komisi-edit', 'Komisi Edit', 'web', '2021-07-28 07:59:10', '2021-07-28 07:59:10'),
(50, 'komisi-delete', 'Komisi Delete', 'web', '2021-07-28 07:59:16', '2021-07-28 07:59:16'),
(51, 'simbol-access', 'Simbol Access', 'web', '2021-07-28 08:27:23', '2021-07-28 08:27:23'),
(52, 'simbol-create', 'Simbol Create', 'web', '2021-07-28 08:27:31', '2021-07-28 08:27:31'),
(53, 'simbol-edit', 'Simbol Edit', 'web', '2021-07-28 08:27:39', '2021-07-28 08:27:39'),
(54, 'simbol-delete', 'Simbol Delete', 'web', '2021-07-28 08:27:46', '2021-07-28 08:27:46'),
(55, 'marketing-access', 'Marketing Access', 'web', '2021-08-10 08:24:55', '2021-08-20 02:38:43'),
(56, 'dokter-access', 'Dokter Access', 'web', '2021-08-20 02:38:58', '2021-08-20 02:39:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `no_gigi` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kondisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tindakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `key`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super Admin', 'web', '2021-07-16 19:56:23', '2021-07-16 19:56:23'),
(2, 'dokter', 'Dokter', 'web', '2021-07-21 18:26:17', '2021-07-21 18:26:17'),
(3, 'marketing', 'Marketing', 'web', '2021-08-10 08:25:15', '2021-08-10 08:25:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 3),
(56, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangans`
--

CREATE TABLE `ruangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cabang_id` bigint(20) UNSIGNED NOT NULL,
  `nama_ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruangans`
--

INSERT INTO `ruangans` (`id`, `cabang_id`, `nama_ruangan`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 1, 'Ruang 1', 1, '2021-07-21 18:03:49', '2021-07-21 18:03:49'),
(3, 1, 'Ruang 2', 1, '2021-07-21 18:03:54', '2021-07-21 18:03:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `shifts`
--

INSERT INTO `shifts` (`id`, `kode`, `waktu_mulai`, `waktu_selesai`, `created_at`, `updated_at`) VALUES
(1, 'SF1', '09:00:00', '15:00:00', NULL, NULL),
(2, 'SF2', '15:00:00', '21:00:00', NULL, NULL),
(3, 'L', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbol_odontograms`
--

CREATE TABLE `simbol_odontograms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_simbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pasiens`
--

CREATE TABLE `status_pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `status_pasiens`
--

INSERT INTO `status_pasiens` (`id`, `status`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Datang & Waiting', 1, '2021-07-28 07:42:49', '2021-07-28 07:42:49'),
(2, 'Masuk Ruangan', 1, '2021-07-28 07:42:53', '2021-07-28 07:42:53'),
(3, 'Selesai', 1, '2021-07-28 07:42:58', '2021-07-28 07:42:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakans`
--

CREATE TABLE `tindakans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `tindakan_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `durasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dokter_id` int(10) UNSIGNED NOT NULL,
  `nominal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tindakans`
--

INSERT INTO `tindakans` (`id`, `booking_id`, `tindakan_id`, `qty`, `durasi`, `dokter_id`, `nominal`, `created_at`, `updated_at`) VALUES
(24, 22, 3, 2, '40', 2, 3000000, '2021-08-19 15:20:23', '2021-08-19 15:20:23'),
(25, 22, 4, 2, '50', 2, 900000, '2021-08-19 15:20:23', '2021-08-19 15:20:23'),
(26, 23, 1, 1, '0', 2, 2000000, '2021-08-19 15:21:19', '2021-08-19 15:21:19'),
(27, 23, 2, 1, '0', 2, 300000, '2021-08-19 15:21:19', '2021-08-19 15:21:19'),
(28, 23, 3, 2, '40', 2, 3000000, '2021-08-19 15:21:19', '2021-08-19 15:21:19'),
(29, 23, 4, 3, '75', 2, 1350000, '2021-08-19 15:21:19', '2021-08-19 15:21:19'),
(30, 25, 2, 1, '0', 3, 300000, '2021-08-19 15:55:25', '2021-08-19 15:55:25'),
(31, 25, 4, 2, '50', 3, 900000, '2021-08-19 15:55:25', '2021-08-19 15:55:25'),
(32, 36, 4, 1, '25', 2, 450000, '2021-08-19 16:53:04', '2021-08-19 16:53:04'),
(33, 36, 3, 1, '20', 2, 1500000, '2021-08-19 16:53:04', '2021-08-19 16:53:04'),
(34, 38, 4, 1, '25', 3, 450000, '2021-08-19 16:54:39', '2021-08-19 16:54:39'),
(35, 38, 3, 2, '40', 3, 3000000, '2021-08-19 16:54:39', '2021-08-19 16:54:39'),
(36, 39, 3, 2, '40', 3, 3000000, '2021-08-20 03:47:37', '2021-08-20 03:47:37'),
(37, 39, 3, 1, '20', 3, 1500000, '2021-08-20 03:47:37', '2021-08-20 03:47:37'),
(38, 41, 3, 1, '20', 2, 1500000, '2021-08-20 04:29:33', '2021-08-20 04:29:33'),
(39, 41, 4, 2, '50', 2, 900000, '2021-08-20 04:29:33', '2021-08-20 04:29:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `cabang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mac_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` enum('pending','verified') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone_number`, `is_active`, `cabang_id`, `mac_address`, `is_verified`, `updated_by`, `address`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'admin@localhost.com', NULL, '$2y$10$s65sOQTaF9JIn86zFud9nOb1OU1KAAXzgHjDPtuKSj3ntEPWadFP6', NULL, '82114823280', 1, 1, NULL, 'pending', NULL, 'Tasikmalaya', 'images/users/Yf45aMOvOIfh8bw.jpg', NULL, '2021-07-16 19:36:06', '2021-07-16 19:59:26'),
(2, 'Dr. Iqbal', 'iqbal@gmail.com', NULL, '$2y$10$tkIyw5YtpP2d/QchvO.I0OSvLr3Nd4sPSJ9qgGq8VsAznhiQKOB7e', NULL, '82114823280', 1, 1, NULL, 'pending', NULL, 'Tasikmalaya', 'images/users/2EvkSR5cUQdlBP8.jpg', NULL, '2021-07-21 18:27:00', '2021-07-21 18:27:00'),
(3, 'Leni Hardiyanti', 'leni@gmail.com', NULL, '$2y$10$6XGQsdfoIZeTRui7CoXTRe.HUu3IUJZiqh1pSiGCkffqzgWxRwIVW', NULL, '081236891733', 1, 1, NULL, 'pending', NULL, 'Tasikmalaya', 'images/users/325CStEvH3IHuO9.jpg', NULL, '2021-07-28 07:03:44', '2021-07-28 07:03:44'),
(4, 'Marketing Dewi', 'marketingdewi@test.com', NULL, '$2y$10$25Lt2tMOGu/zW.Vdltn9E.hX33/2IwmWK8jcpv40swds1WHPGEiO6', NULL, '083815010813', 1, 1, NULL, 'pending', NULL, 'Cikereteg', 'images/users/q05t1nQhRbi9eD5.jpg', NULL, '2021-08-10 08:29:09', '2021-08-10 08:29:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_voucher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `min_transaksi` bigint(20) DEFAULT NULL,
  `nominal` bigint(20) NOT NULL,
  `type` enum('Per','Min') COLLATE utf8mb4_unicode_ci NOT NULL,
  `persentase` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik_ktp` (`nik_ktp`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gigipasien`
--
ALTER TABLE `gigipasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpasien` (`customer_id`);

--
-- Indeks untuk tabel `harga_produk_cabangs`
--
ALTER TABLE `harga_produk_cabangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komisis`
--
ALTER TABLE `komisis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `odontogram_pasien`
--
ALTER TABLE `odontogram_pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `ruangans`
--
ALTER TABLE `ruangans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `simbol_odontograms`
--
ALTER TABLE `simbol_odontograms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status_pasiens`
--
ALTER TABLE `status_pasiens`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tindakans`
--
ALTER TABLE `tindakans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gigipasien`
--
ALTER TABLE `gigipasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `harga_produk_cabangs`
--
ALTER TABLE `harga_produk_cabangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `komisis`
--
ALTER TABLE `komisis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `odontogram_pasien`
--
ALTER TABLE `odontogram_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `simbol_odontograms`
--
ALTER TABLE `simbol_odontograms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `status_pasiens`
--
ALTER TABLE `status_pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tindakans`
--
ALTER TABLE `tindakans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
