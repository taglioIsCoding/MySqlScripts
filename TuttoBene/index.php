<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Query</title>
</head>
<body>
    <div align = "center">
        <h1>Conteggio dei clienti dei vari supermercati</h1>
        <?php 
             $user = 'root';
             $password = 'root';
             $db = 'tuttoBene';
             $host = 'localhost';
             $port = 3306;

             // Create connection
            $conn = new mysqli($host, $user, $password, $db);
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }
            echo "Connected successfully <br>";

            if ($result = $conn -> query(" SELECT Luoghi.Nome, Count(Recare.ID_luogo) as NumeroClienti from (Utenti join Recare on Recare.CodFiscale = Utenti.CodFiscale)
                                            join Luoghi on Luoghi.ID_luogo = Recare.ID_luogo
                                                group by Luoghi.Nome
                                                Order by NumeroClienti desc")) {
                echo "Returned rows are: " . $result -> num_rows;
            }

            $query = "SELECT Luoghi.Nome, Count(Recare.ID_luogo) as NumeroClienti
            from (Utenti join Recare on Recare.CodFiscale = Utenti.CodFiscale)
            join Luoghi on Luoghi.ID_luogo = Recare.ID_luogo
            group by Luoghi.Nome
            Order by NumeroClienti desc";
            $result = $conn->query($query);

            echo "<table border=1>";
            echo "<tr>";
            echo "<th> Nome supermercato </th>";
            echo "<th> Accessi </th>";
            echo "</tr>";

            while($row = $result->fetch_array(MYSQLI_NUM)){
                echo "<tr>";
                    echo "<td>$row[0]</td>";
                    echo "<td>$row[1]></td>";
                echo "</tr>";
                }
                echo "</table>";
                $conn -> close();
                $result -> free();
        ?>
    </div>
    
</body>
</html>