<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <title>Elimino il Rider</title>
</head>
<body>
    <div align="center">
        <h1>Elimino il rider...</h1>

        <?php
        
        $ID_Rider = $_GET["Rider"];
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

        $query = "SELECT * FROM Rider WHERE ID_Rider = $ID_Rider";
        echo $query;
        $result = $conn->query($query);
        
        
			if ($result->num_rows != 0){
                $query2 = "DELETE FROM Rider WHERE ID_Rider = $ID_Rider";
                $result = $conn->query($query2);

            }
			else
			{
                echo "Il Rider non &egrave; presente nel database.";
                /*
				$query2 = "INSERT INTO Rider(Nome, Cognome, Sesso, Stance, DataNascita, ID_Nazione) VALUES ('$Nome', '$Cognome', '$Sesso','$Stance','$DataNascita','$Nazione')";
                $result = $conn->query($query2);
                echo "<br>";
                echo $query2;
                echo $result;
				echo "Il Rider $Nome &egrave; stato aggiunto al database.";*/
			}
		$result->free();
		$conn->close();
        
        
        ?>
    </div>
    <a href="index.php">Back to home page</a>

</body>
</html>