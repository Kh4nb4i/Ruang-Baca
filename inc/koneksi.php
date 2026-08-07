<?php
$koneksi = new mysqli ("localhost","root","Asuna123","data_perpus");
if ($koneksi && !$koneksi->connect_error) {
    $koneksi->query("CREATE TABLE IF NOT EXISTS `tb_pengunjung` (
      `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT,
      `nama` varchar(255) NOT NULL,
      `nim` varchar(50) NOT NULL,
      `angkatan` varchar(10) NOT NULL,
      `keperluan` varchar(255) NOT NULL,
      `tgl_kunjungan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`id_pengunjung`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
    
    // Otomatis tambah kolom status_konfirmasi jika belum ada
    $check_col = $koneksi->query("SHOW COLUMNS FROM `tb_pengunjung` LIKE 'status_konfirmasi'");
    if ($check_col->num_rows == 0) {
        $koneksi->query("ALTER TABLE `tb_pengunjung` ADD COLUMN `status_konfirmasi` varchar(50) NOT NULL DEFAULT 'Belum Dikonfirmasi'");
    }
}
?>