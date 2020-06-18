<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>統一發票管理系統</title>
  <link rel="stylesheet" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<body>
  <?php 
    include "./include/header.php";
    include "./common/base.php"
  ?>
  <h1>兌獎結果</h1>


<?php

$award_type=[
  "1"=>["特別獎",1,8,10000000],
  "2"=>["特獎",2,8,2000000],
  "3"=>["頭獎",3,8,200000],
  "4"=>["二獎",3,7,40000],
  "5"=>["三獎",3,6,10000],
  "6"=>["四獎",3,5,4000],
  "7"=>["五獎",3,4,1000],
  "8"=>["六獎",3,3,200],
  "9"=>["增開六獎",4,3,200]
];

if(empty($_GET)){
  echo "尚未選擇要對獎的獎別，請至<a href='invoice.php'>各期獎號</a>";
  exit();
}

if(isset($_GET['aw'])){
  echo "<p>獎別： ".$award_type[$_GET['aw']]['0']."</p>";  
}

$year=date("Y");
if (isset($_GET['year'])) {
  echo "<p>年份： ".$_GET['year']."</p>";  
}else{
  echo "<p>年份： $year</p>";  
}

$period=round(date("n")/2,0);
if (isset($_GET['period'])) {
  echo "<p>期別： ".$_GET['period']."</p>";  
}else{
  echo "<p>期別： $period</p>";  
}

// echo "<pre>";print_r($award_type);"</pre>";


$awd_nums=nums("award_number",["type"=>$award_type[$_GET['aw']]['1'],"year"=>$_GET['year'],"period"=>$_GET['period']]);

echo "<h3>對獎獎號：</h3>";
$awd_multi=[];
if($awd_nums>0){
  $awd_number=all("award_number",["type"=>$award_type[$_GET['aw']]['1'],"year"=>$_GET['year'],"period"=>$_GET['period']]);
  foreach ($awd_number as $value) {
    echo "<span class='awd_number'>".$value['number']."</span>";
    $awd_multi[]=$value['number'];
  }
}
// echo "<pre>";print_r($awd_number);"</pre>";
// echo "<pre>";print_r($awd_multi);"</pre>";
?>

<!-- 2.這期有哪些發票 -->
<table>
<?php
$invoice=all("invoice",["year"=>$_GET['year'],"period"=>$_GET['period']]);
$inv=[];
foreach ($invoice as $value) {
  echo "<tr class='first'>";
    echo "<td>".$value['code']."</td>";
    echo "<td>".$value['number']."</td>";
   
  echo "</tr>";  
  
}

?>
</table>

<?php
// 3.一張一張的對。



// echo "財政部獎號";
// echo "<pre>";print_r($awd_multi);"</pre>";   //一維陣列。
// echo "自己的發票";
// echo "<pre>";print_r($inv);"</pre>";   //一維陣列。

$award_type_re=[
  "10000000"=>"特別獎",
  "2000000"=>"特獎",
  "200000"=>"頭獎",
  "40000"=>"二獎",
  "10000"=>"三獎",
  "4000"=>"四獎",
  "1000"=>"五獎"
];


$total_num=0;
$bonus=[];
foreach ($invoice as $inv) {
  
  foreach ($awd_multi as $awd_value) {
    $length=$award_type[$_GET['aw']]['2'];  //需要兌尾數幾碼
    $start=8-$length;

    if ($_GET['aw']!=9){
      $target_num=mb_substr($awd_value,$start,$length);
    }else{
      $target_num=$awd_value;
    }

    
    if(mb_substr($inv['number'],$start,$length) == $target_num){                        //發票的尾部x碼，兌財政部獎號的尾部x碼。
      $count=nums("reward_bonus",["year"=>$_GET['year'],"period"=>$_GET['period'],"number"=>$inv['number']]);    
      
      $bonus=[              
        "year"=>$inv['year'],
        "period"=>$inv['period'],
        "number"=>$inv['number'],
        "reward"=>$award_type[$_GET['aw']]['3'],
        "expend"=>$inv['expend']
      ];

        if($count == 0) {
            $table="reward_bonus"; 
            save($table,$bonus);

            echo "<span style='color:red;font-size:1.5rem;'>".$inv['number']."中".$award_type[$_GET['aw']]['0']."了！</span>";
            $total_num++;
            echo "<br>";

        }else{
            $table="reward_bonus";
            $inv_checked=find($table,["year"=>$inv['year'],"period"=>$inv['period'],"number"=>$inv['number']]);
            // echo "<pre>";print_r($inv_checked);"</pre>";
            echo "<span style='color:red;font-size:1.5rem;'>".$inv['number']."中過".$award_type_re[$inv_checked['reward']]."了！</span>";
        }
    }

        
    

  }
}
//147行，測試用的echo
// echo "<pre>";print_r($inv_value);"</pre>"; 
$total=$total_num*($award_type[$_GET['aw']]['3']);

?>

<div>
  <p>本期<?=$award_type[$_GET['aw']]['0'];?>中獎筆數： <?=$total_num;?> 張</p> 
  <p>本期<?=$award_type[$_GET['aw']]['0'];?>中獎總金額： <?=$total;?> 元</p> 


</div>

</body>
</html>