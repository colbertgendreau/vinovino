<?php

define("BASEURL", "main.js");
define('HOST', 'localhost');
define('USER', 'root');
define('PASSWORD', '');
define('DATABASE', 'vinovino');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inspire</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

<div class="container">
    <h1>{{ $bouteilles }}</h1>
</div>


<?php
$nombreProduit = 96; //48 ou 96
$page = 1;
$i = 1;

$saq = new SAQ();

$nombre = $saq->getMaxPages();
echo "nombre de page = ". $nombre;
// $nombre = $nombre + 1;
$nombre = intval($nombre);

for ($i = 0; $i < ($nombre+1); $i++)	//permet d'importer séquentiellement plusieurs pages.
{

    echo "<h2>page " . ($page + $i) . "</h2>";
    $resultat = $saq->getProduits($nombreProduit, $page + $i);
    echo "importation : " . $resultat . "<br>";
}

// while ($nombre = $saq->getProduits($nombreProduit, $page)) {
// 	echo "<h2>page " . $page . "</h2>";
// 	echo "importation : " . $nombre . "<br>";
// 	$page++;
// }





?>
</body>

</html>
