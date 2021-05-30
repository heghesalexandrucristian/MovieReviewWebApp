<?php
session_start();
require('mysql.php');
if (!isset($_SESSION['loggedin'])) {
    echo("te tog sa te loghezi");
    exit;
}else{
    $id=$_SESSION["id"];
}

echo($id);

$value = $_POST['value'];
$testid=$_POST['testid'];
//echo ($value);
//echo ($testid);


$stmt = $con->prepare('SELECT idfilm,rating FROM ratings_utilizator WHERE idfilm = ? AND idutilizator =?');
$stmt->bind_param('ii', $_POST['testid'],$id);
$stmt->execute();
$stmt->store_result();


if ($stmt->num_rows > 0) {
   if($stmt = $con->prepare('UPDATE ratings_utilizator Set rating=? WHERE idfilm=? AND idutilizator =? '))
   {
    $stmt->bind_param('iii', $_POST['value'], $_POST['testid'],$id);
    $stmt->execute();
    //echo("succes");
   }

}else{
    if($stmt = $con->prepare('INSERT INTO ratings_utilizator (idutilizator,idfilm,rating) VALUES(?,?,?) '))
    {
    $stmt->bind_param('iii', $id,$testid,$value);
    $stmt->execute();
    //echo("succes");
    }

}




?>