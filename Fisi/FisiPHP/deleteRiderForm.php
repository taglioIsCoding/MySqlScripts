<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <title>Elimina rider</title>
</head>
<body>
    <div align="center">
        <h1>Selezionare quale rider si vuol eliminare</h1>
        <form action="deleteRiderAction.php" method="GET">
            <?php
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
                $query = "SELECT * FROM Rider ORDER BY Cognome";
                $result = $conn ->query($query);
                if ($result->num_rows != 0){
            ?>
                Lista dei rider:
                <select name="Rider">
                <?php
                            while ($row = $result->fetch_array())
                                echo "<option value=\"$row[ID_Rider]\">$row[Cognome] $row[Nome]</option>";
                        ?>
                </select> 
            <?php
                }
                else
                echo "Nessun rider &egrave; presente nel databese.";
                $result->free();
                $conn->close();
                ?>
            <br>
            <input type="submit" value= "Elimina">
      </form>
      <a href="index.php">Back to home page</a>

    </div>
</body>
</html>