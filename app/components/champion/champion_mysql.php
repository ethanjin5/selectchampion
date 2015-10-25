<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=gb2312");

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
        $id = $rs['id'];
        $sql_type = "SELECT type FROM counter where champion_weak = $id OR champion_strong = $id GROUP BY type order by field(type, '综合', '上单', '中单','下路','打野')";
        $stmt_type = $dbh->prepare($sql_type);
        $stmt_type->execute();
        $rs_type = $stmt_type->fetchAll( PDO::FETCH_ASSOC );
        $outp = '{"champion":'.json_encode($rs).',"type":'.json_encode($rs_type).'}';
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
    $type_sql = " AND type ='".$_GET['type']."'";
    if ($_GET['type']=="全部"){$type_sql = "";}
    
	$sql = "SELECT * FROM (SELECT c.id AS id, champion_weak, champion_strong, l.name AS champion_against, l.eng_name AS eng_name,
    upvote,downvote,num_tips FROM counter c LEFT JOIN champion_list l ON c.champion_strong = l.id 
    WHERE champion_weak = $champ_id AND category = 'strong'".$type_sql." 
    ORDER BY (upvote-downvote) DESC LIMIT 20) x GROUP BY champion_against ORDER BY (upvote-downvote) DESC";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$rweak = $stmt->fetchAll( PDO::FETCH_ASSOC );
    
    $sql = "SELECT * FROM (SELECT c.id AS id, champion_weak, champion_strong, l.name AS champion_against, l.eng_name AS eng_name,
    upvote,downvote, num_tips FROM counter c LEFT JOIN champion_list l ON c.champion_weak = l.id 
    WHERE champion_strong = $champ_id AND category = 'strong'".$type_sql." 
    ORDER BY (upvote-downvote) DESC LIMIT 20) x GROUP BY champion_against ORDER BY (upvote-downvote) DESC";
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$rstrong = $stmt->fetchAll( PDO::FETCH_ASSOC );
    
    $outp = '{"weak":'.json_encode($rweak).',"strong":'.json_encode($rstrong).'}';
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
    $champion_weak = $_GET['weak'];
    $champion_strong = $_GET['strong'];
    $sql = "SELECT id, tip, date_time, author, vote FROM counter_tips 
    WHERE champion_weak = $champion_weak AND champion_strong = $champion_strong ORDER BY vote LIMIT 5";
    $stmt = $dbh->prepare($sql);
    $stmt->execute();
    $rs = $stmt->fetchAll( PDO::FETCH_ASSOC);
    $outp = json_encode($rs);
    return $outp;
}
?>