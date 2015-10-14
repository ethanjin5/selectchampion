<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

switch($_GET['action']){
    case 'getInfo':
        $sql = "SELECT * from tier";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();
        $result = array();
        while($rs = $stmt->fetch( PDO::FETCH_ASSOC )){
            $tmp = explode(",",$rs['champions']);
            $tmp_sql = 'SELECT name,eng_name,alias,keywords FROM champion_list where eng_name IN("' . implode('", "', $tmp) . '")';
            $tmp_stmt = $dbh->prepare($tmp_sql);
            $tmp_stmt->execute();
            $tmp_rs = $tmp_stmt->fetchAll(PDO::FETCH_ASSOC);
            $rs['champions'] = $tmp_rs;
            
            if ($rs['tier'] == "God Tier [Highest Influence]"){
                $result['0'][]=$rs;
            }
            elseif ($rs['tier'] == "Tier 1 [Strong/Preferred Choices]"){
                $result['1'][]=$rs;
            }
            elseif ($rs['tier'] == "Tier 2 [Viable/Balanced Choices]"){
                $result['2'][]=$rs;
            }
            elseif ($rs['tier'] == "Tier 3 [Needs Higher Skill/Knowledge Than Usual]"){
                $result['3'][]=$rs;
            }
            elseif ($rs['tier'] == "Tier 4 [Low Benefits for Effort Used]"){
                $result['4'][]=$rs;
            }
            else{
                $result['else'][]=$rs;
            }
        }
        $outp = json_encode($result);
        echo($outp);
        break;
}

?>