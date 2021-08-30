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
-- Database: `dental-clinic`
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
(1, '343443', 'Pemutih Gigi', 'barang', NULL, 1, '2021-07-16 20:15:37', '2021-07-16 20:15:37'),
(2, '232332', 'Obat Kumur', 'barang', NULL, 1, '2021-07-16 20:15:45', '2021-07-16 20:15:45'),
(3, '556565', 'Bleaching', 'service', 20, 1, '2021-07-16 20:16:03', '2021-07-16 20:16:56'),
(4, '343445', 'Scalling', 'service', 20, 1, '2021-07-16 20:16:14', '2021-07-16 20:17:00');

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
  `jam_status` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `is_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `no_booking`, `marketing_id`, `dokter_id`, `resepsionis_id`, `ob_id`, `perawat_id`, `cabang_id`, `customer_id`, `tindakan_id`, `jadwal_id`, `status_pembayaran`, `tanggal_status`, `status_kedatangan_id`, `jam_status`, `jam_selesai`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tebet1_20210819_54720883', 4, 3, 2, 6, 5, 1, 1, 1, 1, 1, '2021-08-20', 1, '09:00:00', '10:30:00', '1', '2021-08-27 08:20:23', '2021-08-24 06:23:48'),
(2, 'Tebet1_20210819_932361523', 4, 2, 2, 6, 5, 1, 2, 1, 2, 1, '2021-08-20', 4, '10:30:00', '12:25:00', '1', '2021-08-27 08:21:19', '2021-08-27 07:38:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabangs`
--

CREATE TABLE `cabangs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_cabang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telpon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ppn` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `status_pajak` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cabangs`
--

INSERT INTO `cabangs` (`id`, `kode_cabang`, `nama`, `alamat`, `telpon`, `email`, `wa`, `ppn`, `is_active`, `status_pajak`, `created_at`, `updated_at`) VALUES
(1, 'C001', 'Tebet', 'Jl Tebet', '08977356372533', 'tebet@gmail.com', '08977356372533', 10, 1, 1, '2021-07-16 19:58:17', '2021-08-19 07:14:41'),
(2, 'C002', 'Kemang', 'Jl Kemang', '0892367236723', 'kemang@gmail.com', '0892367236723', 5, 1, 1, '2021-08-04 21:01:24', '2021-08-19 07:14:32');

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
  `nik_ktp` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 1, 1, 'Muhamad iqbal', '0892367482344', '123445674745', '1239023475', 'iqbal@gmail.com', 'Tasikmalaya, 20-11-2002', 'Laki-Laki', 'Sunda', 'Cikeler', 'Student', 'images/patients/QloFAJcS7JNrFWk.png', 1, '2021-08-11 19:01:09', '2021-07-26 19:01:09'),
(2, 1, 2, 'Rahma Yantini', '089234726343', '10180273826323', '456473547645', 'rahma@gmail.com', 'Bandung, 05-08-2004', 'Perempuan', 'Sunda', 'Bandung', 'Pelajar', 'images/patients/ptyiKGYSyTwkFFB.png', 1, '2021-08-04 20:51:45', '2021-08-04 20:51:45');

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
-- Struktur dari tabel `fisiks`
--

CREATE TABLE `fisiks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `gol_darah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tekanan_darah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pny_jantung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `diabetes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `haemopilia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `hepatitis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `gastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `pny_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `alergi_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `alergi_makanan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tidak Ada',
  `ket_lainnya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_tekanan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_obat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_makanan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fisiks`
--

