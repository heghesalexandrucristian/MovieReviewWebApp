<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>Movie Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" href="images/logo4.png" class="icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/9706a1b93e.js" crossorigin="anonymous"></script>
</head>

<?php
    session_start();


    if (isset($_SESSION['loggedin'])) {
        require("autentificare.php");
        exit;
    }
    ?>


<body id="body" class="loggedin">


    <header>
        <nav class="navtop">
            <div id="h1">
                <a onclick="backcandsuntlogat()">
                    <h1>Website Title</h1>
                </a>

                <form id="form">
                    <input type="test" placeholder="Search" id="search" class="search">
                </form>
                <a onclick="logare()"><i class="fas fa-sign-in-alt"></i>Login</a>

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