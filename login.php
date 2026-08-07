<?php
header("X-Frame-Options: DENY");
header("X-Content-Type-Options: nosniff");
header("X-XSS-Protection: 1; mode=block");

include "inc/koneksi.php";
?>


<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login | Ruang Baca DSB</title>
	<link rel="icon" href="dist/img/logo.png?v=2">
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<!-- Custom Admin Modern Redesign -->
	<link rel="stylesheet" href="assets/css/custom-admin.css?v=6">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-box-body">
			<center>
				<img src="dist/img/logo.png" style="width: 80px; height: 80px; object-fit: contain; margin-bottom: 15px;" />
			</center>
			<div class="login-logo" style="margin-bottom: 25px;">
				<h3 style="font-weight: 700; margin: 0; font-size: 22px; text-align: center; font-family: 'Plus Jakarta Sans', sans-serif;">
					<span style="color: #0b192c;">Ruang Baca</span><span style="color: #0066cc;"> DSB</span>
				</h3>
				<p style="font-size: 13px; color: #64748b; margin-top: 6px; text-align: center;">Sistem Informasi Ruang Baca DSB</p>
			</div>
			
			<form action="#" method="post">
				<div class="form-group has-feedback">
					<label style="font-size: 12px; font-weight: 600; color: #475569; margin-bottom: 6px;">Username</label>
					<div class="input-group" style="width: 100%;">
						<input type="text" class="form-control" name="username" placeholder="Masukkan username Anda" required autocomplete="off" style="border-radius: 8px !important;">
					</div>
				</div>
				<div class="form-group has-feedback" style="margin-top: 15px;">
					<label style="font-size: 12px; font-weight: 600; color: #475569; margin-bottom: 6px;">Password</label>
					<div class="input-group" style="width: 100%;">
						<input type="password" class="form-control" name="password" placeholder="Masukkan password Anda" required style="border-radius: 8px !important;">
					</div>
				</div>
				<div style="margin-top: 25px; margin-bottom: 10px;">
					<button type="submit" class="btn btn-primary btn-block" name="btnLogin" title="Masuk Sistem" style="background-color: #0066cc; border-color: #0066cc; border-radius: 8px !important; height: 44px; font-weight: 600; font-size: 14px; display: flex; align-items: center; justify-content: center; width: 100%;">
						<i class="fa fa-sign-in" style="margin-right: 5px;"></i> Masuk
					</button>
				</div>
			</form>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- sweet alert -->
</body>

</html>


<?php 
include "inc/koneksi.php";

		if (isset($_POST['btnLogin'])) {  
		
		

			$username=mysqli_real_escape_string($koneksi,$_POST['username']);
			$password=mysqli_real_escape_string($koneksi,md5($_POST['password']));


		$sql_login = "SELECT * FROM tb_pengguna WHERE BINARY username='$username' AND password= '$password'";
		$query_login = mysqli_query($koneksi, $sql_login);
		$data_login = mysqli_fetch_array($query_login,MYSQLI_BOTH);
		$jumlah_login = mysqli_num_rows($query_login);
        

            if ($jumlah_login == 1 ){
              session_start();
              $_SESSION["ses_id"]=$data_login["id_pengguna"];
              $_SESSION["ses_nama"]=$data_login["nama_pengguna"];
              $_SESSION["ses_username"]=$data_login["username"];
              $_SESSION["ses_password"]=$data_login["password"];
              $_SESSION["ses_level"]="Administrator";
                
              echo "<script>
                    Swal.fire({title: 'Login Berhasil',
						text: '',
						icon: 'success',
						confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.value) {
                            window.location = 'index.php?page=admin';
                        }
                    })</script>";
              }else{
              echo "<script>
                    Swal.fire({title: 'Login Gagal',
						text: '',
						icon: 'error',
						confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.value) {
                            window.location = 'login.php';
                        }
                    })</script>";
                }
			  }
