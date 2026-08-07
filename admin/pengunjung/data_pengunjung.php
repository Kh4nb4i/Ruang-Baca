<?php
if (isset($_GET['action']) && isset($_GET['id'])) {
    $action = $_GET['action'];
    $id_pengunjung = (int)$_GET['id'];
    
    // Ambil data pengunjung
    $sql_p = $koneksi->query("SELECT * FROM tb_pengunjung WHERE id_pengunjung = $id_pengunjung");
    if ($sql_p->num_rows > 0) {
        $data_p = $sql_p->fetch_assoc();
        $keperluan = $data_p['keperluan'];
        $nama = $data_p['nama'];
        $nim = $data_p['nim']; // NRP
        $angkatan = $data_p['angkatan'];
        $status_sekarang = $data_p['status_konfirmasi'] ?? 'Belum Dikonfirmasi';
        
        if ($status_sekarang === 'Belum Dikonfirmasi') {
            if ($action === 'approve') {
                if (strpos($keperluan, 'Pengumpulan Laporan Project Akhir (PA):') !== false) {
                    $judul = trim(str_replace('Pengumpulan Laporan Project Akhir (PA):', '', $keperluan));
                    
                    // Simpan ke tb_pa
                    $stmt = $koneksi->prepare("INSERT INTO tb_pa (judul, nama_mahasiswa, nim, angkatan, file_laporan) VALUES (?, ?, ?, ?, NULL)");
                    $stmt->bind_param("ssss", $judul, $nama, $nim, $angkatan);
                    $stmt->execute();
                    $stmt->close();
                    
                } elseif (strpos($keperluan, 'Pengumpulan Laporan Magang:') !== false) {
                    $judul = trim(str_replace('Pengumpulan Laporan Magang:', '', $keperluan));
                    
                    // Simpan ke tb_magang
                    $stmt = $koneksi->prepare("INSERT INTO tb_magang (judul, nama_mahasiswa, nim, angkatan, tempat_magang, file_laporan) VALUES (?, ?, ?, ?, '-', NULL)");
                    $stmt->bind_param("ssss", $judul, $nama, $nim, $angkatan);
                    $stmt->execute();
                    $stmt->close();
                }
                
                // Update status di tb_pengunjung
                $koneksi->query("UPDATE tb_pengunjung SET status_konfirmasi = 'Disetujui' WHERE id_pengunjung = $id_pengunjung");
                
                echo "<script>
                Swal.fire({
                    title: 'Berhasil Disetujui',
                    text: 'Laporan telah ditambahkan ke database.',
                    icon: 'success',
                    confirmButtonColor: '#10b981'
                }).then(() => { window.location = 'index.php?page=MyApp/data_pengunjung'; });
                </script>";
                
            } elseif ($action === 'reject') {
                // Update status di tb_pengunjung
                $koneksi->query("UPDATE tb_pengunjung SET status_konfirmasi = 'Ditolak' WHERE id_pengunjung = $id_pengunjung");
                
                echo "<script>
                Swal.fire({
                    title: 'Berhasil Ditolak',
                    text: 'Pengumpulan laporan telah ditolak.',
                    icon: 'success',
                    confirmButtonColor: '#ef4444'
                }).then(() => { window.location = 'index.php?page=MyApp/data_pengunjung'; });
                </script>";
            }
        }
    }
}
?>
<section class="content-header">
    <h1>
        Data Pengunjung Ruang Baca
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li class="active">Data Pengunjung</li>
    </ol>
</section>

