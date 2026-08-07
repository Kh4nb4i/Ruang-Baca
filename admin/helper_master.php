<?php
$hal = $_GET['page'];
$table = '';
$pk = '';
$col = '';
$title = '';
$icon = '';

switch ($hal) {
    case 'MyApp/data_kategori':
        $table = 'tb_kategori';
        $pk = 'id_kategori';
        $col = 'nama_kategori';
        $title = 'Kategori Buku';
        $icon = 'fa-tags';
        break;
    case 'MyApp/data_rak':
        $table = 'tb_rak';
        $pk = 'id_rak';
        $col = 'nama_rak';
        $title = 'Rak Buku';
        $icon = 'fa-cubes';
        break;
    case 'MyApp/data_penerbit':
        $table = 'tb_penerbit';
        $pk = 'id_penerbit';
        $col = 'nama_penerbit';
        $title = 'Penerbit Buku';
        $icon = 'fa-building-o';
        break;
    case 'MyApp/data_penulis':
        $table = 'tb_penulis';
        $pk = 'id_penulis';
        $col = 'nama_penulis';
        $title = 'Penulis Buku';
        $icon = 'fa-pencil-square-o';
        break;

}

if (isset($_POST['Simpan'])) {
    $val = $_POST['nilai_input'];
    $sql_simpan = "INSERT INTO $table ($col) VALUES ('" . $koneksi->real_escape_string($val) . "')";
    $query_simpan = mysqli_query($koneksi, $sql_simpan);
    if ($query_simpan) {
        echo "<script>
        Swal.fire({title: 'Tambah Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Tambah Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    }
}

if (isset($_POST['Ubah'])) {
    $id_val = $koneksi->real_escape_string($_POST['id_edit']);
    $val = $_POST['nilai_input_edit'];
    $sql_ubah = "UPDATE $table SET $col = '" . $koneksi->real_escape_string($val) . "' WHERE $pk = '$id_val'";
    $query_ubah = mysqli_query($koneksi, $sql_ubah);
    if ($query_ubah) {
        echo "<script>
        Swal.fire({title: 'Ubah Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Ubah Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    }
}

if (isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['id'])) {
    $id_del = $koneksi->real_escape_string($_GET['id']);
    $sql_hapus = "DELETE FROM $table WHERE $pk = '$id_del'";
    $query_hapus = mysqli_query($koneksi, $sql_hapus);
    if ($query_hapus) {
        echo "<script>
        Swal.fire({title: 'Hapus Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Hapus Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => { if (result.value) { window.location = 'index.php?page=$hal'; } })</script>";
    }
}
?>

<section class="content-header">
    <h1>
        Kelola <?php echo $title; ?>
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li class="active"><?php echo $title; ?></li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-4">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title"><i class="fa <?php echo $icon; ?>"></i> Tambah <?php echo $title; ?></h3>
                </div>
                <form action="" method="post">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Nama / Nilai <?php echo $title; ?><span class="required">*</span></label>
                            <input type="text" name="nilai_input" class="form-control" placeholder="Masukkan nama/nilai..." required autocomplete="off">
                        </div>
                    </div>
                    <div class="box-footer">
                        <input type="submit" name="Simpan" value="Simpan" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>

        <div class="col-md-8">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Daftar <?php echo $title; ?></h3>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th width="80px">No</th>
                                    <th>Nama / Nilai</th>
                                    <th width="150px">Kelola</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $sql = $koneksi->query("SELECT * FROM $table ORDER BY $pk DESC");
                                while ($data = $sql->fetch_assoc()) {
                                ?>
                                    <tr>
                                        <td><?php echo $no++; ?></td>
                                        <td><?php echo htmlspecialchars($data[$col]); ?></td>
                                        <td>
                                             <button class="btn btn-success btn-xs btn-edit" 
                                                     data-id="<?php echo $data[$pk]; ?>" 
                                                     data-val="<?php echo htmlspecialchars($data[$col], ENT_QUOTES); ?>" 
                                                     title="Ubah" data-toggle="modal" data-target="#editModal"
                                                     style="border-radius: 6px !important; padding: 5px 10px !important;">
                                                 <i class="fa fa-edit"></i>
                                             </button>
                                             
                                             <a href="?page=<?php echo $hal; ?>&action=delete&id=<?php echo $data[$pk]; ?>" 
                                                onclick="confirmAction(event, this.href, 'Hapus Parameter', 'Apakah Anda yakin ingin menghapus parameter ini?', 'warning', '#ef4444', 'Ya, Hapus')"
                                                title="Hapus" class="btn btn-danger btn-xs"
                                                style="border-radius: 6px !important; padding: 5px 10px !important;">
                                                 <i class="fa fa-trash"></i>
                                             </a>
                                        </td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="border-radius: 12px; overflow: hidden;">
            <form action="" method="post">
                <div class="modal-header" style="background-color: #0b192c; color: white;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white; opacity: 1;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editModalLabel">Edit <?php echo $title; ?></h4>
                </div>
                <div class="modal-body" style="padding: 20px;">
                    <input type="hidden" name="id_edit" id="id_edit">
                    <div class="form-group">
                        <label>Nama / Nilai<span class="required">*</span></label>
                        <input type="text" name="nilai_input_edit" id="nilai_input_edit" class="form-control" required autocomplete="off">
                    </div>
                </div>
                <div class="modal-footer" style="background-color: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="border-radius: 8px !important;">Batal</button>
                    <input type="submit" name="Ubah" value="Simpan Perubahan" class="btn btn-primary" style="border-radius: 8px !important;">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    $('.btn-edit').on('click', function() {
        var id = $(this).data('id');
        var val = $(this).data('val');
        $('#id_edit').val(id);
        $('#nilai_input_edit').val(val);
    });
});
</script>
