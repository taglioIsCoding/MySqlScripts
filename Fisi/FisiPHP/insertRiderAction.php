<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <title>Insert a new rider</title>
</head>
<body>
    <div align="center">
        <h1>Inserisco un nuovo rider...</h1>

        <?php
        
        $Nome = $_GET["NomeRider"];
        $Cognome = $_GET["CognomeRider"];
        $Sesso = $_GET["Sesso"];
        $Stance = $_GET["Stance"];
        $DataNascita = $_GET["birthday"];
        $Nazione = $_GET["Nazione"];
        $user = 'root';
        $password = 'root';
        $db = 'fisi';
        $host = 'localhost';
        $port = 3306;

        // Create connection
        $conn = new mysqli($host, $user, $password, $db);
        // Check connection
        if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
        }

        $query = "SELECT * FROM Rider WHERE Nome = '$Nome' AND Cognome = '$Cognome'";
        echo $query;
        $result = $conn->query($query);

        echo "<br>";
        echo $Nome;
        echo "<br>";
        echo $Cognome;
        echo "<br>";
        echo $Sesso;
        echo "<br>";
        echo $Stance;
        echo "<br>"; 
        echo $DataNascita; 
        echo "<br>"; 
        echo $Nazione;
        
        
			if ($result->num_rows != 0)
				echo "Il Rider $Nome &egrave; gi%agrave; presente nel database.";
			else
			{
				$query2 = "INSERT INTO Rider(Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES ('$Nome', '$Cognome', '$Sesso','$Stance','$DataNascita','$Nazione')";
                $result = $conn->query($query2);
                echo "<br>";
                echo $query2;
                echo $result;
				echo "Il Rider $Nome &egrave; stato aggiunto al database.";
			}
		$result->free();
		$conn->close();
        
        
        ?>
    </div>

    <a href="index.php">Back to home page</a>
    <br>
</body>
</html>