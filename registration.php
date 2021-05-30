<?php
session_start();
if (isset($_SESSION['loggedin'])) {
	header('Location: index.php');
	exit;
}
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Register</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body>

	<header>
		<nav class="navtop">
			<div>
				<div id="h1">
					<a onclick=href="index.php">
						<h1>Website Title</h1>
					</a>
				</div>
				<!----<a onclick='logare()'><i class="fas fa-sign-out-alt"></i>Login</a> ---PAGINA DE LOGIN E FACUTA 'DINAMIC'?
                SI CAND INCARC FISIERUL JS IMI INCARCA PRIMA PAGIN DIN CAUZA ELEMENTULUI MAIN---DE REZOLVAT????-->
			</div>
		</nav>
	</header>
	<main id="main2">
		<div class="register">
			<h1>Register</h1>
			<form action="register.php" method="post" autocomplete="off">
				<label for="username">
					<i class="fas fa-user"></i>
				</label>
				<input type="text" name="username" placeholder="Username" id="username" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<label for="email">
					<i class="fas fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="Email" id="email" required>

				<label for="nume">
					<i class="fas fa-signature"></i>
				</label>
				<input type="nume" name="nume" placeholder="Surname" id="nume" required>

				<label for="prenume">
					<i class="fas fa-signature"></i>
				</label>
				<input type="prenume" name="prenume" placeholder="Name" id="prenume" required>

				<label for="NrTelefon">
					<i class="fas fa-phone"></i>
				</label>
				<input type="nrtelefon" name="nrtelefon" placeholder="Telefon" id="telefon" required>



				<input type="submit" value="Register">
			</form>
		</div>
	</main>

	<footer>
		<div class="logoAPI">
			<a href="https://www.themoviedb.org/"><img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg"></a>
		</div>
	</footer>
</body>

</html>