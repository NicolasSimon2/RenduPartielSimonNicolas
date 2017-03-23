<?php
error_reporting(0);
require "ApiConnect.php";
 
//$login = "Simon";
//$password = "nicolas";
 
$sql = "SELECT PLANIFICATION_PROJET FROM `projet` ;";
 
$result = mysqli_query($Conn, $sql);
 
 
$response = array();
 

 
while($row = mysqli_fetch_row($result)){
	echo $response = array("Plan"=>$row["0"]);
}
 echo json_encode(array("user_data"=>$response));
 
 
?>