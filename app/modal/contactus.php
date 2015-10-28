<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');
$data = json_decode(file_get_contents("php://input"));
$name = $data->name;
$email = $data->email;
$feedback = $data->feedback;
$sql = "INSERT INTO feedback (name,email,feedback)VALUES('$name','$email','$feedback')";
$stmt = $dbh->prepare($sql);
$stmt->execute();
?>