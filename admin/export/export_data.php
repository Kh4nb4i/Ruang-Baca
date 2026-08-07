<?php
include "inc/koneksi.php";

// Ambil parameter filter
$type = isset($_GET['type']) ? $_GET['type'] : 'buku';
$judul = isset($_GET['judul']) ? $_GET['judul'] : '';
$start = isset($_GET['start']) ? $_GET['start'] : '';
$end = isset($_GET['end']) ? $_GET['end'] : '';
$tempat = isset($_GET['tempat']) ? $_GET['tempat'] : '';
$format = isset($_GET['format']) ? $_GET['format'] : 'pdf';

// Bangun query berdasarkan tipe data
$where_clauses = [];
$filename_type = "";
$report_title = "";

if ($type === 'buku') {
    $filename_type = "Buku";
    $report_title = "LAPORAN DATA BUKU";
    if (!empty($judul)) {
        $where_clauses[] = "b.judul_buku LIKE '%" . $koneksi->real_escape_string($judul) . "%'";
    }
    if (!empty($start)) {
        $where_clauses[] = "b.th_terbit >= '" . intval($start) . "'";
    }
    if (!empty($end)) {
        $where_clauses[] = "b.th_terbit <= '" . intval($end) . "'";
    }
    $where_sql = "";
    if (count($where_clauses) > 0) {
        $where_sql = "WHERE " . implode(" AND ", $where_clauses);
    }
    $sql = "SELECT b.*, r.nama_rak, k.nama_kategori 
            FROM tb_buku b 
            LEFT JOIN tb_rak r ON b.id_rak = r.id_rak 
            LEFT JOIN tb_kategori k ON b.id_kategori = k.id_kategori
            $where_sql ORDER BY b.id_buku DESC";
} elseif ($type === 'pa') {
    $filename_type = "Project_Akhir";
    $report_title = "LAPORAN DATA PROJECT AKHIR (PA)";
    if (!empty($judul)) {
        $where_clauses[] = "judul LIKE '%" . $koneksi->real_escape_string($judul) . "%'";
    }
    if (!empty($start)) {
        $where_clauses[] = "angkatan >= '" . $koneksi->real_escape_string($start) . "'";
    }
    if (!empty($end)) {
        $where_clauses[] = "angkatan <= '" . $koneksi->real_escape_string($end) . "'";
    }
    $where_sql = "";
    if (count($where_clauses) > 0) {
        $where_sql = "WHERE " . implode(" AND ", $where_clauses);
    }
    $sql = "SELECT * FROM tb_pa $where_sql ORDER BY id_pa DESC";
} elseif ($type === 'magang') {
    $filename_type = "Magang";
    $report_title = "LAPORAN DATA LAPORAN MAGANG";
    if (!empty($judul)) {
        $where_clauses[] = "judul LIKE '%" . $koneksi->real_escape_string($judul) . "%'";
    }
    if (!empty($start)) {
        $where_clauses[] = "angkatan >= '" . $koneksi->real_escape_string($start) . "'";
    }
    if (!empty($end)) {
        $where_clauses[] = "angkatan <= '" . $koneksi->real_escape_string($end) . "'";
    }
    if (!empty($tempat)) {
        $where_clauses[] = "tempat_magang LIKE '%" . $koneksi->real_escape_string($tempat) . "%'";
    }
    $where_sql = "";
    if (count($where_clauses) > 0) {
        $where_sql = "WHERE " . implode(" AND ", $where_clauses);
    }
    $sql = "SELECT * FROM tb_magang $where_sql ORDER BY id_magang DESC";
} elseif ($type === 'pengunjung') {
    $filename_type = "Pengunjung";
    $report_title = "LAPORAN DATA PENGUNJUNG RUANG BACA";
    if (!empty($judul)) {
        $where_clauses[] = "(nama LIKE '%" . $koneksi->real_escape_string($judul) . "%' OR nim LIKE '%" . $koneksi->real_escape_string($judul) . "%')";
    }
    if (!empty($start)) {
        $where_clauses[] = "DATE(tgl_kunjungan) >= '" . $koneksi->real_escape_string($start) . "'";
    }
    if (!empty($end)) {
        $where_clauses[] = "DATE(tgl_kunjungan) <= '" . $koneksi->real_escape_string($end) . "'";
    }
    $where_sql = "";
    if (count($where_clauses) > 0) {
        $where_sql = "WHERE " . implode(" AND ", $where_clauses);
    }
    $sql = "SELECT * FROM tb_pengunjung $where_sql ORDER BY id_pengunjung DESC";
}

