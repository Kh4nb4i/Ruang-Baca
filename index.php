<?php
header("X-Frame-Options: DENY");
header("X-Content-Type-Options: nosniff");
header("X-XSS-Protection: 1; mode=block");

// Jika mengakses halaman root tanpa parameter 'page', selalu arahkan ke halaman tamu pengunjung.php
if (!isset($_GET['page'])) {
	header("location: pengunjung.php");
	exit;
}

session_start();
if (isset($_SESSION["ses_username"]) == "") {
	header("location: pengunjung.php");
	exit;
} else {
	$data_id = $_SESSION["ses_id"];
	$data_nama = $_SESSION["ses_nama"];
	$data_user = $_SESSION["ses_username"];
	$data_level = $_SESSION["ses_level"];
}

//KONEKSI DB
include "inc/koneksi.php";

if (isset($_GET['page'])) {
	if ($_GET['page'] == 'export_data') {
		include "admin/export/export_data.php";
		exit;
	}
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>RUANG BACA DSB</title>
	<link rel="icon" href="dist/img/logo.png?v=2">
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
	<!-- Select2 -->
	<link rel="stylesheet" href="plugins/select2/select2.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
	<!-- Custom Admin Modern Redesign -->
	<link rel="stylesheet" href="assets/css/custom-admin.css?v=10">

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<body class="hold-transition skin-green sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="index.php?page=admin" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini">
					<img src="dist/img/logo.png" style="width: 30px; height: 30px; object-fit: contain; display: inline-block; vertical-align: middle;">
				</span>
				<!-- logo for regular state and mobile devices -->
				<span class="logo-lg">
					<img src="dist/img/logo.png" style="width: 28px; height: 28px; object-fit: contain; display: inline-block; vertical-align: middle; margin-right: 6px; margin-top: -3px;">
					<b>Ruang Baca DSB</b>
				</span>
			</a>
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="dist/img/avatar.png" class="user-image" alt="User Image" style="margin-top: -2px; border-radius: 50%;">
								<span class="hidden-xs"><?php echo $data_nama; ?></span>
							</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header" style="background-color: #0b192c; color: white; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 15px;">
									<img src="dist/img/avatar.png" class="img-circle" alt="User Image" style="border: 2px solid #3b82f6;">
									<p style="margin-top: 10px;">
										<?php echo $data_nama; ?>
										<small style="display: block; font-size: 11px; opacity: 0.8; margin-top: 5px;"><?php echo $data_level; ?></small>
									</p>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-right">
										<a href="logout.php" onclick="confirmLogout(event)" class="btn btn-default btn-flat" style="padding: 6px 12px !important; border-radius: 4px !important;">Sign out</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>

		<!-- =============================================== -->

		<!-- Left side column. contains the sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->

				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/avatar.png" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
							<?php echo $data_nama; ?>
						</p>
						<span class="label label-warning">
							<?php echo $data_level; ?>
						</span>
					</div>
				</div>

				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<?php
					$page = isset($_GET['page']) ? $_GET['page'] : '';
					if ($data_level == "Administrator") {
					?>
						<!-- Dashboard -->
						<li class="<?php echo ($page == 'admin' || $page == '') ? 'active' : ''; ?>">
							<a href="?page=admin">
								<i class="fa fa-dashboard"></i>
								<span>Dashboard</span>
							</a>
						</li>

						<!-- DATA MASTER -->
						<li class="header">DATA MASTER</li>
						
						<li class="<?php echo ($page == 'MyApp/data_buku' || $page == 'MyApp/add_buku' || $page == 'MyApp/edit_buku') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_buku">
								<i class="fa fa-book"></i>
								<span>Buku</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_kategori') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_kategori">
								<i class="fa fa-tags"></i>
								<span>Kategori</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_rak') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_rak">
								<i class="fa fa-cubes"></i>
								<span>Rak</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_penerbit') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_penerbit">
								<i class="fa fa-building-o"></i>
								<span>Penerbit</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_penulis') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_penulis">
								<i class="fa fa-pencil-square-o"></i>
								<span>Penulis</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_pa' || $page == 'MyApp/add_pa' || $page == 'MyApp/edit_pa') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_pa">
								<i class="fa fa-graduation-cap"></i>
								<span>Laporan PA</span>
							</a>
						</li>
						
						<li class="<?php echo ($page == 'MyApp/data_magang' || $page == 'MyApp/add_magang' || $page == 'MyApp/edit_magang') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_magang">
								<i class="fa fa-briefcase"></i>
								<span>Laporan Magang</span>
							</a>
						</li>

						<li class="header">LOG AKTIVITAS</li>
						
						<li class="<?php echo ($page == 'MyApp/data_pengunjung') ? 'active' : ''; ?>">
							<a href="?page=MyApp/data_pengunjung">
								<i class="fa fa-users"></i>
								<span>Pengunjung</span>
							</a>
						</li>
						
						<li>
							<a href="pengunjung.php" target="_blank">
								<i class="fa fa-external-link"></i>
								<span>Buka Buku Tamu</span>
							</a>
						</li>
					<?php
					}
					?>

					<li>
						<a href="logout.php" onclick="confirmLogout(event)">
							<i class="fa fa-sign-out"></i>
							<span>Logout</span>
						</a>
					</li>


			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- =============================================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Main content -->
			<section class="content">
				<?php
				if (isset($_GET['page'])) {
					$hal = $_GET['page'];

					// Proteksi Akses Berdasarkan Level Pengguna (Access Control Security)
					$admin_only_pages = [
						'admin',
						'MyApp/data_kategori',
						'MyApp/data_rak',
						'MyApp/data_penerbit',
						'MyApp/data_penulis',
						'MyApp/data_pa',
						'MyApp/add_pa',
						'MyApp/edit_pa',
						'MyApp/del_pa',
						'MyApp/data_magang',
						'MyApp/add_magang',
						'MyApp/edit_magang',
						'MyApp/del_magang',
						'MyApp/data_pengunjung',
						'MyApp/del_pengunjung'
					];

					if (in_array($hal, $admin_only_pages) && $data_level != 'Administrator') {
						echo "<script>
						Swal.fire({
							title: 'Akses Ditolak!',
							text: 'Anda tidak memiliki wewenang untuk mengakses halaman ini.',
							icon: 'error',
							confirmButtonColor: '#0066cc',
							confirmButtonText: 'OK'
						}).then((result) => {
							if (result.value) {
								window.location = 'index.php?page=admin';
							}
						});
						</script>";
						echo "<noscript><meta http-equiv='refresh' content='0;url=index.php?page=admin'></noscript>";
						exit;
					}

					switch ($hal) {
							//Klik Halaman Home Pengguna
						case 'admin':
							include "home/admin.php";
							break;



							//buku
						case 'MyApp/data_kategori':
						case 'MyApp/data_rak':
						case 'MyApp/data_penerbit':
						case 'MyApp/data_penulis':
							include "admin/helper_master.php";
							break;

						case 'MyApp/data_buku':
							include "admin/buku/data_buku.php";
							break;
						case 'MyApp/add_buku':
							include "admin/buku/add_buku.php";
							break;
						case 'MyApp/edit_buku':
							include "admin/buku/edit_buku.php";
							break;
						case 'MyApp/del_buku':
							include "admin/buku/del_buku.php";
							break;

							// PA (Project Akhir)
						case 'MyApp/data_pa':
							include "admin/pa/data_pa.php";
							break;
						case 'MyApp/add_pa':
							include "admin/pa/add_pa.php";
							break;
						case 'MyApp/edit_pa':
							include "admin/pa/edit_pa.php";
							break;
						case 'MyApp/del_pa':
							include "admin/pa/del_pa.php";
							break;

							// Magang
						case 'MyApp/data_magang':
							include "admin/magang/data_magang.php";
							break;
						case 'MyApp/add_magang':
							include "admin/magang/add_magang.php";
							break;
						case 'MyApp/edit_magang':
							include "admin/magang/edit_magang.php";
							break;
						case 'MyApp/del_magang':
							include "admin/magang/del_magang.php";
							break;

						case 'MyApp/data_pengunjung':
							include "admin/pengunjung/data_pengunjung.php";
							break;
						case 'MyApp/del_pengunjung':
							include "admin/pengunjung/del_pengunjung.php";
							break;




							//default
						default:
							echo "<center><br><br><br><br><br><br><br><br><br>
				  <h1> Halaman tidak ditemukan !</h1></center>";
							break;
					}
				} else {
					// Auto Halaman Home Pengguna
					include "home/admin.php";
				}
				?>



			</section>
			<!-- /.content -->
		</div>

		<!-- /.content-wrapper -->

		<!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
			 
		<!--Bootstrap 3.3.6 -->
			
		<script src = "bootstrap/js/bootstrap.min.js"></script>
		

		<script src="plugins/select2/select2.full.min.js"></script>
		<!-- DataTables -->
		<script src="plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

		<!-- AdminLTE App -->
		<script src="dist/js/app.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="dist/js/demo.js"></script>
		<!-- page script -->


		<script>
			$(function() {
				$("#example1").DataTable({
					columnDefs: [{
						"defaultContent": "-",
						"targets": "_all"
					}]
				});
				$('#example2').DataTable({
					"paging": true,
					"lengthChange": false,
					"searching": false,
					"ordering": true,
					"info": true,
					"autoWidth": false
				});
			});
		</script>

		<script>
			$(function() {
				//Initialize Select2 Elements
				$(".select2").select2();
			});

			function confirmLogout(event) {
				event.preventDefault();
				Swal.fire({
					title: 'Konfirmasi Keluar',
					text: 'Apakah Anda yakin ingin keluar dari sistem Ruang Baca DSB?',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#0066cc',
					cancelButtonColor: '#64748b',
					confirmButtonText: 'Ya, Keluar',
					cancelButtonText: 'Batal',
					reverseButtons: true
				}).then((result) => {
					if (result.value) {
						window.location.href = 'logout.php';
					}
				});
			}

			function confirmAction(event, href, title, text, icon, confirmColor, confirmText) {
				event.preventDefault();
				Swal.fire({
					title: title || 'Konfirmasi Tindakan',
					text: text || 'Apakah Anda yakin?',
					icon: icon || 'question',
					showCancelButton: true,
					confirmButtonColor: confirmColor || '#0066cc',
					cancelButtonColor: '#64748b',
					confirmButtonText: confirmText || 'Ya, Lanjutkan',
					cancelButtonText: 'Batal',
					reverseButtons: true
				}).then((result) => {
					if (result.value) {
						window.location.href = href;
					}
				});
			}
		</script>
</body>

</html>
