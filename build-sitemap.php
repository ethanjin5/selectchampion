<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require("/home/feifansnf/opt/selectchampion/mysql_config.php");

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

$sql = "SELECT id, name, eng_name, alias, keywords FROM champion_list";
$stmt = $dbh->prepare($sql);
$stmt->execute();

$rs = $stmt->fetchAll( PDO::FETCH_ASSOC );
$links = array();
foreach($rs as $r){
    $links[] = "<url><loc>http://www.xuanyingxiong.com/champion/".$r['eng_name']."</loc></url>\n";
}

$sql = "SELECT c.id,c.type,c.champion_weak,l1.eng_name AS eng1,l1.name,c.champion_strong, l2.eng_name AS eng2, l2.name, num_tips FROM counter c left join champion_list l1 on c.champion_weak =l1.id LEFT JOIN champion_list l2 ON c.champion_strong = l2.id WHERE num_tips > 0";
$stmt = $dbh->prepare($sql);
$stmt->execute();

$rs = $stmt->fetchAll( PDO::FETCH_ASSOC );
foreach($rs as $r){
    $links[] = "<url><loc>http://www.xuanyingxiong.com/champion/tips/".$r['eng1']."/".$r['eng2']."</loc></url>\n";
}

$header = '<?xml version="1.0" encoding="UTF-8"?>
<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">

<url>
  <loc>http://www.xuanyingxiong.com/</loc>
  <lastmod>2015-10-26T01:41:55+00:00</lastmod>
</url>
';
$footer = '</urlset>';

$file = 'sitemap.xml';
// Open the file to get existing content
//$current = file_get_contents($file);
// Append a new person to the file
$current = $header;
foreach($links as $link){
$current.=$link;
}
$current.=$footer;
// Write the contents back to the file
file_put_contents($file, $current);

?>
