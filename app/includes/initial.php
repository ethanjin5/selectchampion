
<?php
require("/home/feifansnf/opt/selectchampion/mysql_config.php");

function __autoload($class_name) {
    include 'app/classes/'.$class_name . '.class.php';
}

?>
