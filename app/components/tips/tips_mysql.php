<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

switch($_GET['action']){
    case 'getInfo':
        $champion_weak = $_GET['weak'];
        $champion_strong = $_GET['strong'];
        $sql = "SELECT id, name, eng_name FROM champion_list where eng_name = '$champion_weak'";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();
        $rweak = $stmt->fetch( PDO::FETCH_ASSOC );

        $sql = "SELECT id, name, eng_name FROM champion_list where eng_name = '$champion_strong'";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();
        $rstrong = $stmt->fetch( PDO::FETCH_ASSOC );

        $outp = '{"weak":'.json_encode($rweak).',"strong":'.json_encode($rstrong).'}';
        echo($outp);
        break;
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
    $champion_weak = $_GET['weak'];
    $champion_strong = $_GET['strong'];
    $sql = "SELECT id, tip, date_time, author, vote FROM counter_tips
    WHERE champion_weak = $champion_weak AND champion_strong = $champion_strong ORDER BY vote desc, date_time";
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
	$champion_weak = $data->champion_weak;
    $champion_strong = $data->champion_strong;
    $name = $data->name;
    $tip = $data->tip;
	$sql = "INSERT INTO counter_tips (champion_weak,champion_strong,tip,author)VALUES($champion_weak,$champion_strong,'$tip','$name')";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
    if($stmt){
        $sql = "UPDATE counter set num_tips = num_tips+1 WHERE champion_weak = $champion_weak AND champion_strong = $champion_strong";
        $stmt_num = $dbh->prepare($sql);
        $stmt_num->execute();
        if($stmt_num){
            return true;
        }else{return false;}
    }
    else{return false;}
}


?>