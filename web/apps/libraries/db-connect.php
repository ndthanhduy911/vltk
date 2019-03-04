<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "coffeemug_db";

// Create connection
$connection = new mysqli($servername, $username, $password, $dbname);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
