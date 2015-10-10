<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

switch($_GET['action']){
    case 'getInfo':
        $champ_name = $_GET['param'];
        $sql = "SELECT id, name, eng_name, alias, description, tags FROM champion_list where eng_name = '$champ_name'";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();

        $rs = $stmt->fetch( PDO::FETCH_ASSOC );
        $outp = json_encode($rs);
        echo($outp);
        break;
    case 'getCounters':
        $outp = getCounters();
        echo $outp;
        break;
    case 'upvote':
        upvote();
        break;
    case 'downvote':
        downvote();
        break;
    case 'getTips':
        echo getTips();
        break;
}

function getCounters(){
	global $dbh;
    //$data = json_decode(file_get_contents("php://input"));
    //$champ_id = $data->id;
    //$type = $data->type;
    $champ_id = $_GET['id'];
    $type = $_GET['type'];
	$sql = "SELECT c.id AS id, l.name AS champion_weak, l2.name AS champion_strong, upvote,downvote 
    FROM counter c LEFT JOIN champion_list l ON c.champion_weak = l.id LEFT JOIN champion_list l2 
    ON c.champion_strong = l2.id WHERE champion_weak = $champ_id AND type = '$type'";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$rs = $stmt->fetchAll( PDO::FETCH_ASSOC );
    $outp = json_encode($rs);
	return $outp;
	
}

function upvote(){
	global $dbh;
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->counter_id;
	$sql = "UPDATE counter SET upvote = upvote + 1 where id = $id";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$outp = '{"id":"'.$sql.'"}'; //unecessary - for future reference
	echo ($outp);
}

function downvote(){
	global $dbh;
	$data = json_decode(file_get_contents("php://input"));
	$id = $data->counter_id;
	$sql = "UPDATE counter SET downvote = downvote - 1 where id = $id";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
}

function getTips(){
    global $dbh;
    $counter_id = $_GET['counter_id'];
    $sql = "SELECT id, tips, time, vote, author FROM counter_tips where counter_id = $counter_id ORDER BY vote LIMIT 5";
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    $rs = $stmt->fetchAll( PDO::FETCH_ASSOC);
    $outp = json_encode($rs);
    return $outp;
}
?>