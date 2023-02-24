
<?php include "./templates/top.php"; 

 include "./templates/navbar.php"; 



$servername = "localhost";
$username = "root";
$password = "";
$db = "DATABASE_NAME";


   $con = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}




    if(isset($_POST['update'])){
        $Caption=$_POST['Caption'];
        $News=$_POST['News'];

        $sql="insert into news_alerts(News_caption,News ) values('$Caption','$News')";

        if(mysqli_query($con,$sql)){
}else{
    echo "Error Data Insertion...".mysqli_error($con);
}

mysqli_close($con);

    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
    <br> <br>
 <br>
 <br>
 <br>
 <br>
 
    <form action="" method="POST">
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Update News</h3>                
            </div>
            <div class="card-body">
                <form action="" method="POST">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="Caption" name="Caption" required>
                        
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" placeholder="News" name="News" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="update" value="Update" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            
        </div>
    </div>
</div>
</form>
<?php include "./templates/footer.php"; ?>

<script type="text/javascript" src="./js/admin.js"></script>

</body>
</html>