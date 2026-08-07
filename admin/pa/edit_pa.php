<?php
if(isset($_GET['kode'])){
    $kode = $koneksi->real_escape_string($_GET['kode']);
    $sql_cek = "SELECT * FROM tb_pa WHERE id_pa='$kode'";
    $query_cek = mysqli_query($koneksi, $sql_cek);
    $data_cek = mysqli_fetch_array($query_cek, MYSQLI_BOTH);
}
?>

<section class="content-header">
    <h1>
        Ubah Laporan PA
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li>
            <a href="?page=MyApp/data_pa">Laporan PA</a>
        </li>
        <li class="active">Ubah Laporan PA</li>
    </ol>
</section>

<section class="content">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-8">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-graduation-cap" style="color: #10b981;"></i> Form Laporan PA (Ubah)</h3>
                    </div>
                    <div class="box-body">
                        <input type="hidden" name="id_pa" value="<?php echo $data_cek['id_pa']; ?>">

                        <div class="form-group">
                            <label for="judul">Judul Project Akhir (PA) <span class="required" style="color:red;">*</span></label>
                            <input type="text" name="judul" id="judul" class="form-control" value="<?php echo htmlspecialchars($data_cek['judul']); ?>" required autocomplete="off">
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nama_mahasiswa">Nama Mahasiswa <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="nama_mahasiswa" id="nama_mahasiswa" class="form-control" value="<?php echo htmlspecialchars($data_cek['nama_mahasiswa']); ?>" required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nim">NRP <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="nim" id="nim" class="form-control" value="<?php echo htmlspecialchars($data_cek['nim']); ?>" required autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="angkatan">Angkatan <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="angkatan" id="angkatan" class="form-control" value="<?php echo htmlspecialchars($data_cek['angkatan']); ?>" required autocomplete="off" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="file_laporan">Berkas PDF Laporan (Ubah / Opsional)</label>
                                    <input type="file" name="file_laporan" id="file_laporan" class="form-control" accept="application/pdf">
                                    <?php if (!empty($data_cek['file_laporan'])): ?>
                                        <div style="font-size: 11px; margin-top: 5px;">File saat ini: <a href="uploads/pa/<?php echo htmlspecialchars($data_cek['file_laporan']); ?>" download style="color:#0066cc; font-weight:600;"><?php echo htmlspecialchars($data_cek['file_laporan']); ?></a></div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box-footer" style="display: flex; gap: 10px; background-color: #ffffff;">
                        <button type="submit" name="Ubah" class="btn btn-success"><i class="fa fa-save"></i> Simpan Perubahan</button>
                        <a href="?page=MyApp/data_pa" class="btn btn-default" style="color: #64748b;"><i class="fa fa-times"></i> Batal</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

<?php
if (isset($_POST['Ubah'])) {
    $id_pa = $_POST['id_pa'];
    $judul = $_POST['judul'];
    $nama_mahasiswa = $_POST['nama_mahasiswa'];
    $nim = $_POST['nim'];
    $angkatan = $_POST['angkatan'];

    $nama_file_laporan = $data_cek['file_laporan'];
    $upload_ok = true;

    if (!ctype_digit($nim)) {
        echo "<script>
        Swal.fire({title: 'Ubah Data Gagal', text: 'NRP harus berupa angka.', icon: 'error', confirmButtonText: 'OK'
        })</script>";
    } else if (!ctype_digit($angkatan) || strlen($angkatan) > 4) {
        echo "<script>
        Swal.fire({title: 'Ubah Data Gagal', text: 'Angkatan harus berupa angka maksimal 4 digit.', icon: 'error', confirmButtonText: 'OK'
        })</script>";
    } else {
        if (isset($_FILES['file_laporan']) && $_FILES['file_laporan']['error'] === UPLOAD_ERR_OK) {
            $fileTmpPath = $_FILES['file_laporan']['tmp_name'];
            $fileName = $_FILES['file_laporan']['name'];
            $fileNameCmps = explode(".", $fileName);
            $fileExtension = strtolower(end($fileNameCmps));
            $newFileName = time() . '_' . preg_replace('/[^A-Za-z0-9\-]/', '', $fileNameCmps[0]) . '.' . $fileExtension;

            if ($fileExtension === 'pdf') {
                if (!file_exists('uploads/pa')) {
                    mkdir('uploads/pa', 0777, true);
                }
                $uploadFileDir = 'uploads/pa/';
                $dest_path = $uploadFileDir . $newFileName;
                if(move_uploaded_file($fileTmpPath, $dest_path)) {
                    if (!empty($data_cek['file_laporan']) && file_exists('uploads/pa/' . $data_cek['file_laporan'])) {
                        @unlink('uploads/pa/' . $data_cek['file_laporan']);
                    }
                    $nama_file_laporan = $newFileName;
                }
            } else {
                $upload_ok = false;
            }
        }

        if ($upload_ok) {
            $sql_ubah = "UPDATE tb_pa SET
                judul = '" . $koneksi->real_escape_string($judul) . "',
                nama_mahasiswa = '" . $koneksi->real_escape_string($nama_mahasiswa) . "',
                nim = '" . $koneksi->real_escape_string($nim) . "',
                angkatan = '" . $koneksi->real_escape_string($angkatan) . "',
                file_laporan = '" . $koneksi->real_escape_string($nama_file_laporan) . "'
                WHERE id_pa = '" . $koneksi->real_escape_string($id_pa) . "'";

            $query_ubah = mysqli_query($koneksi, $sql_ubah);
            if ($query_ubah) {
                echo "<script>
                Swal.fire({title: 'Ubah Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
                }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_pa'; } })</script>";
            } else {
                echo "<script>
                Swal.fire({title: 'Ubah Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
                }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_pa'; } })</script>";
            }
        } else {
            echo "<script>
            Swal.fire({title: 'Ubah Data Gagal', text: 'Berkas laporan harus berformat PDF.', icon: 'error', confirmButtonText: 'OK'
            })</script>";
        }
    }
}
?>
