<?php
if(isset($_GET['kode'])){
    $kode = $_GET['kode'];

    $stmt_cek = $koneksi->prepare("SELECT file_buku FROM tb_buku WHERE id_buku = ?");
    $stmt_cek->bind_param("s", $kode);
    $stmt_cek->execute();
    $q_buku = $stmt_cek->get_result();
    if ($r = $q_buku->fetch_assoc()) {
        if (!empty($r['file_buku']) && file_exists('uploads/books/' . $r['file_buku'])) {
            @unlink('uploads/books/' . $r['file_buku']);
        }
    }
    $stmt_cek->close();

    $stmt_del = $koneksi->prepare("DELETE FROM tb_buku WHERE id_buku = ?");
    $stmt_del->bind_param("s", $kode);
    $query_hapus = $stmt_del->execute();
    $stmt_del->close();

    if ($query_hapus) {
        echo "<script>
        Swal.fire({title: 'Hapus Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
        }).then((result) => {
            if (result.value) {
                window.location = 'index.php?page=MyApp/data_buku';
            }
        })</script>";
    }else{
        echo "<script>
        Swal.fire({title: 'Hapus Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
        }).then((result) => {
            if (result.value) {
                window.location = 'index.php?page=MyApp/data_buku';
            }
        })</script>";
    }
}
?>
