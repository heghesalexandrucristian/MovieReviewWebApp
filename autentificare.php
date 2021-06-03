<?php
error_reporting(0);
session_start();
require("mysql.php");

if (isset($_SESSION['loggedin'])) {
    goto a;
    exit;
}

if (!isset($_POST['username'], $_POST['password'])) {
    exit('Please fill both the username and password fields!');
}

if ($stmt = $con->prepare('SELECT id, parola FROM utilizatori WHERE cont = ?')) {
    $stmt->bind_param('s', $_POST['username']);
    $stmt->execute();
    $stmt->store_result();
    //$stmt->close();
}


if ($stmt->num_rows > 0) {
    $stmt->bind_result($id, $password);
    $stmt->fetch();
    if (password_verify($_POST['password'], $password)) {
        session_regenerate_id();
        $_SESSION['loggedin'] = TRUE;
        $_SESSION['cont'] = $_POST['username'];
        $_SESSION['id'] = $id;
        //echo 'Welcome ' . $_SESSION['cont'] . '!';

        //update data si ora logare
        date_default_timezone_set("Europe/Bucharest");
        $_data = date('Y-m-d h:i:sa');
        $stmt = $con->prepare('UPDATE utilizatori Set ultimalogare=? WHERE ID=? ');
        $stmt->bind_param('si', $_data, $id);
        $stmt->execute();
    } else {
        // Incorrect password
        echo 'Incorrect username and/or password!';
    }
} else {
    // Incorrect username
    echo 'Incorrect username and/or password!';
}

if (!isset($_SESSION['loggedin'])) {
    exit;
}
?>
<?php
a:
?>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>Movie Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/logo4.png" class="icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/9706a1b93e.js" crossorigin="anonymous"></script>
</head>

<body id="body" class="loggedin">


    <header>
        <nav class="navtop">
            <div>
                <div id="h1">
                    <a onclick="backcandsuntlogat()">
                        <h1>Website Title</h1>
                    </a>
                </div>
                <form id="form">
                    <input type="test" placeholder="Search" id="search" class="search">
                </form>
                <a href="profil.php"><i class="fas fa-user-circle"></i>Profile</a>
                <a href="logout.php"><i class="fas fa-sign-out-alt"></i>Logout</a>
            </div>
        </nav>
    </header>


    <main id="main">

    </main>

    <footer>
        <div class="logoAPI">
            <a href="https://www.themoviedb.org/"><img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg"></a>
        </div>
    </footer>
    <script src="javascript/script.js"></script>
</body>

</html>
<script>
    window.history.pushState({
        page: 0
    }, "title 0", "?page=0")
</script>
<?php
if (!isset($_SESSION['loggedin'])) {
    header('Location: dsadsa.php');
    exit;
}
?>

<script>
    window.onpopstate = function(event) {
        //alert(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
        history.go(event);
        // history.go(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
    }
</script>