$query = mysqli_query($koneksi, $sql);
$data_list = [];
while ($row = mysqli_fetch_assoc($query)) {
    $data_list[] = $row;
}

// ----------------------------------------------------
// FORMAT 1: CSV EXPORT
// ----------------------------------------------------
if ($format === 'csv') {
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename=Laporan_' . $filename_type . '_' . date('Ymd_His') . '.csv');
    
    $output = fopen('php://output', 'w');
    
    if ($type === 'buku') {
        fputcsv($output, ['No', 'ID Buku', 'ISBN', 'No Klasifikasi', 'Judul Buku', 'Pengarang', 'Penerbit', 'Tahun Terbit', 'Jumlah Eksemplar', 'Rak', 'Kategori']);
        $no = 1;
        foreach ($data_list as $row) {
            fputcsv($output, [
                $no++, 
                $row['id_buku'], 
                $row['isbn'], 
                $row['no_klasifikasi'], 
                $row['judul_buku'], 
                $row['pengarang'], 
                $row['penerbit'], 
                $row['th_terbit'], 
                $row['jumlah_eksemplar'], 
                $row['nama_rak'], 
                $row['nama_kategori']
            ]);
        }
    } elseif ($type === 'pa') {
        fputcsv($output, ['No', 'ID PA', 'Judul PA', 'Nama Mahasiswa', 'NRP', 'Angkatan']);
        $no = 1;
        foreach ($data_list as $row) {
            fputcsv($output, [
                $no++, 
                $row['id_pa'], 
                $row['judul'], 
                $row['nama_mahasiswa'], 
                $row['nim'], 
                $row['angkatan']
            ]);
        }
    } elseif ($type === 'magang') {
        fputcsv($output, ['No', 'ID Magang', 'Judul Magang', 'Nama Mahasiswa', 'NRP', 'Angkatan', 'Tempat Magang']);
        $no = 1;
        foreach ($data_list as $row) {
            fputcsv($output, [
                $no++, 
                $row['id_magang'], 
                $row['judul'], 
                $row['nama_mahasiswa'], 
                $row['nim'], 
                $row['angkatan'], 
                $row['tempat_magang']
            ]);
        }
    } elseif ($type === 'pengunjung') {
        fputcsv($output, ['No', 'Nama Pengunjung', 'NRP/No. Identitas', 'Angkatan', 'Keperluan', 'Tanggal Kunjungan']);
        $no = 1;
        foreach ($data_list as $row) {
            fputcsv($output, [
                $no++, 
                $row['nama'], 
                $row['nim'], 
                $row['angkatan'], 
                $row['keperluan'], 
                date('d-m-Y H:i', strtotime($row['tgl_kunjungan']))
            ]);
        }
    }
    fclose($output);
    exit;
}

