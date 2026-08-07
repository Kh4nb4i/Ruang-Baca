<?php
header("X-Frame-Options: DENY");
header("X-Content-Type-Options: nosniff");
header("X-XSS-Protection: 1; mode=block");

session_start();
include "inc/koneksi.php";

$koneksi->query("CREATE TABLE IF NOT EXISTS `tb_pengunjung` (
  `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `tgl_kunjungan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pengunjung`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;");

$check_col = $koneksi->query("SHOW COLUMNS FROM `tb_pengunjung` LIKE 'status_konfirmasi'");
if ($check_col->num_rows == 0) {
    $koneksi->query("ALTER TABLE `tb_pengunjung` ADD COLUMN `status_konfirmasi` varchar(50) NOT NULL DEFAULT 'Belum Dikonfirmasi'");
}

if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$success = false;
$error = false;
$error_msg = "";

if (isset($_POST['Simpan'])) {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        $error = true;
        $error_msg = "Sesi keamanan tidak valid.";
    } elseif (isset($_SESSION['last_submit']) && (time() - $_SESSION['last_submit']) < 10) {
        $error = true;
        $error_msg = "Harap tunggu 10 detik sebelum mengisi kembali.";
    } else {
        $nama = htmlspecialchars(strip_tags(trim($_POST['nama'])));
        $nim = htmlspecialchars(strip_tags(trim($_POST['nim'])));
        $angkatan = htmlspecialchars(strip_tags(trim($_POST['angkatan'])));
        $keperluan_opt = htmlspecialchars(strip_tags(trim($_POST['keperluan'])));
        
        $judul_laporan = "";
        if ($keperluan_opt === 'Lainnya') {
            $keperluan = htmlspecialchars(strip_tags(trim($_POST['keperluan_lain'])));
        } elseif ($keperluan_opt === 'Pengumpulan Laporan Project Akhir (PA)') {
            $judul_laporan = htmlspecialchars(strip_tags(trim($_POST['judul_laporan'])));
            $keperluan = "Pengumpulan Laporan Project Akhir (PA): " . $judul_laporan;
        } elseif ($keperluan_opt === 'Pengumpulan Laporan Magang') {
            $judul_laporan = htmlspecialchars(strip_tags(trim($_POST['judul_laporan'])));
            $keperluan = "Pengumpulan Laporan Magang: " . $judul_laporan;
        } else {
            $keperluan = $keperluan_opt;
        }

        if (empty($nama) || empty($nim) || empty($angkatan) || empty($keperluan)) {
            $error = true;
            $error_msg = "Semua kolom wajib diisi!";
        } elseif (!ctype_digit($nim) || strlen($nim) < 5 || strlen($nim) > 20) {
            $error = true;
            $error_msg = "NRP/No. Identitas harus berupa angka 5-20 digit.";
        } elseif (strlen($angkatan) > 10) {
            $error = true;
            $error_msg = "Angkatan tidak boleh lebih dari 10 karakter.";
        } elseif (($keperluan_opt === 'Pengumpulan Laporan Project Akhir (PA)' || $keperluan_opt === 'Pengumpulan Laporan Magang') && (empty($judul_laporan) || strlen($judul_laporan) > 220)) {
            $error = true;
            $error_msg = "Judul laporan wajib diisi dan maksimal 220 karakter.";
        } else {
            $stmt = $koneksi->prepare("INSERT INTO tb_pengunjung (nama, nim, angkatan, keperluan, tgl_kunjungan) VALUES (?, ?, ?, ?, NOW())");
            $stmt->bind_param("ssss", $nama, $nim, $angkatan, $keperluan);
            
            if ($stmt->execute()) {
                $success = true;
                $_SESSION['last_submit'] = time();
            } else {
                $error = true;
                $error_msg = "Gagal menyimpan data kunjungan.";
            }
            $stmt->close();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Visitor Ruang Baca | Ruang Baca DSB</title>
    <link rel="icon" href="dist/img/logo.png?v=2">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="assets/css/custom-admin.css?v=11">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <style>
        body {
            background: linear-gradient(-45deg, #0b192c, #1e293b, #0f172a, #111827);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .visitor-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.35);
            max-width: 520px;
            width: 100%;
            padding: 35px 30px;
            margin: auto;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
        }

        .visitor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
        }

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-section img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            background: #ffffff;
            border-radius: 12px;
            padding: 4px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            display: inline-block;
            transition: transform 0.5s ease;
        }

        .visitor-card:hover .logo-section img {
            transform: rotate(360deg);
        }

        .logo-section h2 {
            margin: 15px 0 5px 0;
            font-weight: 700;
            font-size: 26px;
            color: #0b192c;
            letter-spacing: -0.5px;
        }

        .logo-section p {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .clock-container {
            display: inline-block;
            background: #f1f5f9;
            color: #334155;
            padding: 6px 14px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 5px;
            border: 1px solid #e2e8f0;
        }

        .form-group label {
            font-size: 12px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 6px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control {
            border-radius: 10px !important;
            height: 44px;
            border: 1px solid #cbd5e1;
            box-shadow: none;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .form-control:focus {
            border-color: #0066cc;
            box-shadow: 0 0 0 4px rgba(0, 102, 204, 0.15);
            background-color: #ffffff;
        }

        .btn-submit {
            background: linear-gradient(135deg, #0066cc 0%, #0052a3 100%);
            border: none;
            color: #ffffff;
            font-weight: 700;
            height: 48px;
            border-radius: 10px !important;
            font-size: 15px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 30px;
            box-shadow: 0 4px 12px rgba(0, 102, 204, 0.25);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #0052a3 0%, #003d7a 100%);
            color: #ffffff;
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(0, 102, 204, 0.4);
        }

        .btn-submit:active {
            transform: translateY(1px);
        }

        .header-bg {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 8px;
            background: linear-gradient(90deg, #0066cc 0%, #10b981 50%, #f43f5e 100%);
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .action-links {
            text-align: center;
            margin-top: 25px;
            font-size: 13px;
        }

        .action-links a {
            color: #0066cc;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .action-links a:hover {
            color: #00448f;
            text-decoration: underline;
        }

        .footer-text {
            color: rgba(255, 255, 255, 0.4);
            font-size: 11px;
            text-align: center;
            margin-top: 25px;
            width: 100%;
            letter-spacing: 0.5px;
        }
        
        .input-icon-group {
            position: relative;
        }
        
        .input-icon-group i {
            position: absolute;
            right: 15px;
            top: 14px;
            color: #94a3b8;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <div>
        <div class="visitor-card">
            <div class="header-bg"></div>
            
            <div class="logo-section">
                <img src="dist/img/logo.png" alt="Logo Perpus">
                <h2>E-Visitor Ruang Baca</h2>
                <p>Silakan isi data kunjungan Anda di perpustakaan hari ini</p>
                <div class="clock-container">
                    <i class="fa fa-clock-o"></i> <span id="realtime-clock">00:00:00 WIB</span>
                </div>
            </div>

            <form id="visitorForm" action="" method="post">
                <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">

                <div class="form-group">
                    <label for="nama">Nama Lengkap <span class="text-danger">*</span></label>
                    <div class="input-icon-group">
                        <input type="text" name="nama" id="nama" class="form-control" placeholder="Masukkan nama lengkap Anda..." required autocomplete="off" maxlength="100">
                        <i class="fa fa-user"></i>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="nim">NRP / No. Identitas <span class="text-danger">*</span></label>
                            <div class="input-icon-group">
                                <input type="text" name="nim" id="nim" class="form-control" placeholder="Angka identitas..." required autocomplete="off" maxlength="20" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                <i class="fa fa-id-card"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group">
                            <label for="angkatan">Angkatan <span class="text-danger">*</span></label>
                            <div class="input-icon-group">
                                <input type="text" name="angkatan" id="angkatan" class="form-control" placeholder="Contoh: 2024, Alumni, dll..." required autocomplete="off" maxlength="10">
                                <i class="fa fa-graduation-cap"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="keperluan">Keperluan <span class="text-danger">*</span></label>
                    <select name="keperluan" id="keperluan" class="form-control" required onchange="toggleKeperluanLain(this.value)">
                        <option value="" disabled selected>Pilih Tujuan Kunjungan...</option>
                        <option value="Membaca Buku">Membaca Buku</option>
                        <option value="Mengerjakan Tugas">Mengerjakan Tugas</option>
                        <option value="Cari Referensi / Diskusi">Cari Referensi / Diskusi</option>
                        <option value="Pengumpulan Laporan Project Akhir (PA)">Pengumpulan Laporan Project Akhir (PA)</option>
                        <option value="Pengumpulan Laporan Magang">Pengumpulan Laporan Magang</option>
                        <option value="Lainnya">Lainnya</option>
                    </select>
                </div>

                <div class="form-group" id="judulLaporanContainer" style="display: none;">
                    <label for="judul_laporan">Judul Laporan <span class="text-danger">*</span></label>
                    <input type="text" name="judul_laporan" id="judul_laporan" class="form-control" placeholder="Masukkan judul laporan Anda..." maxlength="220" autocomplete="off">
                </div>

                <div class="form-group" id="keperluanLainContainer" style="display: none;">
                    <label for="keperluan_lain">Tuliskan Keperluan Lain <span class="text-danger">*</span></label>
                    <input type="text" name="keperluan_lain" id="keperluan_lain" class="form-control" placeholder="Tuliskan tujuan lainnya..." maxlength="150">
                </div>

                <button type="submit" name="Simpan" class="btn btn-block btn-submit">
                    <i class="fa fa-pencil-square-o"></i> Simpan Kehadiran
                </button>
            </form>

            <div class="action-links">
                <a href="login.php"><i class="fa fa-lock"></i> Login Admin Area</a>
            </div>
        </div>
        
        <div class="footer-text">
            &copy; <?= date('Y'); ?> Ruang Baca DSB. Hak Cipta Dilindungi.
        </div>
    </div>

    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <script>
        function toggleKeperluanLain(val) {
            if (val === 'Lainnya') {
                $('#keperluanLainContainer').slideDown();
                $('#keperluan_lain').attr('required', true);
                
                $('#judulLaporanContainer').slideUp();
                $('#judul_laporan').removeAttr('required').val('');
            } else if (val === 'Pengumpulan Laporan Project Akhir (PA)' || val === 'Pengumpulan Laporan Magang') {
                $('#judulLaporanContainer').slideDown();
                $('#judul_laporan').attr('required', true);
                
                $('#keperluanLainContainer').slideUp();
                $('#keperluan_lain').removeAttr('required').val('');
            } else {
                $('#keperluanLainContainer').slideUp();
                $('#keperluan_lain').removeAttr('required').val('');
                
                $('#judulLaporanContainer').slideUp();
                $('#judul_laporan').removeAttr('required').val('');
            }
        }

        $('#nim').on('keypress', function(e) {
            if (e.which < 48 || e.which > 57) {
                return false;
            }
        });

        function updateClock() {
            var now = new Date();
            var hours = String(now.getHours()).padStart(2, '0');
            var minutes = String(now.getMinutes()).padStart(2, '0');
            var seconds = String(now.getSeconds()).padStart(2, '0');
            document.getElementById('realtime-clock').textContent = hours + ':' + minutes + ':' + seconds + ' WIB';
        }
        setInterval(updateClock, 1000);
        updateClock();
    </script>

    <?php if ($success): ?>
    <script>
        Swal.fire({
            title: 'Kunjungan Dicatat!',
            text: 'Terima kasih telah mencatatkan kehadiran Anda.',
            icon: 'success',
            confirmButtonColor: '#0066cc',
            confirmButtonText: 'OK'
        }).then((result) => {
            window.location = 'pengunjung.php';
        });
    </script>
    <?php endif; ?>

    <?php if ($error): ?>
    <script>
        Swal.fire({
            title: 'Gagal Menyimpan',
            text: '<?= $error_msg; ?>',
            icon: 'error',
            confirmButtonColor: '#f43f5e',
            confirmButtonText: 'Kembali'
        });
    </script>
    <?php endif; ?>
</body>

</html>
