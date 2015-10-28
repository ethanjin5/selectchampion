<?php
header("Content-Type: text/html");
require('app/classes/AltoRouter.php');
$router = new AltoRouter();
$router->setBasePath('');

$router->map('GET','/', 'home.php', '主页');
$router->map('GET','/champion/', 'home.php', '英雄列表');
$router->map('GET','/champion/[*:champion_name]/','champion.php','英雄');
$router->map('GET','/champion/tips/[*:champion_name]/[*:champion_name]/','tips.php','技巧');
$router->map('GET','/tier/', 'tier.php', '阶梯排名');
$router->map('GET','/blog/', 'blog.html', '论坛');
$router->map('GET','/contact/', 'contact.php', '关于我们');

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

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>选英雄-主页</title>
        <base href="/" />
        <meta name="keywords" content="英雄联盟，英雄克制关系，阶梯排名" />
        <meta name="description" content="帮助您在英雄联盟中提高段位，了解英雄克制以及被克制的关系，让你在选英雄时更有准备，对战时更自信，赢得比赛更轻松。">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <!-- stylesheets -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <!--  Necessary scripts(vendor)  -->
        <script type="text/javascript" src="assets/js/vendor/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="assets/js/vendor/bootstrap.min.js"></script>

    </head>

    <body>
        <div ng-include='"app/core/templates/header.html"'></div>
        <div ng-view autoscroll="true"></div>
        <div ng-include='"app/core/templates/footer.html"'></div>
    </body>
</html>