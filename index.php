<?php
header("Content-Type: text/html");
require('app/classes/AltoRouter.php');
$router = new AltoRouter();
$router->setBasePath('');

$router->map('GET','/', 'home.php', '主页');
$router->map('GET','/champions/', 'home.php', '英雄列表');
$router->map('GET','/champion/[*:champion_name]/','champion.php','英雄');
$router->map('GET','/champion/tips/[*:champion_name]/[*:champion_name]/','tips.php','技巧');
$router->map('GET','/tier/', 'tier.php', '阶梯排名');
$router->map('GET','/blog/', 'blog.html', '论坛');
$router->map('GET','/contact/', 'contactus.html', '关于我们');

$match = $router->match();
if($match) {
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