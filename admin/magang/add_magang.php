<section class="content-header">
    <h1>
        Tambah Laporan Magang
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li>
            <a href="?page=MyApp/data_magang">Laporan Magang</a>
        </li>
        <li class="active">Tambah Laporan Magang</li>
    </ol>
</section>

<section class="content">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-8">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-briefcase" style="color: #3b82f6;"></i> Form Laporan Magang</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="judul">Judul Laporan Magang <span class="required" style="color:red;">*</span></label>
                            <input type="text" name="judul" id="judul" class="form-control" placeholder="Masukkan judul magang..." required autocomplete="off">
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nama_mahasiswa">Nama Mahasiswa <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="nama_mahasiswa" id="nama_mahasiswa" class="form-control" placeholder="Nama mahasiswa..." required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nim">NRP <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="nim" id="nim" class="form-control" placeholder="NRP mahasiswa (angka)..." required autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="angkatan">Angkatan <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="angkatan" id="angkatan" class="form-control" placeholder="Contoh: 2024" required autocomplete="off" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="tempat_magang">Tempat Magang <span class="required" style="color:red;">*</span></label>
                                    <input type="text" name="tempat_magang" id="tempat_magang" class="form-control" placeholder="Instansi/Perusahaan tempat magang..." required autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="file_laporan">Berkas PDF Laporan <span class="required" style="color:red;">*</span></label>
                                    <input type="file" name="file_laporan" id="file_laporan" class="form-control" accept="application/pdf" required>
                                    <span style="font-size: 11px; opacity: 0.8;">Format PDF (maks. 10MB)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box-footer" style="display: flex; gap: 10px; background-color: #ffffff;">
                        <button type="submit" name="Simpan" class="btn btn-primary"><i class="fa fa-save"></i> Simpan Laporan</button>
                        <a href="?page=MyApp/data_magang" class="btn btn-default" style="color: #64748b;"><i class="fa fa-times"></i> Batal</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

<?php
if (isset($_POST['Simpan'])) {
    $judul = $_POST['judul'];
    $nama_mahasiswa = $_POST['nama_mahasiswa'];
    $nim = $_POST['nim'];
    $angkatan = $_POST['angkatan'];
    $tempat_magang = $_POST['tempat_magang'];

    if (!ctype_digit($nim)) {
        echo "<script>
        Swal.fire({title: 'Tambah Data Gagal', text: 'NRP harus berupa angka.', icon: 'error', confirmButtonText: 'OK'
        })</script>";
    } else if (!ctype_digit($angkatan) || strlen($angkatan) > 4) {
        echo "<script>
        Swal.fire({title: 'Tambah Data Gagal', text: 'Angkatan harus berupa angka maksimal 4 digit.', icon: 'error', confirmButtonText: 'OK'
        })</script>";
    } else {
        $nama_file_laporan = '';
        if (isset($_FILES['file_laporan']) && $_FILES['file_laporan']['error'] === UPLOAD_ERR_OK) {
            $fileTmpPath = $_FILES['file_laporan']['tmp_name'];
            $fileName = $_FILES['file_laporan']['name'];
            $fileNameCmps = explode(".", $fileName);
            $fileExtension = strtolower(end($fileNameCmps));
            $newFileName = time() . '_' . preg_replace('/[^A-Za-z0-9\-]/', '', $fileNameCmps[0]) . '.' . $fileExtension;

            if ($fileExtension === 'pdf') {
                if (!file_exists('uploads/magang')) {
                    mkdir('uploads/magang', 0777, true);
                }
                $uploadFileDir = 'uploads/magang/';
                $dest_path = $uploadFileDir . $newFileName;
                if(move_uploaded_file($fileTmpPath, $dest_path)) {
                    $nama_file_laporan = $newFileName;
                }
            }
        }

        if (!empty($nama_file_laporan)) {
            $sql_simpan = "INSERT INTO tb_magang (judul, nama_mahasiswa, nim, angkatan, tempat_magang, file_laporan) VALUES (
                '" . $koneksi->real_escape_string($judul) . "',
                '" . $koneksi->real_escape_string($nama_mahasiswa) . "',
                '" . $koneksi->real_escape_string($nim) . "',
                '" . $koneksi->real_escape_string($angkatan) . "',
                '" . $koneksi->real_escape_string($tempat_magang) . "',
                '" . $koneksi->real_escape_string($nama_file_laporan) . "'
            )";
            $query_simpan = mysqli_query($koneksi, $sql_simpan);
            if ($query_simpan) {
                echo "<script>
                Swal.fire({title: 'Tambah Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
                }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/data_magang'; } })</script>";
            } else {
                echo "<script>
                Swal.fire({title: 'Tambah Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
                }).then((result) => { if (result.value) { window.location = 'index.php?page=MyApp/add_magang'; } })</script>";
            }
        } else {
            echo "<script>
            Swal.fire({title: 'Unggah Gagal', text: 'Pastikan file berformat PDF dan tidak corrupt.', icon: 'error', confirmButtonText: 'OK'
            })</script>";
        }
    }
}
?>
