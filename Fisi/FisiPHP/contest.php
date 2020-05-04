<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <title>Gare</title>
</head>
<body>
    <div align = "center">
        <h1>Le prossime gare</h1>
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
            echo "Connected successfully <br>";


            // Perform query 
            if ($result = $conn -> query("SELECT * FROM gara")) {
            echo "Returned rows are: " . $result -> num_rows;
            }

            $query = "SELECT Nome, Citta, DataGara FROM Gara";
            $result = $conn->query($query);
            echo "<table border=1>";
            echo "<tr>";
            echo "<th> Nome </th>";
            echo "<th> Citta </th>";
            echo "<th> Data </th>";
            echo "</tr>";
            
            while($row = $result->fetch_array(MYSQLI_NUM)){
            echo "<tr>";
                echo "<td>$row[0]</td>";
                echo "<td><a href='$row[1].php'>$row[1]</a></td>";
                echo "<td>$row[2]</td>";
            echo "</tr>";
            }
            echo "</table>";
            $conn -> close();
            $result -> free();
        ?>
        <a href="index.php">Home page</a>
        <br>
        <a href="insertRiderForm.php">Aggiungi un nuovo rider</a>
        <br>
        <a href="deleteRiderForm.php">Elimina un rider</a>
    </div>
    
</body>
</html>