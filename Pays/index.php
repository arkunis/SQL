<?php

$db = new PDO('mysql:host=localhost;dbname=t_pays;charset=utf8', 'user1', '123');

// On récupère tout le contenu de la table recipes
$sqlQuery = 'SELECT * FROM t_pays order by libelle_pays';
$recipesStatement = $db->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>

    <title>Document</title>
</head>

<body>


    <table id="myTable" class="display">
        <thead>
            <tr>
                <th>libelle Pays</th>
                <th>Capitale</th>
                <th>Supercicie</th>
                <th>Espérance de vie par Pays</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($recipes as $recipe) { ?>
                <tr>
                    <td><?php print $recipe['libelle_pays'] ?></td>

                    <td><?php print $recipe['Capitale'] ?></td>

                    <td><?php print $recipe['Superficie'] ?></td>
                    <td><?php print $recipe['esperance_vie_pays'] ?></td>
                </tr>

            <?php } ?>
        </tbody>
    </table>

    <script>
        $(document).ready(function() {
            $('#myTable').DataTable();
        });

        new DataTable('#myTable', {
            language: {
                url: 'https://cdn.datatables.net/plug-ins/1.11.5/i18n/fr-FR.json'
            }
        });
    </script>
</body>

</html>