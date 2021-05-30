<?php
session_start();
if (!isset($_SESSION['loggedin'])) {
	header('Location: index.php');
	exit;
}
require("mysql.php");
$stmt = $con->prepare('SELECT parola, email,nume,prenume,nrtelefon,rolid FROM utilizatori WHERE id = ?');
$stmt->bind_param('i', $_SESSION['id']);
$stmt->execute();
$stmt->bind_result($password, $email, $nume, $prenume, $nrtelefon, $rolid);
$stmt->fetch();
$stmt->close();
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Profile Page</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
</head>

<body class="loggedin">
	<header>
		<nav class="navtop">
			<div>
				<div id="h1">
					<a onclick="backcandsuntlogat()">
						<h1>Website Title</h1>
					</a>
				</div>
				<a href="profil.php"><i class="fas fa-user-circle"></i>Profile</a>
				<a href="logout.php"><i class="fas fa-sign-out-alt"></i>Logout</a>
			</div>
		</nav>
	</header>
	<div class="content">
		<h2>Profile Page</h2>
		<div>
			<p>Your account details are below:</p>
			<table>
				<tr>
					<td>Username:</td>
					<td><?= $_SESSION['cont'] ?></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><?= '*********' ?></td>
					<td><button class="resetparola">Reset Password</button></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><?= $email ?></td>
				</tr>
				<tr>
					<td>Nume:</td>
					<td><?= $nume ?></td>
				</tr>
				<tr>
					<td>Prenume:</td>
					<td><?= $prenume ?></td>
				<tr>
					<td>Telefon:</td>
					<td><?= $nrtelefon ?></td>
				</tr>
				<tr>
					<td>Rol:</td>
					<td><?= $rolid ?></td>
				</tr>
				</tr>
			</table>
		</div>
	</div>
	<script src="javascript/script.js"></script>
</body>

</html>