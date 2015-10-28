<?php
class Champion{
    public $id = "";
    public $name = "";
    public $eng_name = "";
    public $alias = "";
    public $description = "";
    public $tags = "";
    public $counters = array();
    public $generalTips = array();
    public $dbh;

    public function __construct($dbh,$eng_name){
        $this->dbh = $dbh;
        $sql = "SELECT id, name, eng_name, alias, description, tags FROM champion_list where eng_name = '$eng_name'";
        $stmt = $dbh->prepare($sql);
        $stmt->execute();
        $rs = $stmt->fetch( PDO::FETCH_ASSOC );
        $this->id = $rs['id'];
        $this->name = $rs['name'];
        $this->eng_name = $rs['eng_name'];
        $this->alias = $rs['alias'];
        $this->description = $rs['description'];
        $this->tags = $rs['tags'];
        $this->setGeneralTips();
    }
    
    public function setGeneralTips(){
        $sql = "SELECT tip, date_time, author, vote FROM general_tips WHERE champion_id = $this->id";
        $stmt = $this->dbh->prepare($sql);
        $stmt->execute();
        while($rs = $stmt->fetch( PDO::FETCH_ASSOC )){
            $this->generalTips[]=$rs;
        }
    }

}
?>