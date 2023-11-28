<?php
include('config.php');

$sql = "SELECT NumerBiletu, ImieINazwisko, NumerLotu, KlasaBiletu FROM ZarezerwowaneBilety";
$result = $conn->query($sql);

$reservations = array();

if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $reservations[] = $row;
        }
    }
}

echo json_encode($reservations);

$conn->close();
?>
