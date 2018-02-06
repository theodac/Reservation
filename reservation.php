<?php

if(isset($_POST['reservation'])){
    include_once ("functions/connectionPDO.php");
    $db=connectionPDO('localhost' , 'reservation' , 'root' , '');
    $salle=$_POST['salle'];
    $date=$_POST['date'];
    $duree = $_POST['duree'];
    if($salle==0 || $duree==0 || $date==0){
        echo "Veuillez bien remplir le formulaire";
    } else {
        $requete = "INSERT INTO `t_reservation` (`ID_RESERVATION`, `DATERESERVATION`, `T_ROOMS_ID_ROOMS`,`DUREE`) VALUES (NULL, '$date', '$salle','$duree')";
        $result = $db ->query($requete);

    }

}else {
    echo "erreur";
}