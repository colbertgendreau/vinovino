<body>
<?php
use Anperoconi\Vinovino\Models\SAQ;
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
