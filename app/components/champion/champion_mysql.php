<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

$champ_name = $_GET['param'];
$sql = "SELECT id, name, eng_name, alias, description, tags FROM champion_list where eng_name = '$champ_name'";
$stmt = $dbh->prepare($sql);
$stmt->execute();

$rs = $stmt->fetch( PDO::FETCH_ASSOC );
$champ_id = $rs['id'];

$sql = "SELECT champion_two, upvote, downvote FROM counter where id = $champ_id";
$stmt = $dbh->prepare($sql);
$stmt->execute();
$rcounter = $stmt->fetchAll(PDO::FETCH_ASSOC);
$outp = '{"champion":'.json_encode($rs).',"counter":'.json_encode($rcounter).'}';
echo($outp);
?>