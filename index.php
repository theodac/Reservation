<?php
include ('./functions/connexionPDO.php');
$db = connectionPDO();

?>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form method="post" action="reservations.php">
<?php
$sql =  "SELECT * FROM t_salles ";
$reponse = $db->query($sql);
echo "<select name='select'>";
while ($donnees = $reponse->fetch(PDO::FETCH_ASSOC)){
    echo "<option value='".$donnees['ID_SALLE'] . "'> ".$donnees['SALLENOM'] . "</option>";
}
echo "</select>";

?>
    <br>
    <label>Nombre de participants : </label>
    <input type="number" name="participant">
    <br>
    <label>Date de la réservations : </label>
    <input type="date" name="date">
    <br>
    <label>Heure de début : </label>
    <input type="time" name="heureD">
    <br>
    <label>Heure de Fin : </label>
    <input type="time" name="heureF">
    <br>
    <label>Votre Nom : </label>
    <input type="text" name="nom">
    <br>
    <input type="submit" name="envoi">
</form>

</body>
</html>