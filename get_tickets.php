<?php
include('config.php');

$sql = "SELECT NumerBiletu, CenaBiletu, KlasaBiletu, StatusPlatnosci FROM ZarezerwowaneBilety";
$result = $conn->query($sql);

$tickets = array();

if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $tickets[] = $row;
        }
    }
}

echo json_encode($tickets);

$conn->close();
?>
