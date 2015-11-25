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
        $only_once =false;
        while($rs = $stmt->fetch( PDO::FETCH_ASSOC )){
            $tmp = explode(",",$rs['champions']);
            $tmp_sql = 'SELECT name,eng_name,alias,keywords FROM champion_list where eng_name IN("' . implode('", "', $tmp) . '")';
            $tmp_stmt = $dbh->prepare($tmp_sql);
            $tmp_stmt->execute();
            $tmp_rs = $tmp_stmt->fetchAll(PDO::FETCH_ASSOC);
            $rs['champions'] = $tmp_rs;
            
            if ($rs['tier'] == "T1[最强势英雄]"){
                $result['0'][]=$rs;
            }
            elseif ($rs['tier'] == "T2[次强势英雄]"){
                $result['1'][]=$rs;
            }
            elseif ($rs['tier'] == "T3[平衡英雄]"){
                $result['2'][]=$rs;
            }
            elseif ($rs['tier'] == "T4[次弱势英雄]"){
                $result['3'][]=$rs;
            }
            elseif ($rs['tier'] == "T5[最弱势英雄]"){
                $result['4'][]=$rs;
            }
            else{
                $result['else'][]=$rs;
            }
            $result['info'] = $rs['patch'];
            $result['created'] = $rs['created'];
        }
        $outp = json_encode($result);
        echo($outp);
        break;
}

?>