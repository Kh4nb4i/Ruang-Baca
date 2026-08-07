<?php
	$sql = $koneksi->query("SELECT count(id_buku) as buku from tb_buku");
	$buku = 0;
	if ($data = $sql->fetch_assoc()) {
		$buku = $data['buku'];
	}

	$sql = $koneksi->query("SELECT count(id_kategori) as kategori from tb_kategori");
	$kategori = 0;
	if ($data = $sql->fetch_assoc()) {
		$kategori = $data['kategori'];
	}

	$sql = $koneksi->query("SELECT count(id_rak) as rak from tb_rak");
	$rak = 0;
	if ($data = $sql->fetch_assoc()) {
		$rak = $data['rak'];
	}

	$sql = $koneksi->query("SELECT count(id_penulis) as penulis from tb_penulis");
	$penulis = 0;
	if ($data = $sql->fetch_assoc()) {
		$penulis = $data['penulis'];
	}

	$sql = $koneksi->query("SELECT count(id_pa) as pa from tb_pa");
	$pa = 0;
	if ($data = $sql->fetch_assoc()) {
		$pa = $data['pa'];
	}

	$sql = $koneksi->query("SELECT count(id_magang) as magang from tb_magang");
	$magang = 0;
	if ($data = $sql->fetch_assoc()) {
		$magang = $data['magang'];
	}

	$sql = $koneksi->query("SELECT count(id_pengunjung) as pengunjung from tb_pengunjung");
	$pengunjung = 0;
	if ($data = $sql->fetch_assoc()) {
		$pengunjung = $data['pengunjung'];
	}

	$recent_books = $koneksi->query("SELECT tb_buku.*, tb_kategori.nama_kategori 
									 FROM tb_buku 
									 LEFT JOIN tb_kategori ON tb_buku.id_kategori = tb_kategori.id_kategori 
									 ORDER BY tb_buku.id_buku DESC LIMIT 6");

	$recent_pa = $koneksi->query("SELECT * FROM tb_pa ORDER BY id_pa DESC LIMIT 5");
	$recent_magang = $koneksi->query("SELECT * FROM tb_magang ORDER BY id_magang DESC LIMIT 5");
?>

<section class="content-header" style="padding: 15px 15px 0 15px;">
	<h1 style="font-family: 'Plus Jakarta Sans', sans-serif; font-weight: 700; color: #0b192c; font-size: 22px;">
		Dashboard
		<small style="font-size: 14px; color: #64748b; font-weight: 400;">Administrator</small>
	</h1>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box welcome-card box-solid" style="background: linear-gradient(135deg, #0b192c 0%, #1e293b 100%); border-radius: 12px; margin-bottom: 25px; border: none; padding: 25px 30px; color: #ffffff; box-shadow: 0 10px 20px rgba(11,25,44,0.05);">
				<h2 style="margin: 0 0 8px 0; font-weight: 700; font-family: 'Plus Jakarta Sans', sans-serif; font-size: 22px; color: #ffffff;">Selamat Datang Kembali, Administrator!</h2>
				<p style="margin: 0; font-size: 14px; opacity: 0.85; font-weight: 400; line-height: 1.6;">Kelola aktivitas Ruang Baca DSB mulai dari katalog master buku, kategori, rak penyimpanan, penerbit, penulis, laporan proyek akhir (PA), hingga laporan magang dengan sistem yang responsif dan efisien.</p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 col-xs-6">
			<div class="small-box bg-blue" style="background-color: #0066cc !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $buku; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Total Koleksi Buku</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-book" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_buku" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Buku <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box bg-green" style="background-color: #10b981 !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $kategori; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Kategori Buku</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-tags" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_kategori" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Kategori <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box bg-yellow" style="background-color: #f59e0b !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $rak; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Rak Penyimpanan</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-cubes" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_rak" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Rak <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box bg-purple" style="background-color: #8b5cf6 !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $penulis; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Penulis Buku</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-pencil-square-o" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_penulis" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Penulis <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box" style="background-color: #06b6d4 !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $pa; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Laporan Project Akhir (PA)</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-graduation-cap" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_pa" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Laporan PA <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box" style="background-color: #14b8a6 !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $magang; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Laporan Magang</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-briefcase" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_magang" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Laporan Magang <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>

		<div class="col-lg-4 col-xs-6">
			<div class="small-box bg-red" style="background-color: #f43f5e !important; border: none; margin-bottom: 20px; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
				<div class="inner" style="padding: 15px 20px;">
					<h4 style="font-size: 28px; font-weight: 700; color: #ffffff; margin: 0 0 4px 0;"><?= $pengunjung; ?></h4>
					<p style="margin: 0; font-size: 13px; color: rgba(255,255,255,0.9);">Pengunjung Ruang Baca</p>
				</div>
				<div class="icon" style="color: rgba(255,255,255,0.15); top: 10px; right: 15px; transition: all .3s linear;">
					<i class="fa fa-users" style="font-size: 65px;"></i>
				</div>
				<a href="?page=MyApp/data_pengunjung" class="small-box-footer" style="background-color: rgba(0,0,0,0.12) !important; color: #ffffff !important; padding: 6px 0; border-radius: 0 0 12px 12px;">Detail Pengunjung <i class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 10px;">
		<div class="col-md-12">
			<div class="box" style="border: none; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.03); background: #ffffff; padding: 20px; margin-bottom: 20px;">
				<div class="box-header" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
					<div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
						<h3 class="box-title" style="font-size: 16px; font-weight: 700; color: #0b192c; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; float: none; display: flex; align-items: center; gap: 8px;">
							<i class="fa fa-book" style="color: #0066cc;"></i> Buku Baru Ditambahkan
						</h3>
						<a href="?page=MyApp/data_buku" class="btn btn-default" style="padding: 5px 12px !important; border-radius: 6px !important; font-size: 12px !important; font-weight: 600; color: #0066cc; border-color: #0066cc !important; background: transparent; float: none; transition: all 0.15s ease-in-out;">Lihat Semua</a>
					</div>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover" style="margin-bottom: 0; vertical-align: middle;">
						<thead>
							<tr style="color: #64748b; font-weight: 600; font-size: 13px; border-bottom: 1px solid #f1f5f9;">
								<th style="border-bottom: none; font-weight: 600; width: 100px;">Kode Buku</th>
								<th style="border-bottom: none; font-weight: 600;">Judul Buku</th>
								<th style="border-bottom: none; font-weight: 600;">Pengarang</th>
								<th style="border-bottom: none; font-weight: 600;">Penerbit</th>
								<th style="border-bottom: none; font-weight: 600; width: 120px;">Kategori</th>
								<th style="border-bottom: none; font-weight: 600; width: 80px;">Tahun</th>
							</tr>
						</thead>
						<tbody>
							<?php
							if ($recent_books->num_rows > 0) {
								while($book = $recent_books->fetch_assoc()) {
									echo "<tr style='font-size: 13px; color: #334155; border-bottom: 1px solid #f8fafc;'>
										<td style='font-weight: 700; color: #0066cc; vertical-align: middle; padding: 8px;'>".$book['id_buku']."</td>
										<td style='font-weight: 600; color: #1e293b; vertical-align: middle; padding: 8px;'>".$book['judul_buku']."</td>
										<td style='vertical-align: middle; padding: 8px;'>".$book['pengarang']."</td>
										<td style='vertical-align: middle; padding: 8px;'>".$book['penerbit']."</td>
										<td style='vertical-align: middle; padding: 8px;'>
											<span class='label label-primary' style='background-color: rgba(0, 102, 204, 0.08) !important; color: #0066cc !important; border: 1px solid rgba(0, 102, 204, 0.15); padding: 3px 8px; border-radius: 6px; font-weight: 600; font-size: 11px;'>".($book['nama_kategori'] ?? '-')."</span>
										</td>
										<td style='vertical-align: middle; padding: 8px;'>".$book['th_terbit']."</td>
									</tr>";
								}
							} else {
								echo "<tr><td colspan='6' class='text-center' style='color: #94a3b8; padding: 30px 0;'>Belum ada data koleksi buku yang ditambahkan.</td></tr>";
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-6">
			<div class="box" style="border: none; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.03); background: #ffffff; padding: 20px; margin-bottom: 20px;">
				<div class="box-header" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
					<div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
						<h3 class="box-title" style="font-size: 16px; font-weight: 700; color: #0b192c; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; float: none; display: flex; align-items: center; gap: 8px;">
							<i class="fa fa-graduation-cap" style="color: #06b6d4;"></i> Laporan PA Terbaru
						</h3>
						<a href="?page=MyApp/data_pa" class="btn btn-default" style="padding: 5px 12px !important; border-radius: 6px !important; font-size: 12px !important; font-weight: 600; color: #06b6d4; border-color: #06b6d4 !important; background: transparent; float: none; transition: all 0.15s ease-in-out;">Lihat Semua</a>
					</div>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover" style="margin-bottom: 0; vertical-align: middle;">
						<thead>
							<tr style="color: #64748b; font-weight: 600; font-size: 13px; border-bottom: 1px solid #f1f5f9;">
								<th style="border-bottom: none; font-weight: 600; width: 100px;">NRP</th>
								<th style="border-bottom: none; font-weight: 600;">Nama Mahasiswa</th>
								<th style="border-bottom: none; font-weight: 600;">Judul PA</th>
								<th style="border-bottom: none; font-weight: 600; width: 90px;">Angkatan</th>
							</tr>
						</thead>
						<tbody>
							<?php
							if ($recent_pa->num_rows > 0) {
								while($pa_item = $recent_pa->fetch_assoc()) {
									echo "<tr style='font-size: 13px; color: #334155; border-bottom: 1px solid #f8fafc;'>
										<td style='font-weight: 700; color: #06b6d4; vertical-align: middle; padding: 8px;'><code>".htmlspecialchars($pa_item['nim'])."</code></td>
										<td style='font-weight: 600; color: #1e293b; vertical-align: middle; padding: 8px;'>".htmlspecialchars($pa_item['nama_mahasiswa'])."</td>
										<td style='vertical-align: middle; padding: 8px;'>".htmlspecialchars($pa_item['judul'])."</td>
										<td style='vertical-align: middle; padding: 8px;'>".htmlspecialchars($pa_item['angkatan'])."</td>
									</tr>";
								}
							} else {
								echo "<tr><td colspan='4' class='text-center' style='color: #94a3b8; padding: 30px 0;'>Belum ada data laporan PA yang ditambahkan.</td></tr>";
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="box" style="border: none; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.03); background: #ffffff; padding: 20px; margin-bottom: 20px;">
				<div class="box-header" style="border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; margin-bottom: 15px;">
					<div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
						<h3 class="box-title" style="font-size: 16px; font-weight: 700; color: #0b192c; font-family: 'Plus Jakarta Sans', sans-serif; margin: 0; float: none; display: flex; align-items: center; gap: 8px;">
							<i class="fa fa-briefcase" style="color: #14b8a6;"></i> Laporan Magang Terbaru
						</h3>
						<a href="?page=MyApp/data_magang" class="btn btn-default" style="padding: 5px 12px !important; border-radius: 6px !important; font-size: 12px !important; font-weight: 600; color: #14b8a6; border-color: #14b8a6 !important; background: transparent; float: none; transition: all 0.15s ease-in-out;">Lihat Semua</a>
					</div>
				</div>
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover" style="margin-bottom: 0; vertical-align: middle;">
						<thead>
							<tr style="color: #64748b; font-weight: 600; font-size: 13px; border-bottom: 1px solid #f1f5f9;">
								<th style="border-bottom: none; font-weight: 600; width: 100px;">NRP</th>
								<th style="border-bottom: none; font-weight: 600;">Nama Mahasiswa</th>
								<th style="border-bottom: none; font-weight: 600;">Judul Magang / Tempat</th>
								<th style="border-bottom: none; font-weight: 600; width: 90px;">Angkatan</th>
							</tr>
						</thead>
						<tbody>
							<?php
							if ($recent_magang->num_rows > 0) {
								while($magang_item = $recent_magang->fetch_assoc()) {
									echo "<tr style='font-size: 13px; color: #334155; border-bottom: 1px solid #f8fafc;'>
										<td style='font-weight: 700; color: #14b8a6; vertical-align: middle; padding: 8px;'><code>".htmlspecialchars($magang_item['nim'])."</code></td>
										<td style='font-weight: 600; color: #1e293b; vertical-align: middle; padding: 8px;'>".htmlspecialchars($magang_item['nama_mahasiswa'])."</td>
										<td style='vertical-align: middle; padding: 8px;'>
											<strong>".htmlspecialchars($magang_item['judul'])."</strong>
											<div style='font-size: 11px; color: #64748b; margin-top: 2px;'><i class='fa fa-building-o'></i> ".htmlspecialchars($magang_item['tempat_magang'])."</div>
										</td>
										<td style='vertical-align: middle; padding: 8px;'>".htmlspecialchars($magang_item['angkatan'])."</td>
									</tr>";
								}
							} else {
								echo "<tr><td colspan='4' class='text-center' style='color: #94a3b8; padding: 30px 0;'>Belum ada data laporan Magang yang ditambahkan.</td></tr>";
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>