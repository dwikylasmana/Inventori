<?php session_start();
include_once("../config.php");
$result = mysqli_query($koneksi, "SELECT * FROM barang_keluar ORDER BY kode_barang DESC");

if( !isset($_SESSION['user']) )
{
	header('location:./../'.$_SESSION['akses']);
	exit();
}else{
	$nama = $_SESSION['user'];
}
?>


<!DOCTYPE html>
<html>
<head>
	<title>Dashboard</title>
	<link rel="shortcut icon" href="../images/icon.ico">
	<!--Import Google Icon Font-->
    <link href="../fonts/material.css" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style type="text/css">
	       /* label color */
	       .e-input-field label {
	         color: #000;
	       }
	       /* label focus color */
	       .e-input-field input[type=text]:focus + label,.e-input-field input[type=password]:focus + label {
	         color: #d32f2f !important;
	       }
	       /* label underline focus color */
	       .e-input-field input[type=text]:focus,.e-input-field input[type=password]:focus {
	         border-bottom: 1px solid #d32f2f !important;
	         box-shadow: 0 1px 0 0 #d32f2f !important;
	       }
	       /* valid color */
	       .e-input-field input[type=text].valid,.e-input-field input[type=password].valid {
	         border-bottom: 1px solid #d32f2f !important;
	         box-shadow: 0 1px 0 0 #d32f2f !important;
	       }
	       /* invalid color */
	       .e-input-field input[type=text].invalid,.e-input-field input[type=password].invalid {
	         border-bottom: 1px solid #d32f2f !important;
	         box-shadow: 0 1px 0 0 #d32f2f !important;
	       }
	       /* icon prefix focus color */
	       .e-input-field .prefix.active {
	         color: #d32f2f !important;
	       }
	    </style>
