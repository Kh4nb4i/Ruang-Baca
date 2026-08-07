<section class="content-header">
    <h1>
        Laporan Project Akhir (PA)
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li class="active">Laporan PA</li>
    </ol>
</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; width: 100%;">
                <a href="?page=MyApp/add_pa" title="Tambah Laporan PA" class="btn btn-primary" style="border-radius: 8px !important; font-weight: 600;">
                    <i class="fa fa-plus"></i> Tambah Laporan PA
                </a>
                <button class="btn btn-default" onclick="$('#exportPanel').slideToggle();" style="border-radius: 8px !important; font-weight: 600; color: #0066cc; border-color: #0066cc !important; background: transparent;">
                    <i class="fa fa-download"></i> Ekspor Laporan
                </button>
            </div>
        </div>
        
        <div id="exportPanel" style="display: none; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 15px; margin: 0 15px 15px 15px;">
            <h4 style="margin-top: 0; font-size: 14px; font-weight: bold; color: #0f172a; margin-bottom: 15px;"><i class="fa fa-filter" style="color: #3b82f6;"></i> Filter & Ekspor Laporan PA</h4>
            <form action="index.php" method="get" target="_blank">
                <input type="hidden" name="page" value="export_data">
                <input type="hidden" name="type" value="pa">
                
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Cari Judul / Kata Kunci</label>
                            <input type="text" name="judul" class="form-control input-sm" placeholder="Masukkan judul..." style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Angkatan Mulai</label>
                            <input type="text" name="start" class="form-control input-sm" placeholder="Contoh: 2020" style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Angkatan Selesai</label>
                            <input type="text" name="end" class="form-control input-sm" placeholder="Contoh: 2024" style="border-radius: 6px;">
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
                    <div class="col-md-2">
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
                            <th>Judul PA</th>
                            <th>Nama Mahasiswa</th>
                            <th width="120px">NRP</th>
                            <th width="100px">Angkatan</th>
                            <th width="150px">Berkas</th>
                            <th width="120px">Kelola</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $sql = $koneksi->query("SELECT * FROM tb_pa ORDER BY id_pa DESC");
                        while ($data = $sql->fetch_assoc()) {
                        ?>
                            <tr>
                                <td><?php echo $no++; ?></td>
                                <td>
                                    <span style="font-weight: 600; color: #0f172a;"><?php echo htmlspecialchars($data['judul']); ?></span>
                                </td>
                                <td><?php echo htmlspecialchars($data['nama_mahasiswa']); ?></td>
                                <td><code><?php echo htmlspecialchars($data['nim']); ?></code></td>
                                <td><?php echo htmlspecialchars($data['angkatan']); ?></td>
                                <td>
                                    <?php if (!empty($data['file_laporan']) && file_exists('uploads/pa/' . $data['file_laporan'])): ?>
                                        <a href="uploads/pa/<?php echo htmlspecialchars($data['file_laporan']); ?>" download class="btn btn-info btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important; font-weight: 600;">
                                            <i class="fa fa-download"></i> Unduh PDF
                                        </a>
                                    <?php else: ?>
                                        <span class="text-muted" style="font-size: 12px;">Tidak ada file</span>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <a href="?page=MyApp/edit_pa&kode=<?php echo $data['id_pa']; ?>" title="Ubah" class="btn btn-success btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="?page=MyApp/del_pa&kode=<?php echo $data['id_pa']; ?>" onclick="confirmAction(event, this.href, 'Hapus Laporan PA', 'Apakah Anda yakin ingin menghapus laporan PA ini?', 'warning', '#ef4444', 'Ya, Hapus')" title="Hapus" class="btn btn-danger btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important;">
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
</section>
