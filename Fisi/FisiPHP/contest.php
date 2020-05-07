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
    <title>Gare</title>
</head>
<body>
    <div align = "center">
        <h1>Le prossime gare</h1>
        <div id="mapid"></div>
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

            $query = "SELECT * FROM Gara";
            $result = $conn->query($query);
            echo "<table border=1>";
            echo "<tr>";
            echo "<th> Nome </th>";
            echo "<th> Citta </th>";
            echo "<th> Data </th>";
            echo "</tr>";
            
            while($row = $result->fetch_array(MYSQLI_NUM)){
            echo "<tr>";
                echo "<td>$row[2]</td>";
                echo "<td><a href='$row[4].php'>$row[4]</a></td>";
                echo "<td>$row[1]</td>";
            echo "</tr>";
            }
            echo "</table>";
        ?>
        <a href="index.php">Home page</a>
        <br>
        <a href="insertRiderForm.php">Aggiungi un nuovo rider</a>
        <br>
        <a href="deleteRiderForm.php">Elimina un rider</a>
    </div>

    <script type="text/javascript">
      var Names = [
        <?php
        $query = "SELECT * FROM Gara";
        $result = $conn->query($query);
        while($row = $result->fetch_array(MYSQLI_NUM)) {
                $that  = $row["2"];
                echo "'$that',";
            }
        ?>
        ];

      var lat = [
        <?php
        $query = "SELECT * FROM Gara";
        $result = $conn->query($query);
        while($row = $result->fetch_array(MYSQLI_NUM)) {
                $that  = $row["5"];
                echo "'$that',";
            }
        ?>
        ];
        var lon = [
        <?php
        $query = "SELECT * FROM Gara";
        $result = $conn->query($query);
        while($row = $result->fetch_array(MYSQLI_NUM)) {
                $that  = $row["6"];
                echo "'$that',";
            }
        ?>
        ];
        var cit = [
        <?php
        $query = "SELECT * FROM Gara";
        $result = $conn->query($query);
        while($row = $result->fetch_array(MYSQLI_NUM)) {
                $that  = $row["4"];
                echo "'$that',";
            }
        ?>
        ];

    </script>

    <?php
    $conn -> close();
    $result -> free();
    ?>
    <script src="bigMap.js"></script>
</body>
</html>