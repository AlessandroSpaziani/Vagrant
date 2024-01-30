<?php
// Connessione al database MySQL
$servername = "db.m340"; // Cambiare con l'indirizzo del server MySQL
$username = "alessandro.spaziani"; // Cambiare con l'username del database
$password = "Password&1"; // Cambiare con la password del database
$database = "databaseVagrant"; // Cambiare con il nome del database

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

// Esegui la query (sostituisci con la tua query)
$sql = "SELECT * FROM persona";
$result = $conn->query($sql);

// Controllo se ci sono risultati
if ($result->num_rows > 0) {
    echo "<table>";
    echo "<tr><th>ID</th><th>Nome</th><th>Cognome</th><th>Data di nascita</th><th>Indirizzo</th><th>Email</th></tr>";

    // Stampa dei risultati riga per riga
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["id"] . "</td>";
        echo "<td>" . $row["nome"] . "</td>";
        echo "<td>" . $row["cognome"] . "</td>";
        echo "<td>" . $row["data_di_nascita"] . "</td>";
        echo "<td>" . $row["indirizzo"] . "</td>";
        echo "<td>" . $row["email"] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "Nessun risultato trovato.";
}

// Chiudi la connessione al database
$conn->close();
?>