INSERT INTO `fisiks` (`id`, `customer_id`, `gol_darah`, `tekanan_darah`, `pny_jantung`, `diabetes`, `haemopilia`, `hepatitis`, `gastring`, `pny_lainnya`, `alergi_obat`, `alergi_makanan`, `ket_lainnya`, `ket_tekanan`, `ket_obat`, `ket_makanan`, `created_at`, `updated_at`) VALUES
(1, 1, 'A', '120/70', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', 'Tidak Ada', '-', 'Normal', '-', '-', NULL, '2021-08-01 22:00:55');

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
(1, 1, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'UE', 'UE', 'UE', 'UE', 'UE', 'sou', 'sou', 'sou', 'sou', 'sou', 'rx', 'rx', 'rx', 'rx', 'rx', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'non', 'non', 'non', 'non', 'non', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'cof', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-20 04:24:24', '2021-08-20 11:24:24'),
(2, 2, 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', 'sou', '2021-08-04 20:51:45', '2021-08-05 03:51:45');

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
(3, 4, 1, 1500000, '2021-08-13 06:16:04', '2021-08-13 06:16:04'),
(4, 4, 2, 2000000, '2021-08-14 03:41:02', '2021-08-14 03:41:02');

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
(1, 2, 1, 1, 2, '2021-08-01', '2021-08-17 20:48:35', '2021-08-17 20:50:00'),
(2, 2, 1, 1, 2, '2021-08-02', '2021-08-17 20:48:35', '2021-08-17 20:50:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ket_odontograms`
--

CREATE TABLE `ket_odontograms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `occlusi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_palatinus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_mandibularis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `palatum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diastema` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anomali` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_occlusi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_tp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_tm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_palatum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_diastema` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_anomali` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ket_odontograms`
--

INSERT INTO `ket_odontograms` (`id`, `customer_id`, `occlusi`, `t_palatinus`, `t_mandibularis`, `palatum`, `diastema`, `anomali`, `lain`, `d`, `m`, `f`, `ket_occlusi`, `ket_tp`, `ket_tm`, `ket_palatum`, `ket_diastema`, `ket_anomali`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-01 20:59:59'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-04 20:51:45', '2021-08-04 20:51:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komisis`
--

CREATE TABLE `komisis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `persentase` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_transaksi` bigint(20) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `komisis`
--

INSERT INTO `komisis` (`id`, `role_id`, `persentase`, `min_transaksi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '0', 0, 1, '2021-07-21 05:53:55', '2021-08-13 15:49:13'),
(2, 2, '20', 0, 1, '2021-08-05 23:02:18', '2021-08-05 23:02:18'),
(3, 3, '1', 900000, 1, '2021-08-05 23:02:36', '2021-08-13 15:49:46'),
(4, 4, '1', 900000, 1, '2021-08-14 01:54:32', '2021-08-14 01:54:32'),
(5, 5, '0.25', 900000, 1, '2021-08-14 01:56:30', '2021-08-14 01:56:30'),
(6, 6, '1', 900000, 1, '2021-08-14 01:56:43', '2021-08-14 01:56:43');

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
(16, '2021_07_26_033809_create_simbol_odontograms_table', 6),
(17, '2021_07_27_041134_create_rekam_medis_table', 7),
(19, '2021_07_29_012337_create_ket_odontograms_table', 8),
(21, '2021_08_02_031724_create_fisiks_table', 9),
(22, '2021_08_05_030713_create_bookings_table', 10),
(23, '2021_08_05_031124_create_tindakans_table', 10),
(24, '2021_08_05_031423_create_rincian_pembayarans_table', 10);

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
(2, 'App\\User', 3),
(3, 'App\\User', 2),
(4, 'App\\User', 4),
(5, 'App\\User', 6),
(6, 'App\\User', 5),
(7, 'App\\User', 8);

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
(1, 1, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'AliceBlue', 'AliceBlue', 'AliceBlue', 'AliceBlue', 'AliceBlue', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Yellow', 'Yellow', 'Yellow', 'Yellow', 'Yellow', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Indigo', 'Indigo', 'Indigo', 'Indigo', 'Indigo', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'darkblue', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-07-26 19:01:09', '2021-08-20 04:24:24'),
(2, 2, 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', 'Ivory', '2021-08-04 20:51:45', '2021-08-04 20:51:45');

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
  `rekening` int(20) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `nama_metode`, `potongan`, `rekening`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Debit Visa', '5', 2222232, 1, '2021-08-05 17:48:04', '2021-08-05 17:50:20'),
(2, 'Bank BCA', '3', 2222235, 1, '2021-08-05 17:48:25', '2021-08-05 17:50:26'),
(3, 'Cash', '0', 0, 1, '2021-08-05 17:48:35', '2021-08-05 17:48:35'),
(4, 'Voucher', '0', 0, 1, '2021-08-14 03:37:19', '2021-08-14 03:37:19');

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
(55, 'report-access', 'Report Access', 'web', '2021-08-12 17:01:14', '2021-08-12 17:01:14'),
(56, 'dokter-access', 'Dokter Access', 'web', '2021-08-22 03:01:57', '2021-08-22 03:01:57'),
(57, 'dokter-create', 'Dokter Create', 'web', '2021-08-22 03:02:03', '2021-08-22 03:02:03'),
(58, 'dokter-edit', 'Dokter Edit', 'web', '2021-08-22 03:02:07', '2021-08-22 03:02:07'),
(59, 'dokter-delete', 'Dokter Delete', 'web', '2021-08-22 03:02:14', '2021-08-22 03:02:14'),
(60, 'appointment-access', 'Appointment Access', 'web', '2021-08-25 07:06:14', '2021-08-25 07:06:14'),
(61, 'appointment-create', 'Appointment Create', 'web', '2021-08-25 07:06:23', '2021-08-25 07:06:23'),
(62, 'appointment-edit', 'Appointment Edit', 'web', '2021-08-25 07:06:29', '2021-08-25 07:06:29'),
(63, 'appointment-delete', 'Appointment Delete', 'web', '2021-08-25 07:06:39', '2021-08-25 07:06:39');

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
  `simbol_id` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tindakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekam_medis`
--

INSERT INTO `rekam_medis` (`id`, `customer_id`, `user_id`, `tanggal`, `no_gigi`, `simbol_id`, `keterangan`, `tindakan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2027-07-21', '17R', 1, 'Amalgam', 'Tambal', '2021-07-26 21:53:14', '2021-07-26 21:53:14'),
(2, 1, 1, '2021-07-27', '17C', 2, 'Komposite', 'Cabut', '2021-07-26 22:05:12', '2021-07-26 22:05:12'),
(3, 1, 1, '2021-07-27', '17C', 1, 'Amalgam', 'Tambal', '2021-07-26 22:21:12', '2021-07-26 22:21:12'),
(4, 1, 1, '2021-07-30', '75C', 2, 'Komposite', 'Cabut', '2021-07-30 01:18:24', '2021-07-30 01:18:24'),
(5, 1, 1, '2021-08-18', '15ALL', 7, 'Un-Erupted', 'Un-Erupted', '2021-08-18 15:27:10', '2021-08-18 15:27:10'),
(6, 1, 1, '2021-08-18', '17ALL', 20, 'Radix', 'Radix', '2021-08-18 15:28:49', '2021-08-18 15:28:49'),
(7, 1, 1, '2021-08-20', '82ALL', 6, 'asf', 'asf', '2021-08-20 04:24:24', '2021-08-20 04:24:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rincian_komisi`
--

CREATE TABLE `rincian_komisi` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nominal_komisi` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rincian_komisi`
--

INSERT INTO `rincian_komisi` (`id`, `booking_id`, `user_id`, `nominal_komisi`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '200000', 1, '2021-08-16 07:52:40', '2021-08-16 07:52:40'),
(2, 1, 4, '10000', 1, '2021-08-16 07:52:40', '2021-08-16 07:52:40'),
(3, 1, 6, '2500', 1, '2021-08-16 07:52:40', '2021-08-16 07:52:40'),
(4, 1, 5, '10000', 1, '2021-08-16 07:52:40', '2021-08-16 07:52:40'),
(5, 2, 3, '200000', 1, '2021-08-16 07:53:29', '2021-08-16 07:53:29'),
(6, 2, 3, '220000', 1, '2021-08-16 07:54:19', '2021-08-16 07:54:19'),
(7, 1, 3, '400000', 1, '2021-08-25 06:49:17', '2021-08-25 06:49:17'),
(8, 1, 3, '200000', 1, '2021-08-25 06:56:30', '2021-08-25 06:56:30'),
(9, 1, 3, '240000', 1, '2021-08-25 06:57:50', '2021-08-25 06:57:50'),
(10, 1, 3, '200000', 1, '2021-08-25 07:04:38', '2021-08-25 07:04:38'),
(11, 1, 3, '200000', 1, '2021-08-25 07:31:19', '2021-08-25 07:31:19'),
(12, 1, 3, '240000', 1, '2021-08-25 07:32:27', '2021-08-25 07:32:27'),
(13, 2, 2, '200000', 1, '2021-08-27 08:04:09', '2021-08-27 08:04:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rincian_pembayarans`
--

CREATE TABLE `rincian_pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `kasir_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pembayaran` timestamp NOT NULL DEFAULT current_timestamp(),
  `nominal` bigint(11) NOT NULL,
  `dibayar` int(20) NOT NULL,
  `kembali` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `disc_vouc` int(11) DEFAULT NULL,
  `biaya_kartu` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
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
(3, 'resepsionis', 'Resepsionis', 'web', '2021-08-01 18:38:02', '2021-08-01 18:38:02'),
(4, 'marketing', 'Marketing', 'web', '2021-08-14 01:52:46', '2021-08-14 01:52:46'),
(5, 'office-boy', 'Office Boy', 'web', '2021-08-14 01:54:47', '2021-08-14 01:54:47'),
(6, 'perawat', 'Perawat', 'web', '2021-08-14 01:55:06', '2021-08-14 01:55:06'),
(7, 'supervisor', 'Supervisor', 'web', '2021-08-25 07:07:13', '2021-08-25 07:07:13');

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
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(31, 6),
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
(55, 1),
(56, 1),
(56, 3),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(60, 3),
(60, 7),
(61, 1),
(62, 1),
(63, 1);

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

--
-- Dumping data untuk tabel `simbol_odontograms`
--

INSERT INTO `simbol_odontograms` (`id`, `nama_simbol`, `singkatan`, `warna`, `created_at`, `updated_at`) VALUES
(1, 'Amalgam', 'amf', 'DarkGrey', NULL, NULL),
(2, 'Komposite', 'cof', 'MediumBlue', NULL, NULL),
(3, 'pit dan fissure sealant', 'fis', 'AntiqueWhite', NULL, NULL),
(4, 'Nekrosis Pulpa', 'NP', 'DarkSlateGray', NULL, NULL),
(5, 'Perawatan Saluran Akar', 'rct', 'Aquamarine', NULL, NULL),
(6, 'gigi tidak ada, tidak diketahui ada atau tidak ada.', 'non', 'Indigo', NULL, NULL),
(7, 'Un-Erupted', 'UE', 'AliceBlue', NULL, NULL),
(8, 'Partial Eruption', 'PE', 'Orchid', NULL, NULL),
(9, 'Normal/ baik', 'sou', 'Ivory', NULL, NULL),
(10, 'Anomali ', 'A', 'LimeGreen', NULL, NULL),
(11, 'Karies Media', 'KM', 'Brown', NULL, NULL),
(12, 'Fractur', 'cfr', 'Teal', NULL, NULL),
(13, 'Karies Profunda', 'KP', 'Chocolate', NULL, NULL),
(14, 'Karies Superfisial', 'KS', 'BurlyWood', NULL, NULL),
(15, 'Metal Crown', 'fmc', 'Green', NULL, NULL),
(17, 'Crown Non Metal', 'cnm', 'ForestGreen', NULL, NULL),
(18, 'Normal', 'TAK', 'LightCyan', NULL, NULL),
(19, 'Mobility', 'M', 'Lime', NULL, NULL),
(20, 'Radix', 'rx', 'Yellow', NULL, NULL),
(21, 'Missing teeth', 'mis', 'Coral', NULL, NULL),
(22, 'Implant + Porcelain crown', 'ipx-poc', 'LightGreen', NULL, NULL),
(23, 'Bridge', 'Brg', 'OliveDrab', NULL, NULL),
(24, 'GTSL', 'gtsl', 'Fuchsia', NULL, NULL),
(25, 'plak dan kalkulus', 'calculus', 'Chartreuse', NULL, NULL),
(26, 'GTL', 'GTL', 'HotPink', NULL, NULL),
(27, 'Migrasi/ Version/Rotasi dibuat panahsesuai arah', 'mv', 'GoldenRod', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pasiens`
--

CREATE TABLE `status_pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `status_pasiens`
--

INSERT INTO `status_pasiens` (`id`, `status`, `warna`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Belum Datang', 'red', 1, '2021-07-28 07:42:49', '2021-08-24 00:09:07'),
(2, 'Datang & Waiting', 'orange', 1, '2021-07-28 07:42:53', '2021-08-24 00:09:17'),
(3, 'Masuk Ruangan', 'blue', 1, '2021-07-28 07:42:58', '2021-08-24 00:09:25'),
(4, 'Selesai', 'green', 1, '2021-08-20 04:17:59', '2021-08-24 00:09:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_simbol`
--

CREATE TABLE `tabel_simbol` (
  `id` int(11) NOT NULL,
  `namasimbol` varchar(128) NOT NULL,
  `singkatan` varchar(16) NOT NULL,
  `warna` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tabel_simbol`
--

INSERT INTO `tabel_simbol` (`id`, `namasimbol`, `singkatan`, `warna`) VALUES
(1, 'Amalgam', 'amf', 'DarkGrey'),
(2, 'Komposite', 'cof', 'MediumBlue'),
(3, 'pit dan fissure sealant', 'fis', 'AntiqueWhite'),
(4, 'Nekrosis Pulpa', 'NP', 'DarkSlateGray'),
(5, 'Perawatan Saluran Akar', 'rct', 'Aquamarine'),
(6, 'gigi tidak ada, tidak diketahui ada atau tidak ada.', 'non', 'Indigo'),
(7, 'Un-Erupted', 'UE', 'AliceBlue'),
(8, 'Partial Eruption', 'PE', 'Orchid'),
(9, 'Normal/ baik', 'sou', 'Ivory'),
(10, 'Anomali ', 'A', 'LimeGreen'),
(11, 'Karies Media', 'KM', 'Brown'),
(12, 'Fractur', 'cfr', 'Teal'),
(13, 'Karies Profunda', 'KP', 'Chocolate'),
(14, 'Karies Superfisial', 'KS', 'BurlyWood'),
(15, 'Metal Crown', 'fmc', 'Green'),
(17, 'Crown Non Metal', 'cnm', 'ForestGreen'),
(18, 'Normal', 'TAK', 'LightCyan'),
(19, 'Mobility', 'M', 'Lime'),
(20, 'Radix', 'rx', 'Yellow'),
(21, 'Missing teeth', 'mis', 'Coral'),
(22, 'Implant + Porcelain crown', 'ipx-poc', 'LightGreen'),
(23, 'Bridge', 'Brg', 'OliveDrab'),
(24, 'GTSL', 'gtsl', 'Fuchsia'),
(25, 'plak dan kalkulus', 'calculus', 'Chartreuse'),
(26, 'GTL', 'GTL', 'HotPink'),
(27, 'Migrasi/ Version/Rotasi dibuat panahsesuai arah', 'mv', 'GoldenRod');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tindakans`
--

CREATE TABLE `tindakans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` int(11) NOT NULL,
  `durasi` int(11) NOT NULL,
  `dokter` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tindakans`
--

INSERT INTO `tindakans` (`id`, `booking_id`, `barang_id`, `durasi`, `dokter`, `nominal`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 20, 1, 1500000, 1, 0, '2021-08-03 01:07:46', '2021-08-13 01:07:41'),
(3, 2, 4, 20, 1, 1500000, 1, 0, '2021-08-05 03:50:07', '2021-08-05 03:50:07'),
(4, 1, 4, 20, 1, 1500000, 1, 0, '2021-08-13 06:12:22', '2021-08-13 06:12:22');

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
(1, 'Developer', 'admin@localhost.com', NULL, '$2y$10$f4lKm1p8MrgWWW4t7EG39.bCtVpFM8XFqb2fs.1trFwSkx8lfLoB6', NULL, '82114823280', 1, 1, '70-54-D2-17-22-92', 'pending', NULL, 'Tasikmalaya', 'images/users/Yf45aMOvOIfh8bw.jpg', NULL, '2021-07-16 19:36:06', '2021-07-30 07:40:16'),
(2, 'Muhammad Iqbal', 'iqbal@gmail.com', NULL, '$2y$10$kJ0I./rSCQXuddZvhxYJFuTF3j.H5UnecI9QVYSIfAsMqXf/pPOWi', NULL, '82114823280', 1, 1, '70-54-D2-17-22-92', 'pending', NULL, 'Tasikmalaya', 'images/users/2EvkSR5cUQdlBP8.jpg', NULL, '2021-07-21 18:27:00', '2021-08-12 07:14:11'),
(3, 'Dr. Yanti Jatnika', 'yanti@gmail.com', NULL, '$2y$10$kznzyIRz94mumyfpUNZcquTQ/F.xP7TTBaKMKwvGiHJoQSkXB0phS', NULL, '081236891733', 1, 1, '70-54-D2-17-22-92', 'pending', NULL, 'Tasikmalaya', 'images/users/aiHjBTanegvTtKJ.jpg', NULL, '2021-07-28 07:03:44', '2021-08-24 06:21:19'),
(4, 'Marketing', 'mrk.tebet@gmail.com', NULL, '$2y$10$nUaCrXsSMNi7PqCXoe8JG.6s9O4AyXpOG33aZinVIUZF.xHHImJYi', NULL, '82114823280', 1, 1, NULL, 'pending', NULL, 'Jakarta', 'images/users/BjwaM9LxgwSDoa9.jpg', NULL, '2021-08-14 01:57:36', '2021-08-14 01:57:36'),
(5, 'Noneng', 'prwt.tebet@gmail.com', NULL, '$2y$10$g4KUgBYYideSRTEh9Nr/h.1Pj79YSTfIX.5mApN/U97Po7A6eiE.e', NULL, '82114823890', 1, 1, NULL, 'pending', NULL, 'Bali', 'images/users/FiSC4dmXyOvoxEd.png', NULL, '2021-08-14 01:58:25', '2021-08-14 01:58:25'),
(6, 'Joko', 'ob.tebet@gmail.com', NULL, '$2y$10$qoJ5SjBrvZqlZnEzLCiDbezxT9D0DC1EswXbZ0iQtQXLwMCcHKJbK', NULL, '6134618936291648', 1, 1, NULL, 'pending', NULL, 'Bandung', 'images/users/NZ4VhKz7p5jDOgw.jpg', NULL, '2021-08-14 01:59:03', '2021-08-14 01:59:03'),
(8, 'Ridwanul Hakim', 'ridwan@gmail.com', NULL, '$2y$10$n0vq2jzfvMAeszIyDz9jGeOT2vdGl02STbCeWyXVYUxbBidUXyqLW', NULL, '0883475683645', 1, 1, '70-54-D2-17-22-92', 'pending', NULL, 'Bandung', 'images/users/7Sd80pACO4J2Cre.jpg', NULL, '2021-08-25 07:08:23', '2021-08-25 07:08:40');

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
-- Dumping data untuk tabel `vouchers`
--

INSERT INTO `vouchers` (`id`, `kode_voucher`, `tgl_mulai`, `tgl_akhir`, `min_transaksi`, `nominal`, `type`, `persentase`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'XXXX123', '2021-08-01', '2021-08-31', 1000000, 200000, 'Min', 0, 1, '2021-08-10 18:58:38', '2021-08-27 08:04:09'),
(2, 'XXXX234', '2021-08-01', '2021-08-28', 1000000, 0, 'Per', 10, 1, '2021-08-16 06:56:48', '2021-08-25 07:31:19'),
(3, 'XXXX345', '2021-08-01', '2021-08-25', 0, 100000, 'Per', 0, 1, '2021-08-16 07:00:25', '2021-08-16 07:54:19');

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
-- Indeks untuk tabel `fisiks`
--
ALTER TABLE `fisiks`
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
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ket_odontograms`
--
ALTER TABLE `ket_odontograms`
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
-- Indeks untuk tabel `rincian_komisi`
--
ALTER TABLE `rincian_komisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rincian_pembayarans`
--
ALTER TABLE `rincian_pembayarans`
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
-- Indeks untuk tabel `tabel_simbol`
--
ALTER TABLE `tabel_simbol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warna` (`warna`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fisiks`
--
ALTER TABLE `fisiks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gigipasien`
--
ALTER TABLE `gigipasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `harga_produk_cabangs`
--
ALTER TABLE `harga_produk_cabangs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `ket_odontograms`
--
ALTER TABLE `ket_odontograms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `komisis`
--
ALTER TABLE `komisis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `odontogram_pasien`
--
ALTER TABLE `odontogram_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rincian_komisi`
--
ALTER TABLE `rincian_komisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `rincian_pembayarans`
--
ALTER TABLE `rincian_pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `simbol_odontograms`
--
ALTER TABLE `simbol_odontograms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `status_pasiens`
--
ALTER TABLE `status_pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tabel_simbol`
--
ALTER TABLE `tabel_simbol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tindakans`
--
ALTER TABLE `tindakans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
