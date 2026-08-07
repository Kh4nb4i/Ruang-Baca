<?php
if(isset($_GET['kode'])){
    $kode = $_GET['kode'];
    $stmt_cek = $koneksi->prepare("SELECT * FROM tb_buku WHERE id_buku = ?");
    $stmt_cek->bind_param("s", $kode);
    $stmt_cek->execute();
    $query_cek = $stmt_cek->get_result();
    $data_cek = $query_cek->fetch_array(MYSQLI_BOTH);
    $stmt_cek->close();
}

if (isset($_POST['Ubah'])) {
    $id_buku = $_POST['id_buku'];
    $isbn = $_POST['isbn'];
    $no_klasifikasi = $_POST['no_klasifikasi'];
    $judul_buku = $_POST['judul_buku'];
    $id_rak = $_POST['id_rak'];
    $id_penulis = $_POST['id_penulis'];
    $id_penerbit = $_POST['id_penerbit'];
    $jumlah_eksemplar = $_POST['jumlah_eksemplar'];
    $deskripsi = $_POST['deskripsi'];
    $id_kategori = $_POST['id_kategori'];
    $th_terbit = $_POST['th_terbit'];

    // Dapatkan nama penulis dan penerbit untuk sinkronisasi data lama
    $pengarang = '';
    if (!empty($id_penulis)) {
        $q_pen = $koneksi->query("SELECT nama_penulis FROM tb_penulis WHERE id_penulis = '$id_penulis'");
        if ($r_pen = $q_pen->fetch_assoc()) {
            $pengarang = $r_pen['nama_penulis'];
        }
    }

    $penerbit = '';
    if (!empty($id_penerbit)) {
        $q_pen = $koneksi->query("SELECT nama_penerbit FROM tb_penerbit WHERE id_penerbit = '$id_penerbit'");
        if ($r_pen = $q_pen->fetch_assoc()) {
            $penerbit = $r_pen['nama_penerbit'];
        }
    }

    // Upload File Buku (PDF) jika ada file baru
    $nama_file_buku = $data_cek['file_buku'];
    if (isset($_FILES['file_buku']) && $_FILES['file_buku']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['file_buku']['tmp_name'];
        $fileName = $_FILES['file_buku']['name'];
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));
        $newFileName = time() . '_' . preg_replace('/[^A-Za-z0-9\-]/', '', $fileNameCmps[0]) . '.' . $fileExtension;

        $allowedfileExtensions = array('pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt');
        if (in_array($fileExtension, $allowedfileExtensions)) {
            if (!file_exists('uploads/books')) {
                mkdir('uploads/books', 0777, true);
            }
            $uploadFileDir = 'uploads/books/';
            $dest_path = $uploadFileDir . $newFileName;

            if(move_uploaded_file($fileTmpPath, $dest_path)) {
                // Hapus berkas lama jika ada
                if (!empty($data_cek['file_buku']) && file_exists('uploads/books/' . $data_cek['file_buku'])) {
                    @unlink('uploads/books/' . $data_cek['file_buku']);
                }
                $nama_file_buku = $newFileName;
            }
        }
    }

    // Eksekusi Update Query
    $sql_ubah = "UPDATE tb_buku SET
        isbn = '" . $koneksi->real_escape_string($isbn) . "',
        no_klasifikasi = '" . $koneksi->real_escape_string($no_klasifikasi) . "',
        judul_buku = '" . $koneksi->real_escape_string($judul_buku) . "',
        id_rak = '" . $koneksi->real_escape_string($id_rak) . "',
        id_penulis = '" . $koneksi->real_escape_string($id_penulis) . "',
        pengarang = '" . $koneksi->real_escape_string($pengarang) . "',
        id_penerbit = '" . $koneksi->real_escape_string($id_penerbit) . "',
        penerbit = '" . $koneksi->real_escape_string($penerbit) . "',
        jumlah_eksemplar = '" . $koneksi->real_escape_string($jumlah_eksemplar) . "',
        deskripsi = '" . $koneksi->real_escape_string($deskripsi) . "',
        id_kategori = '" . $koneksi->real_escape_string($id_kategori) . "',
        th_terbit = '" . $koneksi->real_escape_string($th_terbit) . "',
        file_buku = '" . $koneksi->real_escape_string($nama_file_buku) . "'
        WHERE id_buku = '" . $koneksi->real_escape_string($id_buku) . "'";

    $query_ubah = mysqli_query($koneksi, $sql_ubah);
    mysqli_close($koneksi);

    if ($query_ubah) {
        echo "<script>
        Swal.fire({title: 'Ubah Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
        }).then((result) => {
            if (result.value) {
                window.location = 'index.php?page=MyApp/data_buku';
            }
        })</script>";
    } else {
        echo "<script>
        Swal.fire({title: 'Ubah Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
        }).then((result) => {
            if (result.value) {
                window.location = 'index.php?page=MyApp/data_buku';
            }
        })</script>";
    }
}
?>

