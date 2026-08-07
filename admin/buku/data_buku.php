<section class="content-header">
    <h1>
        Data Buku
    </h1>
    <ol class="breadcrumb">
        <li>
            <a href="index.php?page=admin">
                <i class="fa fa-home"></i>
                <b>Ruang Baca DSB</b>
            </a>
        </li>
        <li class="active">Data Buku</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="box box-primary">
        <div class="box-header with-border" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px; width: 100%;">
                <a href="?page=MyApp/add_buku" title="Tambah Data" class="btn btn-primary" style="border-radius: 8px !important; font-weight: 600;">
                    <i class="fa fa-plus"></i> Tambah Buku
                </a>
                <button class="btn btn-default" onclick="$('#exportPanel').slideToggle();" style="border-radius: 8px !important; font-weight: 600; color: #0066cc; border-color: #0066cc !important; background: transparent;">
                    <i class="fa fa-download"></i> Ekspor Laporan
                </button>
            </div>
        </div>
        
        <!-- Panel Filter Ekspor -->
        <div id="exportPanel" style="display: none; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 15px; margin: 0 15px 15px 15px;">
            <h4 style="margin-top: 0; font-size: 14px; font-weight: bold; color: #0f172a; margin-bottom: 15px;"><i class="fa fa-filter" style="color: #3b82f6;"></i> Filter & Ekspor Laporan</h4>
            <form action="index.php" method="get" target="_blank">
                <input type="hidden" name="page" value="export_data">
                <input type="hidden" name="type" value="buku">
                
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Cari Judul / Kata Kunci</label>
                            <input type="text" name="judul" class="form-control input-sm" placeholder="Masukkan judul..." style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Tahun Mulai</label>
                            <input type="number" name="start" class="form-control input-sm" placeholder="Contoh: 2010" min="1000" max="2100" style="border-radius: 6px;">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-bottom: 10px !important;">
                            <label style="font-size: 12px; color: #475569;">Tahun Selesai</label>
                            <input type="number" name="end" class="form-control input-sm" placeholder="Contoh: 2025" min="1000" max="2100" style="border-radius: 6px;">
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
        <!-- /.box-header -->
        <div class="box-body">
            <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th width="50px">No</th>
                            <th width="100px">ID / ISBN</th>
                            <th>Judul Buku</th>
                            <th>Pengarang / Penerbit</th>
                            <th width="80px">Tahun</th>
                            <th>Rak / Kategori</th>
                            <th width="80px">Eksemplar</th>
                            <th width="120px">Kelola</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $sql = $koneksi->query("
                            SELECT b.*, r.nama_rak, k.nama_kategori 
                            FROM tb_buku b 
                            LEFT JOIN tb_rak r ON b.id_rak = r.id_rak 
                            LEFT JOIN tb_kategori k ON b.id_kategori = k.id_kategori
                            ORDER BY b.id_buku DESC
                        ");
                        while ($data = $sql->fetch_assoc()) {
                        ?>
                            <tr>
                                <td><?php echo $no++; ?></td>
                                <td>
                                    <strong><?php echo $data['id_buku']; ?></strong>
                                    <?php if (!empty($data['isbn'])): ?>
                                        <div style="font-size: 11px; color: #64748b; margin-top: 4px;"><?php echo $data['isbn']; ?></div>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <span style="font-weight: 600; color: #0f172a;"><?php echo htmlspecialchars($data['judul_buku']); ?></span>
                                    <?php if (!empty($data['no_klasifikasi'])): ?>
                                        <div style="font-size: 11px; color: #64748b; margin-top: 4px;">Klasifikasi: <?php echo htmlspecialchars($data['no_klasifikasi']); ?></div>
                                    <?php endif; ?>
                                </td>
                                <td>
                                    <div><i class="fa fa-user-o" style="width: 14px;"></i> <?php echo htmlspecialchars($data['pengarang']); ?></div>
                                    <div style="font-size: 12px; color: #64748b; margin-top: 2px;"><i class="fa fa-building-o" style="width: 14px;"></i> <?php echo htmlspecialchars($data['penerbit']); ?></div>
                                </td>
                                <td><?php echo $data['th_terbit']; ?></td>
                                <td>
                                    <div><span class="label label-primary" style="background-color: #3b82f6 !important; font-weight: 500; font-size: 11px;"><?php echo htmlspecialchars($data['nama_rak'] ?? '-'); ?></span></div>
                                    <div style="margin-top: 5px;"><span class="label label-info" style="background-color: #06b6d4 !important; font-weight: 500; font-size: 11px;"><?php echo htmlspecialchars($data['nama_kategori'] ?? '-'); ?></span></div>
                                </td>
                                <td>
                                    <span style="font-weight: 600;"><?php echo $data['jumlah_eksemplar']; ?></span>
                                </td>
                                <td>
                                    <a href="?page=MyApp/edit_buku&kode=<?php echo $data['id_buku']; ?>" title="Ubah" class="btn btn-success btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important;">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="?page=MyApp/del_buku&kode=<?php echo $data['id_buku']; ?>" onclick="confirmAction(event, this.href, 'Hapus Buku', 'Apakah Anda yakin ingin menghapus buku ini?', 'warning', '#ef4444', 'Ya, Hapus')" title="Hapus" class="btn btn-danger btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important;">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                    <?php if (!empty($data['file_buku']) && file_exists('uploads/books/' . $data['file_buku'])): ?>
                                        <a href="uploads/books/<?php echo htmlspecialchars($data['file_buku']); ?>" download title="Unduh PDF" class="btn btn-info btn-xs" style="border-radius: 6px !important; padding: 5px 10px !important;">
                                            <i class="fa fa-download"></i>
                                        </a>
                                    <?php endif; ?>
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