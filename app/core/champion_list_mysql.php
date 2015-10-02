<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$db_name  = 'championcounter';
$hostname = 'localhost';
$username = 'root';
$password = 'mysql';

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

$sql = "SELECT name, eng_name, alias FROM champion_list";\
$stmt = $dbh->prepare($sql);
$stmt->execute();

$rs = $stmt->fetchAll( PDO::FETCH_ASSOC );
$outp = json_encode($rs);
echo($outp);
?>