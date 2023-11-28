<?php
include('config.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $dob = $_POST['dob'];
    $flight = $_POST['flight'];
    $class = $_POST['class'];

    $sql = "INSERT INTO ZarezerwowaneBilety (ImieNazwisko, DataUrodzenia, NumerLotu, KlasaBiletu) VALUES ('$name', '$dob', '$flight', '$class')";

    if ($conn->query($sql) === TRUE) {
        echo '<p>Rezerwacja zakończona pomyślnie!</p>';
    } else {
        echo '<p>Błąd rezerwacji: ' . $conn->error . '</p>';
    }
} else {
    echo '<p>Nieprawidłowe żądanie.</p>';
}

$conn->close();
?>
