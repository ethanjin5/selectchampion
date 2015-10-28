<?php
header("Content-Type: text/html");
require("app/includes/initial.php");

$router = new AltoRouter();
$router->setBasePath('');

$dbh = new PDO("mysql:host=$hostname;dbname=$db_name", $username, $password);
$dbh->query('set names utf8;');

$router->map('GET','/', 'home.view.php', '主页');
$router->map('GET','/champions/', 'home.view.php', '英雄列表');
$router->map('GET','/champion/[*:champion_name]','champion.view.php','英雄');
$router->map('GET','/champion/tips/[*:champion_weak]/[*:champion_strong]','tips.view.php','技巧');
$router->map('GET','/tier/', 'tier.view.php', '阶梯排名');
$router->map('GET','/blog/', 'blog.html', '论坛');
$router->map('GET','/contact/', 'contactus.html', '关于我们');

$match = $router->match();
if($match) {
    switch($match['target']){
        case 'home.view.php':
            echo "homepage";
            break;
        case 'champion.view.php':
            $champion = new Champion($dbh,$match['params']['champion_name']);
            break;
    }
?>
<!doctype html>
<html>
    <?php require("app/views/templates/head.php"); ?>
    <body>
        <?php 
            require('app/views/templates/header.html');
            require('app/views/pages/'.$match['target']);
            require('app/views/templates/footer.html');
        ?>
    </body>
</html>
<?
}
else {
  header("HTTP/1.0 404 Not Found");
  require('app/views/pages/404.html');
}

?>