// ----------------------------------------------------
// FORMAT 2: EXCEL EXPORT
// ----------------------------------------------------
if ($format === 'excel') {
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename=Laporan_' . $filename_type . '_' . date('Ymd_His') . '.xls');
    ?>
    <html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style>
            table { border-collapse: collapse; width: 100%; }
            th { background-color: #0f172a; color: #ffffff; font-weight: bold; border: 1px solid #cbd5e1; padding: 8px; }
            td { border: 1px solid #cbd5e1; padding: 8px; vertical-align: middle; }
            .title { font-size: 16px; font-weight: bold; text-align: center; margin-bottom: 20px; }
        </style>
    </head>
    <body>
        <div class="title"><?php echo $report_title; ?></div>
        <?php if (!empty($judul) || !empty($start) || !empty($end) || !empty($tempat)): ?>
            <div style="margin-bottom: 15px;">
                <strong>Filter Diterapkan:</strong><br>
                <?php if(!empty($judul)) echo "- Judul: " . htmlspecialchars($judul) . "<br>"; ?>
                <?php if(!empty($start) || !empty($end)) echo "- Periode/Angkatan: " . htmlspecialchars($start) . " s/d " . htmlspecialchars($end) . "<br>"; ?>
                <?php if(!empty($tempat)) echo "- Tempat Magang: " . htmlspecialchars($tempat) . "<br>"; ?>
            </div>
        <?php endif; ?>

        <table>
            <thead>
                <?php if ($type === 'buku'): ?>
                    <tr>
                        <th>No</th>
                        <th>ID Buku</th>
                        <th>ISBN</th>
                        <th>Judul Buku</th>
                        <th>Pengarang</th>
                        <th>Penerbit</th>
                        <th>Tahun Terbit</th>
                        <th>Jumlah Eksemplar</th>
                        <th>Rak</th>
                        <th>Kategori</th>
                    </tr>
                <?php elseif ($type === 'pa'): ?>
                    <tr>
                        <th>No</th>
                        <th>Judul PA</th>
                        <th>Nama Mahasiswa</th>
                        <th>NRP</th>
                        <th>Angkatan</th>
                    </tr>
                <?php elseif ($type === 'magang'): ?>
                    <tr>
                        <th>No</th>
                        <th>Judul Magang</th>
                        <th>Nama Mahasiswa</th>
                        <th>NRP</th>
                        <th>Angkatan</th>
                        <th>Tempat Magang</th>
                    </tr>
                <?php elseif ($type === 'pengunjung'): ?>
                    <tr>
                        <th>No</th>
                        <th>Nama Pengunjung</th>
                        <th>NRP/No. Identitas</th>
                        <th>Angkatan</th>
                        <th>Keperluan</th>
                        <th>Tanggal Kunjungan</th>
                    </tr>
                <?php endif; ?>
            </thead>
            <tbody>
                <?php
                $no = 1;
                foreach ($data_list as $row) {
                    if ($type === 'buku') {
                        echo "<tr>
                            <td>".$no++."</td>
                            <td>'".$row['id_buku']."</td>
                            <td>'".$row['isbn']."</td>
                            <td>".htmlspecialchars($row['judul_buku'])."</td>
                            <td>".htmlspecialchars($row['pengarang'])."</td>
                            <td>".htmlspecialchars($row['penerbit'])."</td>
                            <td>".$row['th_terbit']."</td>
                            <td>".$row['jumlah_eksemplar']."</td>
                            <td>".htmlspecialchars($row['nama_rak'] ?? '-')."</td>
                            <td>".htmlspecialchars($row['nama_kategori'] ?? '-')."</td>
                        </tr>";
                    } elseif ($type === 'pa') {
                        echo "<tr>
                            <td>".$no++."</td>
                            <td>".htmlspecialchars($row['judul'])."</td>
                            <td>".htmlspecialchars($row['nama_mahasiswa'])."</td>
                            <td>'".$row['nim']."</td>
                            <td>".htmlspecialchars($row['angkatan'])."</td>
                        </tr>";
                    } elseif ($type === 'magang') {
                        echo "<tr>
                            <td>".$no++."</td>
                            <td>".htmlspecialchars($row['judul'])."</td>
                            <td>".htmlspecialchars($row['nama_mahasiswa'])."</td>
                            <td>'".$row['nim']."</td>
                            <td>".htmlspecialchars($row['angkatan'])."</td>
                            <td>".htmlspecialchars($row['tempat_magang'])."</td>
                        </tr>";
                    } elseif ($type === 'pengunjung') {
                        echo "<tr>
                            <td>".$no++."</td>
                            <td>".htmlspecialchars($row['nama'])."</td>
                            <td>'".$row['nim']."</td>
                            <td>".htmlspecialchars($row['angkatan'])."</td>
                            <td>".htmlspecialchars($row['keperluan'])."</td>
                            <td>".date('d-m-Y H:i', strtotime($row['tgl_kunjungan']))." WIB</td>
                        </tr>";
                    }
                }
                ?>
            </tbody>
        </table>
    </body>
    </html>
    <?php
    exit;
}

// ----------------------------------------------------
// FORMAT 3: PDF (PRINT STYLESHEET HTML)
// ----------------------------------------------------
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Cetak Laporan - <?php echo $filename_type; ?></title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            font-size: 12px;
            color: #334155;
            padding: 30px;
            line-height: 1.5;
        }
        .header-container {
            display: flex;
            align-items: center;
            border-bottom: 3px double #1e293b;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .logo-box {
            width: 60px;
            height: 60px;
            background-color: #ffffff;
            border-radius: 8px;
            border: 1.5px solid #cbd5e1;
            padding: 4px;
            margin-right: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .logo-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        .header-title-text {
            flex-grow: 1;
        }
        .header-title-text h1 {
            font-size: 18px;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 4px 0;
            text-transform: uppercase;
        }
        .header-title-text p {
            margin: 0;
            color: #64748b;
            font-size: 11px;
        }
        .report-meta {
            margin-bottom: 20px;
            font-size: 11px;
            color: #475569;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 10px 15px;
        }
        .report-meta table {
            width: auto;
        }
        .report-meta td {
            border: none;
            padding: 2px 10px 2px 0;
            font-size: 11px;
        }
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table.data-table th {
            background-color: #0f172a;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 10px;
            letter-spacing: 0.5px;
            border: 1px solid #cbd5e1;
            padding: 8px 10px;
            text-align: left;
        }
        table.data-table td {
            border: 1px solid #cbd5e1;
            padding: 8px 10px;
            color: #334155;
        }
        table.data-table tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }
        .footer-sig {
            margin-top: 50px;
            display: flex;
            justify-content: flex-end;
        }
        .sig-box {
            text-align: center;
            width: 200px;
        }
        .sig-space {
            height: 70px;
        }
        @media print {
            body { padding: 0; }
            .no-print { display: none !important; }
        }
    </style>
</head>
<body>

    <div class="no-print" style="margin-bottom: 20px; background-color: #eff6ff; border: 1px solid #bfdbfe; border-radius: 6px; padding: 10px 15px; display: flex; justify-content: space-between; align-items: center;">
        <span style="color: #1e3a8a; font-weight: 500;">Dokumen Laporan PDF siap dicetak. Silakan simpan sebagai PDF atau cetak ke printer Anda.</span>
        <button onclick="window.print()" style="background-color: #2563eb; color: #ffffff; border: none; padding: 6px 15px; border-radius: 4px; font-weight: bold; cursor: pointer;">
            <i class="fa fa-print"></i> Cetak Laporan
        </button>
    </div>

    <!-- Header Laporan Formal -->
    <div class="header-container">
        <div class="logo-box">
            <img src="dist/img/logo.png" alt="Logo" onerror="this.style.display='none';">
        </div>
        <div class="header-title-text">
            <h1><?php echo $report_title; ?></h1>
            <p>Perpustakaan Ruang Baca DSB - Sistem Katalog & Laporan Terpadu</p>
        </div>
    </div>

    <!-- Meta / Filter Info -->
    <div class="report-meta">
        <table>
            <tr>
                <td><strong>Tanggal Cetak</strong></td>
                <td>: <?php echo date('d F Y, H:i'); ?> WIB</td>
            </tr>
            <?php if (!empty($judul)): ?>
                <tr>
                    <td><strong>Filter Kata Kunci</strong></td>
                    <td>: "<?php echo htmlspecialchars($judul); ?>"</td>
                </tr>
            <?php endif; ?>
            <?php if (!empty($start) || !empty($end)): ?>
                <tr>
                    <td><strong>Rentang Periode/Angkatan</strong></td>
                    <td>: <?php echo htmlspecialchars($start ?? '-'); ?> s/d <?php echo htmlspecialchars($end ?? '-'); ?></td>
                </tr>
            <?php endif; ?>
            <?php if (!empty($tempat)): ?>
                <tr>
                    <td><strong>Tempat Magang</strong></td>
                    <td>: <?php echo htmlspecialchars($tempat); ?></td>
                </tr>
            <?php endif; ?>
            <tr>
                <td><strong>Total Data</strong></td>
                <td>: <?php echo count($data_list); ?> item ditemukan</td>
            </tr>
        </table>
    </div>

    <!-- Tabel Data Utama -->
    <table class="data-table">
        <thead>
            <?php if ($type === 'buku'): ?>
                <tr>
                    <th width="40">No</th>
                    <th width="60">ID Buku</th>
                    <th width="100">ISBN</th>
                    <th>Judul Buku</th>
                    <th width="150">Pengarang</th>
                    <th width="120">Penerbit</th>
                    <th width="80">Tahun Terbit</th>
                    <th width="60">Eksemplar</th>
                    <th width="100">Rak / Kategori</th>
                </tr>
            <?php elseif ($type === 'pa'): ?>
                <tr>
                    <th width="40">No</th>
                    <th>Judul Project Akhir (PA)</th>
                    <th width="180">Nama Mahasiswa</th>
                    <th width="120">NRP</th>
                    <th width="80">Angkatan</th>
                </tr>
            <?php elseif ($type === 'magang'): ?>
                <tr>
                    <th width="40">No</th>
                    <th>Judul Laporan Magang</th>
                    <th width="180">Nama Mahasiswa</th>
                    <th width="100">NRP</th>
                    <th width="80">Angkatan</th>
                    <th width="150">Tempat Magang</th>
                </tr>
            <?php elseif ($type === 'pengunjung'): ?>
                <tr>
                    <th width="40">No</th>
                    <th width="180">Nama Pengunjung</th>
                    <th width="120">NRP/No. Identitas</th>
                    <th width="100">Angkatan</th>
                    <th>Keperluan</th>
                    <th width="160">Tanggal Kunjungan</th>
                </tr>
            <?php endif; ?>
        </thead>
        <tbody>
            <?php
            if (count($data_list) === 0) {
                $colspan = ($type === 'buku') ? 9 : (($type === 'pa') ? 5 : 6);
                echo "<tr><td colspan='$colspan' style='text-align: center; color: #94a3b8; padding: 20px;'>Tidak ada data yang memenuhi kriteria filter.</td></tr>";
            } else {
                $no = 1;
                foreach ($data_list as $row) {
                    if ($type === 'buku') {
                        echo "<tr>
                            <td align='center'>".$no++."</td>
                            <td><code>".htmlspecialchars($row['id_buku'])."</code></td>
                            <td>".htmlspecialchars($row['isbn'] ?? '-')."</td>
                            <td style='font-weight:600;'>".htmlspecialchars($row['judul_buku'])."</td>
                            <td>".htmlspecialchars($row['pengarang'])."</td>
                            <td>".htmlspecialchars($row['penerbit'])."</td>
                            <td align='center'>".$row['th_terbit']."</td>
                            <td align='center'>".$row['jumlah_eksemplar']."</td>
                            <td>
                                <span style='font-size:10px;'>Rak: ".htmlspecialchars($row['nama_rak'] ?? '-')."</span><br>
                                <span style='font-size:10px;'>Kat: ".htmlspecialchars($row['nama_kategori'] ?? '-')."</span>
                            </td>
                        </tr>";
                    } elseif ($type === 'pa') {
                        echo "<tr>
                            <td align='center'>".$no++."</td>
                            <td style='font-weight:600;'>".htmlspecialchars($row['judul'])."</td>
                            <td>".htmlspecialchars($row['nama_mahasiswa'])."</td>
                            <td><code>".htmlspecialchars($row['nim'])."</code></td>
                            <td align='center'>".htmlspecialchars($row['angkatan'])."</td>
                        </tr>";
                    } elseif ($type === 'magang') {
                        echo "<tr>
                            <td align='center'>".$no++."</td>
                            <td style='font-weight:600;'>".htmlspecialchars($row['judul'])."</td>
                            <td>".htmlspecialchars($row['nama_mahasiswa'])."</td>
                            <td><code>".htmlspecialchars($row['nim'])."</code></td>
                            <td align='center'>".htmlspecialchars($row['angkatan'])."</td>
                            <td>".htmlspecialchars($row['tempat_magang'])."</td>
                        </tr>";
                    } elseif ($type === 'pengunjung') {
                        echo "<tr>
                            <td align='center'>".$no++."</td>
                            <td style='font-weight:600;'>".htmlspecialchars($row['nama'])."</td>
                            <td><code>".htmlspecialchars($row['nim'])."</code></td>
                            <td align='center'>".htmlspecialchars($row['angkatan'])."</td>
                            <td>".htmlspecialchars($row['keperluan'])."</td>
                            <td>".date('d-m-Y H:i', strtotime($row['tgl_kunjungan']))." WIB</td>
                        </tr>";
                    }
                }
            }
            ?>
        </tbody>
    </table>

    <!-- Tanda Tangan Pembimbing / Petugas -->
    <div class="footer-sig">
        <div class="sig-box">
            <p>Pati, <?php echo date('d F Y'); ?></p>
            <p>Administrator,</p>
            <div class="sig-space"></div>
            <p style="text-decoration: underline; font-weight: bold;">Staf Ruang Baca</p>
        </div>
    </div>

    <script>
        // Picu print browser saat dokumen termuat
        window.addEventListener('DOMContentLoaded', (event) => {
            setTimeout(function() {
                window.print();
            }, 500);
        });
    </script>
</body>
</html>
