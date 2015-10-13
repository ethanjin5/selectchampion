<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

if (isset($_POST['submit'])) { 
    $id = $_POST['counter_id'];
    $name = $_POST['name'];
    //$email = $_POST['email'];
    $tip = $_POST['tip'];
    
    
    $dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
    $dbh->query('set names utf8;');

    $sql = "INSERT INTO counter_tips (counter_id,tip,author)VALUES($id, '$tip','$name')";
    $stmt = $dbh->prepare($sql);
    $stmt->execute();

    if($stmt) {
        echo "<script>alert('Tip was submitted !');</script>";
        echo "";
    }
    else {
        echo "<script>alert('Tip was not submitted. Please try again later');</script>";
    }
}


?>