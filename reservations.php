<?php
include ('./functions/connexionPDO.php');
if (isset($_POST['envoi'])){
    $db = connectionPDO();

    $nbrParticipants = $_POST['participant'];
    $dateReservation = $_POST['date'];
    $heureDebut = $_POST['heureD'];
    $heurefin = $_POST['heureF'];
    $salle = $_POST['select'];
    $nom = $_POST['nom'];


    $sql = "SELECT * FROM t_salles ";
    $reponse = $db->query($sql);
    while ($donnees = $reponse->fetch(PDO::FETCH_ASSOC)){
        if($nbrParticipants > $donnees['SALLEPLACE']){

            echo "Veuillez choisir une autre salle , celle-ci ne dispose pas d'assez de place";
        }
    }
    if (strtotime($dateReservation) < time()){

        echo "Veuillez entre une date valide s'il vous plait";
    }else {
        $sql = "SELECT * FROM t_reservations";
        $reponse = $db->query($sql);
        while ($donnees = $reponse->fetch(PDO::FETCH_ASSOC)){
            $dateExistante = $donnees['DATE'];
            if ($dateReservation == $dateExistante && strtotime($heureDebut) == strtotime($donnees['HEUREDEBUT']) ||$dateReservation == $dateExistante && strtotime($heurefin) == strtotime($donnees['HEUREFIN'])) {

                echo "Désole le créneaux demandé est deja occupée";
            }else{
                $sql = "INSERT INTO `t_reservations` (`ID_RESERVATION`, `DATE`, `HEUREDEBUT`, `HEUREFIN`, `NOM`, `T_SALLES_ID_SALLE`) VALUES (NULL, '$dateReservation', '$heureDebut', '$heurefin', '$nom', '$salle')";
                $result = $db->query($sql);
            }

        }
    }
}
