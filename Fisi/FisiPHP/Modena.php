<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <title>Big air Modena</title>
</head>
<body>
    <div align = "center">
        <h1>Big Air Modena</h1>
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
            if ($result = $conn -> query("SELECT * FROM Gara WHERE Citta = 'Modena'")) {
            echo "Returned rows are: " . $result -> num_rows;
            }

            $query = "SELECT * FROM Gara WHERE Citta = 'Modena'";
            $result = $conn->query($query);
            $row = $result->fetch_array(MYSQLI_NUM);

            echo "<h3>Nome: $row[2] </h3>";
            echo "<h3>Primo premio: $row[3]€ </h3>";
            

            $conn -> close();
            $result -> free();
        ?>
        <br>
        <a href="index.php">Home page</a>
        <br>
        <a href="insertRiderForm.php">Aggiungi un nuovo rider</a>
        <br>
        <a href="deleteRiderForm.php">Elimina un rider</a>
    </div>
</body>
</html>