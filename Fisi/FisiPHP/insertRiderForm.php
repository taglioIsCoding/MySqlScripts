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
        <h1>Form di inserimento per un nuovo rider</h1>
        <form action="insertRiderAction.php" method="GET"><br>
        Inserire il nome:
        <input type="text" name="NomeRider" required><br>
        Inserire il cognome:
        <input type="text" name="CognomeRider" required><br>
        Sesso:
        <select name="Sesso">
            <option value="1">Uomo</option>
            <option value="0">Donna</option>
        </select>
        Stance:
        <select name="Stance">
            <option value="Regular">Regular</option>
            <option value="Goofy">Goofy</option>
        </select> <br>
        Date of birth:
        <input type="date" id="birthday" name="birthday" required>
        
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
            $query = "SELECT * FROM Nazionale ORDER BY Nazione";
            $result = $conn ->query($query);
            if ($result->num_rows != 0){
        ?>
            Nazione:
            <select name="Nazione">
            <?php
                        while ($row = $result->fetch_array())
                            echo "<option value=\"$row[ID_Nazione]\">$row[Nazione]</option>";
                    ?>
            </select> 

        <?php
            }
            else
            echo "Nessun peronaggio &egrave; presente nel databese.";
            $result->free();
            $conn->close();
        ?>
        <br>
        <input type="submit" value= "Inserisci">
      </form>
    </div>
    <a href="index.php">Back to home page</a>
    <br>
</body>
</html>