<?php
include('config.php');

$sql = "SELECT NumerLotu, DataOdlotu, TrasaLotu FROM Loty";
$result = $conn->query($sql);

$flights = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $flights[] = $row;
    }
}

echo json_encode($flights);

$conn->close();
?>