<section class="content-header">
    <h1>
        Ubah Data Buku
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin"><i class="fa fa-home"></i> <b>Dashboard</b></a>
        </li>
        <li>
            <a href="?page=MyApp/data_buku">Buku</a>
        </li>
        <li class="active">Ubah Data Buku</li>
    </ol>
</section>

<section class="content">
    <form action="" method="post" enctype="multipart/form-data">
        <!-- Hidden input untuk ID Buku -->
        <input type="hidden" name="id_buku" value="<?php echo $data_cek['id_buku']; ?>">

        <div class="row">
            <!-- Kolom Kiri: Form Data Buku (Takes 8 cols) -->
            <div class="col-md-8">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-book" style="color: #10b981;"></i> Form Data Buku (Ubah)</h3>
                    </div>
                    <div class="box-body">
                        <!-- Baris 1: ISBN & No Klasifikasi -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="isbn">ISBN <span class="required">*</span></label>
                                    <input type="text" name="isbn" id="isbn" class="form-control" value="<?php echo htmlspecialchars($data_cek['isbn'] ?? ''); ?>" required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="no_klasifikasi">No. Klasifikasi</label>
                                    <input type="text" name="no_klasifikasi" id="no_klasifikasi" class="form-control" value="<?php echo htmlspecialchars($data_cek['no_klasifikasi'] ?? ''); ?>" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <!-- Baris 2: Judul Buku & Rak -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="judul_buku">Judul Buku <span class="required">*</span></label>
                                    <input type="text" name="judul_buku" id="judul_buku" class="form-control" value="<?php echo htmlspecialchars($data_cek['judul_buku']); ?>" required autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_rak">Rak <span class="required">*</span></label>
                                    <select name="id_rak" id="id_rak" class="form-control select2" required style="width: 100%;">
                                        <option value="">Pilih rak</option>
                                        <?php
                                        $q_rak = $koneksi->query("SELECT * FROM tb_rak ORDER BY nama_rak ASC");
                                        while ($r = $q_rak->fetch_assoc()) {
                                            $sel = ($data_cek['id_rak'] == $r['id_rak']) ? 'selected' : '';
                                            echo "<option value='".$r['id_rak']."' $sel>".$r['nama_rak']."</option>";
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Baris 3: Penulis & Jumlah Eksemplar -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_penulis">Penulis <span class="required">*</span></label>
                                    <div class="input-with-button">
                                        <select name="id_penulis" id="id_penulis" class="form-control select2" required style="width: 100%;">
                                            <option value="">Pilih atau masukkan penulis</option>
                                            <?php
                                            $q_pen = $koneksi->query("SELECT * FROM tb_penulis ORDER BY nama_penulis ASC");
                                            while ($r = $q_pen->fetch_assoc()) {
                                                $sel = ($data_cek['id_penulis'] == $r['id_penulis']) ? 'selected' : '';
                                                echo "<option value='".$r['id_penulis']."' $sel>".$r['nama_penulis']."</option>";
                                            }
                                            ?>
                                        </select>
                                        <button type="button" class="btn btn-default btn-add-inline" id="btn-add-penulis"><i class="fa fa-plus"></i> Baru</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="jumlah_eksemplar">Jumlah Eksemplar <span class="required">*</span></label>
                                    <input type="number" name="jumlah_eksemplar" id="jumlah_eksemplar" class="form-control" value="<?php echo $data_cek['jumlah_eksemplar'] ?? '0'; ?>" required min="0">
                                </div>
                            </div>
                        </div>

                        <!-- Baris 4: Penerbit & Deskripsi -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_penerbit">Penerbit <span class="required">*</span></label>
                                    <div class="input-with-button">
                                        <select name="id_penerbit" id="id_penerbit" class="form-control select2" required style="width: 100%;">
                                            <option value="">Pilih atau masukkan penerbit</option>
                                            <?php
                                            $q_pub = $koneksi->query("SELECT * FROM tb_penerbit ORDER BY nama_penerbit ASC");
                                            while ($r = $q_pub->fetch_assoc()) {
                                                $sel = ($data_cek['id_penerbit'] == $r['id_penerbit']) ? 'selected' : '';
                                                echo "<option value='".$r['id_penerbit']."' $sel>".$r['nama_penerbit']."</option>";
                                            }
                                            ?>
                                        </select>
                                        <button type="button" class="btn btn-default btn-add-inline" id="btn-add-penerbit"><i class="fa fa-plus"></i> Baru</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="deskripsi">Deskripsi</label>
                                    <textarea name="deskripsi" id="deskripsi" class="form-control" placeholder="Masukkan deskripsi buku (opsional)" maxlength="500"><?php echo htmlspecialchars($data_cek['deskripsi'] ?? ''); ?></textarea>
                                    <div class="char-count" id="char-count">0 / 500</div>
                                </div>
                            </div>
                        </div>

                        <!-- Baris 5: Kategori & Tahun Terbit -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_kategori">Kategori <span class="required">*</span></label>
                                    <select name="id_kategori" id="id_kategori" class="form-control select2" required style="width: 100%;">
                                        <option value="">Pilih kategori buku</option>
                                        <?php
                                        $q_kat = $koneksi->query("SELECT * FROM tb_kategori ORDER BY nama_kategori ASC");
                                        while ($r = $q_kat->fetch_assoc()) {
                                            $sel = ($data_cek['id_kategori'] == $r['id_kategori']) ? 'selected' : '';
                                            echo "<option value='".$r['id_kategori']."' $sel>".$r['nama_kategori']."</option>";
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="th_terbit">Tahun Terbit <span class="required">*</span></label>
                                    <input type="number" name="th_terbit" id="th_terbit" class="form-control" value="<?php echo $data_cek['th_terbit']; ?>" required min="1000" max="2100" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <!-- Baris 6: File Buku -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="file_buku">Berkas PDF Buku (Ubah / Opsional)</label>
                                    <input type="file" name="file_buku" id="file_buku" class="form-control" accept="application/pdf">
                                    <?php if (!empty($data_cek['file_buku'])): ?>
                                        <div style="font-size: 11px; margin-top: 5px;">File saat ini: <a href="uploads/books/<?php echo htmlspecialchars($data_cek['file_buku']); ?>" download style="color:#0066cc; font-weight:600;"><?php echo htmlspecialchars($data_cek['file_buku']); ?></a></div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Footer Buttons -->
                    <div class="box-footer" style="display: flex; gap: 10px; background-color: #ffffff;">
                        <button type="submit" name="Ubah" class="btn btn-success"><i class="fa fa-save"></i> Ubah Data</button>
                        <a href="?page=MyApp/data_buku" class="btn btn-default" style="color: #64748b;"><i class="fa fa-times"></i> Batal</a>
                    </div>
                </div>
            </div>

            <!-- Kolom Kanan: Informasi (Takes 4 cols) -->
            <div class="col-md-4">
                <!-- Informasi Card -->
                <div class="box" style="background-color: rgba(59, 130, 246, 0.03) !important; border: 1px solid rgba(59, 130, 246, 0.1) !important;">
                    <div class="box-header" style="background-color: transparent !important; border-bottom: none !important; padding-bottom: 5px !important;">
                        <h3 class="box-title" style="color: #1e3a8a !important; font-size: 15px !important;"><i class="fa fa-info-circle" style="color: #3b82f6;"></i> Informasi</h3>
                    </div>
                    <div class="box-body" style="padding-top: 5px !important;">
                        <ul class="info-card-list">
                            <li>Fields dengan tanda <span class="required" style="color:#ef4444; font-weight:bold;">*</span> wajib diisi.</li>
                            <li>Pastikan ISBN belum terdaftar.</li>
                            <li>Pastikan berkas PDF buku yang diunggah valid dan terbaca.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>

<!-- Custom quick add scripts and live preview -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 1. Textarea char count
    var descInput = document.getElementById('deskripsi');
    var charCount = document.getElementById('char-count');
    
    // Set initial length
    charCount.textContent = descInput.value.length + ' / 500';
    
    descInput.addEventListener('input', function() {
        var len = descInput.value.length;
        charCount.textContent = len + ' / 500';
    });

    // 3. Quick Add Penulis via AJAX
    $('#btn-add-penulis').click(function() {
        Swal.fire({
            title: 'Tambah Penulis Baru',
            input: 'text',
            inputPlaceholder: 'Masukkan nama penulis...',
            showCancelButton: true,
            confirmButtonText: 'Simpan',
            cancelButtonText: 'Batal',
            inputValidator: (value) => {
                if (!value) {
                    return 'Nama penulis tidak boleh kosong!';
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                $.post('admin/buku/ajax_quick_add.php', { type: 'penulis', name: result.value }, function(data) {
                    if (data.status === 'success') {
                        var newOption = new Option(data.name, data.id, true, true);
                        $('#id_penulis').append(newOption).trigger('change');
                        Swal.fire('Berhasil!', 'Penulis telah ditambahkan.', 'success');
                    } else {
                        Swal.fire('Gagal!', data.message || 'Gagal menambahkan penulis.', 'error');
                    }
                }, 'json');
            }
        });
    });

    // 4. Quick Add Penerbit via AJAX
    $('#btn-add-penerbit').click(function() {
        Swal.fire({
            title: 'Tambah Penerbit Baru',
            input: 'text',
            inputPlaceholder: 'Masukkan nama penerbit...',
            showCancelButton: true,
            confirmButtonText: 'Simpan',
            cancelButtonText: 'Batal',
            inputValidator: (value) => {
                if (!value) {
                    return 'Nama penerbit tidak boleh kosong!';
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                $.post('admin/buku/ajax_quick_add.php', { type: 'penerbit', name: result.value }, function(data) {
                    if (data.status === 'success') {
                        var newOption = new Option(data.name, data.id, true, true);
                        $('#id_penerbit').append(newOption).trigger('change');
                        Swal.fire('Berhasil!', 'Penerbit telah ditambahkan.', 'success');
                    } else {
                        Swal.fire('Gagal!', data.message || 'Gagal menambahkan penerbit.', 'error');
                    }
                }, 'json');
            }
        });
    });
});
</script>
