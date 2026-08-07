<?php
if(isset($_GET['kode'])){
    $kode = $koneksi->real_escape_string($_GET['kode']);
    $sql_cek = "SELECT file_laporan FROM tb_magang WHERE id_magang='$kode'";
    $query_cek = mysqli_query($koneksi, $sql_cek);
    $data_cek = mysqli_fetch_array($query_cek, MYSQLI_BOTH);

    if (!empty($data_cek['file_laporan']) && file_exists('uploads/magang/' . $data_cek['file_laporan'])) {
        @unlink('uploads/magang/' . $data_cek['file_laporan']);
    }

    $sql_hapus = "DELETE FROM tb_magang WHERE id_magang='$kode'";
    $query_hapus = mysqli_query($koneksi, $sql_hapus);

    if ($query_hapus) {
        echo "<script>
        Swal.fire({title: 'Hapus Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_magang'; } })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Hapus Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_magang'; } })</script>";
    }
}
?>