</head>
<body>
	<div class="row">
		<!--header-->
		<header>
			<!--TopNav-->
	        <nav class="row top-nav red darken-2">
	    		<div class="container">
	    			<div class="col offset-l2 nav-wrapper">
	    				<a href="#" data-activates="slide-out" class="button-collapse top-nav full hide-on-large-only"><i class="material-icons">menu</i></a>
	    				<a class="page-title">Contact</a>
	    			</div>
	    		</div>
			</nav>

			<!--Sidenav-->
			<ul id="slide-out" class="side-nav fixed">
	            
	            <li class="no-padding">
		            <ul class="collapsible collapsible-accordion">
		                <li>
		                	<div class="user-view">
		                    	<div class="background" style="margin-bottom:-15%;">
		                    		<img src="../images/bg.jpg">
		                    	</div>
		                		<span class="white-text name"><?php echo $nama; ?><i class="material-icons left">account_circle</i></span>
		                	</div>
		                </li>
		                
		                <li><div class="divider" style="margin-top:15%;"></div></li>

		                <li><a href="index.php" class="collapsible-header">Beranda<i class="material-icons">home</i></a></li>

		                <li>
		                	<a class="collapsible-header">Menu<i class="material-icons">arrow_drop_down</i></a>
		                	<div class="collapsible-body">
		                		<ul>
		                			<li><a href="user.php">User</a></li>
									<li><a href="barangmasuk.php">Barang Masuk</a></li>
									<li><a href="gudang.php">Gudang</a></li>
									<li><a href="barangkeluar.php">Barang Keluar</a></li>
									<li><a href="gabung.php">Hasil Pengiriman</a></li>
								</ul>
							</div>
		                </li>
		                <li><a class="collapsible-header active red">Teams<i class="material-icons">contacts</i></a></li>

		                <li><a href="../logout.php" class="collapsible-header">Keluar<i class="material-icons">exit_to_app</i></a></li>

		            </ul>
	            </li>

	        </ul>
		</header>
		<!--end of header-->

		<!--content-->
		<main>
			<div class="row container"> <br><br>

					<div class="col s12 m12 offset-l2 l12 ">
						<center><h4>TEAMS</h4></center>
				    	<div class="card-panel lighten-5 z-depth-2">
				        <div class="row valign-wrapper">
				            <div class="col s2">
				              <img src="../images/dp1.png" alt="Ilham" class="circle responsive-img"> 
				            </div>
				            <div class="col s12">
				              <span class="black-text">
				                M. Ilham Saputra (065118090)
				              </span>
				            </div>

				            <div class="col s2">
				              <img src="../images/dp2.png" alt="Dwiky" class="circle responsive-img"> 
				            </div>
				            <div class="col s12">
				              <span class="black-text">
				                Dwiky Meidy Lasmana (065118085)
				              </span>
				            </div>
		   				</div>
						</div>
						<div class="card-panel lighten-5 z-depth-2">
						<div class="row valign-wrapper">
						<div class="col s3">
				              <img src="../images/dp3.png" alt="Roni" class="circle responsive-img"> 
				            </div>
				            <div class="col s12">
				              <span class="black-text">
				                Wahyu Imam Muhroni (065118063)
				              </span>
				            </div>

							<div class="col s3">
				              <img src="../images/dp4.png" alt="Hendrizal" class="circle responsive-img"> 
				            </div>
				            <div class="col s12">
				              <span class="black-text">
				                Hendrizal (065118080)
				              </span>
				            </div>
						<div class="col s3">
				              <img src="../images/dp5.png" alt="Rasil" class="circle responsive-img"> 
				            </div>
				            <div class="col s12">
				              <span class="black-text">
				                M. Fathan Rasil (065118081)
				              </span>
				            </div>
						</div>
						</div>


				    </div>

				<div class="col s12 m12 l12 offset-l2"> <br> <br><br>

					
					<!-- Tabs -->
					<center><h4>Butuh Bantuan ?</h4></center><br>
					<div class="row">
					    <div class="col s12 ">
					      	<ul class="tabs">
					        	<li class="tab col s3"><a class="active" href="#test1">Whatsapp</a></li>
					      	</ul>
					      	<br>
					    </div>
					    
						<div id="test1" class="col s10 offset-l1 ">

					    	<!-- Content -->
				        <div class="card-panel lighten-5 z-depth-1">
				          	<div class="row valign-wrapper">
				            	<div class="col s2">
				              		<img src="../images/dp1.png" alt="Ilham" class="circle responsive-img"> 
				            	</div>
				            	<div class="col s12">
				              		<span class="black-text">
							  			0858-9489-8255
				              		</span>
				            	</div>

				            	<div class="col s2">
				              		<img src="../images/dp2.png" alt="Dwiky" class="circle responsive-img"> 
				           	 	</div>
				            	<div class="col s12">
				              		<span class="black-text">
									  	0838-1919-2260
				              		</span>
				            	</div>
							</div>
				      		</div>
							<div class="card-panel lighten-5 z-depth-1">
				          	<div class="row valign-wrapper">
							  <div class="col s3">
				              		<img src="../images/dp3.png" alt="Roni" class="circle responsive-img"> 
				            	</div>
				            	<div class="col s12">
				              		<span class="black-text">
									  	0811-8808-189
				              		</span>
				            	</div>

				            	<div class="col s3">
				              		<img src="../images/dp4.png" alt="Hendrizal" class="circle responsive-img"> 
				           	 	</div>
				            	<div class="col s12">
				              		<span class="black-text">
									  	0896-6865-2403
				              		</span>
				            	</div>
							  <div class="col s3">
				              		<img src="../images/dp5.png" alt="Rasil" class="circle responsive-img"> 
				            	</div>
				            	<div class="col s12">
				              		<span class="black-text">
									  	0822-4685-3902
				              		</span>
				            	</div>
							</div>
							</div>
					</div>
  					</div>
					<!-- End Of Tabs -->
				</div>
			</div>
		</main>
        <!--end of content-->


	</div>

	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../js/materialize.min.js"></script>
	<script type="text/javascript">
	  	$(document).ready(function(){
	    	$('.collapsible').collapsible();
	    	$(".button-collapse").sideNav();
		});
	</script>
</body>
</html>