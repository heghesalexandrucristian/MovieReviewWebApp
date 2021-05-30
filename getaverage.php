<?php
require("mysql.php");

$idfilmului=$_POST['value'];

$stmt = $con->prepare('SELECT AVG(rating) FROM ratings_utilizator WHERE idfilm = ? ');
    $stmt->bind_param('i', $idfilmului);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($rating);
        $stmt->fetch();
        $rating=+$rating;
        echo json_encode($rating);
        
    }

?>