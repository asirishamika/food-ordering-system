<?php
    $con = mysqli_connect("localhost", "root", "", "database_name");
    // Check connection
    if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT News FROM news_alerts";
    ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CCS|News</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="styleheader.css">
     <link rel="stylesheet" href="news.css">
    <script src="https://kit.fontawesome.com/7d288222ab.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="content">
        <h3>News <span> Alerts</span></h3>
       
       
    </div>

</section>

<!-- home section ends -->

<table id="news">
    <tr>
        <th>Offers</th>        
    </tr>
    <?php
    $result = $con->query($sql);
    if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
    echo "<tr><td>" . $row["News"]. "</td></tr>";
    }
    echo "</table>";
    } else { echo "0 Offers"; }
    $con->close();
    ?>
</table>

</body>