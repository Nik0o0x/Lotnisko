<?php
include('config.php');

$sql = "SELECT NumerLotu, DATE_FORMAT(DataOdlotu, '%Y-%m-%d') as DataOdlotu, DATE_FORMAT(DataOdlotu, '%H:%i:%s') as GodzinaOdlotu, TrasaLotu FROM Loty";
$result = $conn->query($sql);

$flights = array();

if ($result) {
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $flights[] = $row;
        }
    }
}

echo json_encode($flights);

$conn->close();
?>
