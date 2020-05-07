<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
    <link rel="stylesheet" href="style.css">
    <title>X Games Oslo</title>
</head>
<body>
    <div align = "center">
        <h1>X Games Oslo</h1>
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
            if ($result = $conn -> query("SELECT * FROM Gara WHERE Citta = 'Oslo'")) {
            echo "Returned rows are: " . $result -> num_rows;
            }

            $query = "SELECT * FROM Gara WHERE Citta = 'Oslo'";
            $result = $conn->query($query);
            $row = $result->fetch_array(MYSQLI_NUM);

            echo "<h3>Nome: $row[2] </h3>";
            echo "<h3>Primo premio: $row[3]€ </h3>";
            
            $conn -> close();
            $result -> free();
        ?>
        <br>
        <div id="mapid"></div>
        <a href="index.php">Home page</a>
        <br>
        <a href="insertRiderForm.php">Aggiungi un nuovo rider</a>
        <br>
        <a href="deleteRiderForm.php">Elimina un rider</a>
        <script type="text/javascript">var latitude = "<?= $row[5] ?>"; longetude = "<?= $row[6] ?>";</script>
        <script type="text/javascript" src="map.js"></script>
    </div>
</body>
</html>