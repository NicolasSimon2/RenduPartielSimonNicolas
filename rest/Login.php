<?php
error_reporting(0);
require "ApiConnect.php";
 
$login = $_GET["login"];
$password = $_GET["password"];
 
//$login = "Simon";
//$password = "nicolas";
 
$sql = "SELECT * FROM `utilisateur` WHERE `NOM_UTILISATEUR`='".$login."' AND `MOT_DE_PASSE`='".$password."';";
 
$result = mysqli_query($Conn, $sql);
 
 
 
$response = array();
 
while($row = mysqli_fetch_array($result)){
    $response = array("ID_UTILISATEUR"=>$row[0]);
}
 
 
echo json_encode(array("user_data"=>$response));
 
?>