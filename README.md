# 📖 Ruang Baca DSB (Sistem Informasi Manajemen Pembacaan & Perpustakaan)

Ruang Baca DSB adalah sistem informasi manajemen perpustakaan modern berbasis web yang dirancang khusus untuk mengelola data buku, anggota, transaksi sirkulasi peminjaman/pengembalian buku, hingga pembuatan laporan secara terstruktur dan aman.

Aplikasi ini telah diperbarui dengan desain antarmuka modern bernuansa *dark-navy*, sistem keamanan ketat terhadap serangan bypass URL (*BOLA Security*), integrasi notifikasi interaktif **SweetAlert2**, serta fitur impor otomatis data buku langsung dari dokumen **Microsoft Excel (.xlsx)**.

---

## 🚀 Fitur Utama
1. **Dasbor Statistik Interaktif**: Visualisasi data ringkas berupa grafik/widget untuk total buku, anggota, peminjaman aktif, dan pengembalian.
2. **Manajemen Otorisasi Pengguna**: Pembagian hak akses yang ketat antara **Administrator** (kelola pengguna, parameter master, sirkulasi, laporan) dan **Petugas** (sirkulasi peminjaman/pengembalian operasional harian).
3. **Sirkulasi Peminjaman & Pengembalian**: Logika pencatatan tanggal pinjam, batas kembali, denda keterlambatan otomatis, serta perpanjangan masa pinjam.
4. **Smart Excel Importer**: Fitur impor otomatis ratusan data buku sekaligus langsung dari file Excel (`.xlsx`) lengkap dengan pemetaan kategori dan rak secara cerdas berdasarkan nomor klasifikasi buku.
5. **Ekspor Laporan Multifungsi**: Dukungan cetak laporan langsung ke kertas, ekspor ke file **Microsoft Excel**, serta berkas **CSV**.
6. **Proteksi Bypass URL & Enkripsi Sandi**: Mencegah akses tidak sah melalui pengetikan URL manual oleh pengguna tingkat rendah dan pengamanan enkripsi password.

---

## 💻 Spesifikasi & Software yang Dibutuhkan

Sebelum menjalankan aplikasi ini, pastikan komputer Anda telah terpasang perangkat lunak berikut:

### 1. Perangkat Lunak Web Server (Pilih salah satu)
* **Laragon (Sangat Direkomendasikan)**: [Download Laragon](https://laragon.org/download/)
* **XAMPP**: Versi 7.4 ke atas. [Download XAMPP](https://www.apachefriends.org/download.html)

### 2. Spesifikasi Lingkungan Server
* **PHP**: Versi **7.4** hingga **8.1** (Aplikasi diuji dan berjalan optimal pada PHP 8.1.10).
* **Database**: MySQL versi 5.7 / 8.0 ke atas, atau MariaDB versi 10.4 ke atas.
* **Ekstensi PHP Wajib Aktif**:
  * `mysqli` (Koneksi database)
  * `zip` (Wajib aktif untuk pembacaan dokumen Excel `.xlsx` saat impor data)
  * `xml` & `simplexml` (Wajib aktif untuk parsing data dokumen XML di dalam berkas Excel)

### 3. Web Browser Modern
* Google Chrome, Microsoft Edge, Mozilla Firefox, atau Safari versi terbaru.

---

## 🛠️ Langkah Instalasi & Konfigurasi

Ikuti langkah-langkah di bawah ini untuk memasang proyek di komputer lokal Anda:

### Langkah 1: Penempatan Berkas Proyek
* **Pengguna Laragon**: Ekstrak folder proyek ke direktori `C:\laragon\www\perpustakaan-main`
* **Pengguna XAMPP**: Ekstrak folder proyek ke direktori `C:\xampp\htdocs\perpustakaan-main`

### Langkah 2: Persiapan Database
1. Buka database manager pilihan Anda (misalnya **phpMyAdmin** di alamat `http://localhost/phpmyadmin`, **HeidiSQL**, atau **DBeaver**).
2. Nyalakan layanan Apache dan MySQL pada panel control server Anda.
3. Lakukan **Import** berkas SQL bernama **`data_perpus.sql`** yang terletak di folder utama proyek Anda. Database `data_perpus` akan otomatis terbuat dan terisi.

### Langkah 3: Konfigurasi Koneksi Database
Jika Anda menggunakan akun database non-default, silakan sesuaikan konfigurasi koneksi database pada berkas [inc/koneksi.php](file:///c:/laragon/www/perpustakaan-main/inc/koneksi.php):
```php
<?php
$koneksi = new mysqli("localhost", "username_anda", "password_anda", "data_perpus");
```
*(Secara default, konfigurasi diatur menggunakan `localhost`, user `root`, dan tanpa password).*

### Langkah 4: Menjalankan Aplikasi
* **Menggunakan Laragon**: Klik tombol **Start All** pada panel Laragon. Aplikasi dapat diakses secara instan di browser melalui alamat:
  `http://perpustakaan-main.test`
* **Menggunakan XAMPP**: Klik tombol **Start** pada modul Apache dan MySQL di XAMPP Control Panel. Akses di browser melalui alamat:
  `http://localhost/perpustakaan-main`

---

## 🔐 Informasi Akun Akses Default

Gunakan kredensial berikut untuk masuk ke dalam sistem:

### 1. Tingkat Akses: Administrator (Akses Penuh)
* **Username**: `admin`
* **Password**: `123`

### 2. Tingkat Akses: Petugas (Akses Operasional)
* **Username**: `admin`
* **Password**: `1234`

*(Anda dapat menambahkan, mengubah, atau menghapus pengguna lain secara aman melalui menu Pengaturan Pengguna ketika masuk sebagai Administrator).*

---

## 📂 Struktur Berkas Utama Proyek
* `index.php` - Gerbang utama perutean (*routing*), validasi session login, dan proteksi kontrol akses URL.
* `login.php` - Halaman masuk aplikasi dengan enkripsi password satu arah MD5.
* `logout.php` - Penghentian session pengguna secara aman.
* `data_perpus.sql` - Skema tabel database dan data awal (seeding).
* `assets/css/custom-admin.css` - Lembar gaya CSS kustom untuk antarmuka modern premium (*overrides layout*).
* `inc/koneksi.php` - Modul jembatan koneksi database MySQLi.
* `admin/` - Kumpulan sub-folder modul administrasi (anggota, buku, pengguna, laporan, sirkulasi, log).
* `home/` - Dasbor statistik untuk Administrator (`admin.php`) dan Petugas (`petugas.php`).
