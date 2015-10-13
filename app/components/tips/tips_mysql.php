<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

switch($_GET['action']){
    case 'getTips':
        $outp = getTips();
        echo($outp);
        break;
    case 'upvote':
        upvote();
        break;
    case 'downvote':
        downvote();
        break;
    case 'submitTips':
        submitTip();
        break;
}

function getTips(){
    global $dbh;
    $counter_id = $_GET['param'];
    $sql = "SELECT id, tip, date_time, author, vote FROM counter_tips where counter_id = $counter_id ORDER BY vote desc, date_time";
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    $rs = $stmt->fetchAll( PDO::FETCH_ASSOC);
    $outp = json_encode($rs);
    return $outp;
}

function upvote(){
	global $dbh;
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->tip_id;
	$sql = "UPDATE counter_tips SET vote = vote + 1 where id = $id";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$outp = '{"id":"'.$sql.'"}'; //unecessary - for future reference: sample json object
}

function downvote(){
	global $dbh;
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->tip_id;
	$sql = "UPDATE counter_tips SET vote = vote - 1 where id = $id";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
}

function submitTip(){
    global $dbh;
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->counter_id;
    $name = $data->name;
    $tip = $data->tip;
	$sql = "INSERT INTO counter_tips (counter_id,tip,author)VALUES($id, '$tip','$name')";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
    if($stmt){
        return true;
    }
    else{return false;}
}


?>