<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; width: 100%;">
                <h3 class="box-title" style="margin: 0; line-height: 34px;"><i class="fa fa-users" style="color: #f43f5e;"></i> Riwayat Kunjungan</h3>
                <div style="display: flex; gap: 10px;">
                    <a href="pengunjung.php" target="_blank" class="btn btn-info" style="border-radius: 8px !important; font-weight: 600;">
                        <i class="fa fa-external-link"></i> Halaman Buku Tamu
                    </a>
                    <button class="btn btn-default" onclick="$('#exportPanel').slideToggle();" style="border-radius: 8px !important; font-weight: 600; color: #0066cc; border-color: #0066cc !important; background: transparent;">
                        <i class="fa fa-download"></i> Ekspor Data
                    </button>
                </div>
            </div>
        </div>
        
        <div id="exportPanel" style="display: none; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 15px; margin: 0 15px 15px 15px;">
            <h4 style="margin-top: 0; font-size: 14px; font-weight: bold; color: #0f172a; margin-bottom: 15px;"><i class="fa fa-filter" style="color: #3b82f6;"></i> Filter & Ekspor Laporan Pengunjung</h4>
            <form action="index.php" method="get" target="_blank">
                <input type="hidden" name="page" value="export_data">
                <input type="hidden" name="type" value="pengunjung">
                
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Cari Nama / NRP</label>
                            <input type="text" name="judul" class="form-control input-sm" placeholder="Cari nama atau NRP..." style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Tanggal Mulai</label>
                            <input type="date" name="start" class="form-control input-sm" style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Tanggal Selesai</label>
                            <input type="date" name="end" class="form-control input-sm" style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Format</label>
                            <select name="format" class="form-control input-sm" style="border-radius: 6px;">
                                <option value="pdf">PDF (Print)</option>
                                <option value="excel">Excel</option>
                                <option value="csv">CSV</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group" style="margin-bottom: 0 !important;">
                            <label style="display: block; font-size: 12px; visibility: hidden;">Aksi</label>
                            <button type="submit" class="btn btn-primary btn-sm btn-block" style="border-radius: 6px; font-weight: 600; padding: 7px 10px;">
                                <i class="fa fa-download"></i> Unduh
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="box-body">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th width="50px">No</th>
                            <th>Nama Lengkap</th>
                            <th width="120px">NRP</th>
                            <th width="100px">Angkatan</th>
                            <th>Keperluan</th>
                            <th width="150px">Waktu Kunjungan</th>
                            <th width="160px">Kelola</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $sql = $koneksi->query("SELECT * FROM tb_pengunjung ORDER BY id_pengunjung DESC");
                        while ($data = $sql->fetch_assoc()) {
                        ?>
                            <tr>
                                <td><?php echo $no++; ?></td>
                                <td>
                                    <span style="font-weight: 600; color: #0f172a;"><?php echo htmlspecialchars($data['nama']); ?></span>
                                </td>
                                <td><code><?php echo htmlspecialchars($data['nim']); ?></code></td>
                                <td>
                                    <span class="label label-default" style="font-weight: 600; font-size: 11px; border-radius: 6px; padding: 3px 8px;">
                                        <?php echo htmlspecialchars($data['angkatan']); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo htmlspecialchars($data['keperluan']); ?>
                                    <?php 
                                    $is_laporan = (strpos($data['keperluan'], 'Pengumpulan Laporan Project Akhir (PA):') !== false || strpos($data['keperluan'], 'Pengumpulan Laporan Magang:') !== false);
                                    if ($is_laporan):
                                        $status = $data['status_konfirmasi'] ?? 'Belum Dikonfirmasi';
                                        if ($status === 'Belum Dikonfirmasi'): ?>
                                            <div style="margin-top: 5px;"><span class="label label-warning" style="font-weight:600; font-size:10px;">Belum Dikonfirmasi</span></div>
                                        <?php elseif ($status === 'Disetujui'): ?>
                                            <div style="margin-top: 5px;"><span class="label label-success" style="font-weight:600; font-size:10px;">Disetujui</span></div>
                                        <?php else: ?>
                                            <div style="margin-top: 5px;"><span class="label label-danger" style="font-weight:600; font-size:10px;">Ditolak</span></div>
                                        <?php endif;
                                    endif;
                                    ?>
                                </td>
                                <td>
                                    <span style="font-size: 12px; color: #64748b;">
                                        <i class="fa fa-calendar-check-o"></i> <?php echo date('d-m-Y H:i', strtotime($data['tgl_kunjungan'])); ?> WIB
                                    </span>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 4px; flex-wrap: wrap;">
                                        <?php 
                                        $status = $data['status_konfirmasi'] ?? 'Belum Dikonfirmasi';
                                        if ($is_laporan && $status === 'Belum Dikonfirmasi'): 
                                        ?>
                                            <a href="?page=MyApp/data_pengunjung&action=approve&id=<?php echo $data['id_pengunjung']; ?>" 
                                               onclick="confirmAction(event, this.href, 'Setujui Laporan', 'Apakah Anda yakin ingin menyetujui dan menambahkan laporan ini ke data utama?', 'success', '#10b981', 'Ya, Setujui')" 
                                               title="Setujui" class="btn btn-success btn-xs" style="border-radius: 6px !important; padding: 5px 8px !important; font-weight: 600;">
                                                <i class="fa fa-check"></i> Setujui
                                            </a>
                                            <a href="?page=MyApp/data_pengunjung&action=reject&id=<?php echo $data['id_pengunjung']; ?>" 
                                               onclick="confirmAction(event, this.href, 'Tolak Laporan', 'Apakah Anda yakin ingin menolak pengumpulan laporan ini?', 'warning', '#f43f5e', 'Ya, Tolak')" 
                                               title="Tolak" class="btn btn-warning btn-xs" style="border-radius: 6px !important; padding: 5px 8px !important; font-weight: 600;">
                                                <i class="fa fa-times"></i> Tolak
                                            </a>
                                        <?php endif; ?>
                                        <a href="?page=MyApp/del_pengunjung&kode=<?php echo $data['id_pengunjung']; ?>" 
                                           onclick="confirmAction(event, this.href, 'Hapus Data Pengunjung', 'Apakah Anda yakin ingin menghapus data kunjungan ini?', 'warning', '#ef4444', 'Ya, Hapus')" 
                                           title="Hapus" class="btn btn-danger btn-xs" style="border-radius: 6px !important; padding: 5px 8px !important; font-weight: 600;">
                                            <i class="fa fa-trash"></i> Hapus
                                        </a>
                                    </div>
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
</section>
