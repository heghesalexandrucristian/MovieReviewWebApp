<?php
require("mysql.php");



if (!isset($_POST['username'], $_POST['password'], $_POST['email'])) {
	exit('Please complete the registration form!');
}
if (
	empty($_POST['username']) || empty($_POST['password']) ||
	empty($_POST['nume']) || empty($_POST['prenume'])
) {
	exit('Please complete the registration form');
}

if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
	exit('Email is not valid!');
}

if (preg_match('/^[a-zA-Z0-9]+$/', $_POST['username']) == 0) {
	exit('Username is not valid!');
}

if (preg_match('/^[a-zA-Z]+$/', $_POST['nume']) == 0) {
	exit('Numele nu este valid!');
}

if (preg_match('/^[a-zA-Z]+$/', $_POST['prenume']) == 0) {
	exit('Prenumele nu este valid!');
}

if (strlen($_POST['nrtelefon']) > 10 || strlen($_POST['nrtelefon']) < 10) {
	echo 'Numarul de telefon nu este valid';
	exit(header('Refresh: 5; URL=http://localhost/proiectWEB/index.php'));
}

if (strlen($_POST['password']) > 20 || strlen($_POST['password']) < 5) {
	exit('Password must be between 5 and 20 characters long!');
}

if ($stmt = $con->prepare('SELECT id, parola FROM utilizatori WHERE cont = ?')) {
	$stmt->bind_param('s', $_POST['username']);
	$stmt->execute();
	$stmt->store_result();
	if ($stmt->num_rows > 0) {
		echo 'Username exists, please choose another!';
		exit(header('Refresh: 3; URL=http://localhost/proiectWEB/registration.php'));
	} else {
		if ($stmt = $con->prepare('INSERT INTO utilizatori (cont, parola, email, rolid, inregistratla, nume, prenume, nrtelefon) VALUES (?, ?, ?, ?, ?, ?, ?, ?)')) {
			$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
			$rolid = 1;
			date_default_timezone_set("Europe/Bucharest");
			$_data = date('Y-m-d h:i:sa');
			$stmt->bind_param('sssissss', $_POST['username'], $password, $_POST['email'], $rolid, $_data, $_POST['nume'], $_POST['prenume'], $_POST['nrtelefon']);
			$stmt->execute();

			//
			//
			//
			//nu am reusit in baza de date direct
			///
			//


			$stmt = $con->prepare('SELECT id FROM utilizatori WHERE cont = ?');
			$stmt->bind_param('s', $_POST['username']);
			$stmt->execute();
			$stmt->store_result();
			$ans = 0;
			$stmt->bind_result($ans);
			$stmt->fetch();
			//echo (int) ($ans);



			$stmt = $con->prepare('INSERT INTO date_utilizator (idutilizator,adresa_avatar,nr_comentarii) VALUES (?,?,?)');
			$nrcomentarii = 0;
			$linkavatar = 'https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg';
			$stmt->bind_param('isi', $ans, $linkavatar, $nrcomentarii);
			$stmt->execute();



			echo 'You have successfully registered, you can now login!';
			exit(header('Refresh: 4; URL=http://localhost/proiectWEB/index.php'));
		} else {
			echo 'Could not prepare statement!';
			exit(header('Refresh: 5; URL=http://localhost/proiectWEB/index.php'));
		}
	}
	$stmt->close();
} else {
	echo 'Could not prepare statement!';
	exit(header('Refresh: 5; URL=http://localhost/proiectWEB/index.php'));
}
$con->close();
