<?php
session_start();
require('mysql.php');
if (!isset($_SESSION['loggedin'])) {
    exit(0);
}else{
    $idfilmului=$_POST['value'];
    $id=$_SESSION["id"];
    $test=$id;
   // echo json_encode($test);

    $stmt = $con->prepare('SELECT idfilm,rating FROM ratings_utilizator WHERE idfilm = ? AND idutilizator =?');
    $stmt->bind_param('ii', $idfilmului,$id);
    $stmt->execute();
    $stmt->store_result();


    if ($stmt->num_rows > 0) {
        $stmt->bind_result($idfilm, $rating);
        $stmt->fetch();
        
        echo json_encode($rating);
        
    }
}
?>
