<?php
if(isset($_GET['kode'])){
    $kode = $_GET['kode'];
    
    $stmt = $koneksi->prepare("DELETE FROM tb_pengunjung WHERE id_pengunjung = ?");
    $stmt->bind_param("i", $kode);
    $query_hapus = $stmt->execute();
    $stmt->close();

    if ($query_hapus) {
        echo "<script>
        Swal.fire({title: 'Hapus Data Berhasil', text: 'Data kunjungan berhasil dihapus.', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_pengunjung'; } })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Hapus Data Gagal', text: 'Gagal menghapus data kunjungan.', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_pengunjung'; } })</script>";
    }
}
?>
