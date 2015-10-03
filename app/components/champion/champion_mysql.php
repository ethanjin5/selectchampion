<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("../../core/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

$champ_name = $_GET['param'];
$sql = "SELECT name, eng_name, alias FROM champion_list where eng_name = '$champ_name'";
$stmt = $dbh->prepare($sql);
$stmt->execute();

$rs = $stmt->fetchAll( PDO::FETCH_ASSOC );
$outp = json_encode($rs);
echo($outp);
?>