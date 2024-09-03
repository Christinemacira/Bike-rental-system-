<?php
// Enable error reporting for debugging (remove in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Set the content type to JSON
header('Content-Type: application/json');

// MySQL connection parameters
$host = 'localhost';
$dbname = 'verify_id'; // Your database name
$username = 'root'; 
$password = ''; 

try {
    // Connect to MySQL database using PDO
    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Handle database connection failure
    echo json_encode(["error" => "Database connection failed: " . $e->getMessage()]);
    exit();
}

// Get the input data from the request
$data = json_decode(file_get_contents("php://input"), true);

// Check if ID number is provided
if (!isset($data['id_number'])) {
    echo json_encode(["error" => "ID number not provided"]);
    exit();
}

// Retrieve the ID number from the input
$id_number = $data['id_number'];

// Prepare and execute the query to fetch user details
try {
    $stmt = $db->prepare("SELECT * FROM users WHERE id_number = :id_number");
    $stmt->bindParam(':id_number', $id_number);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if user exists in the database
    if ($user) {
        // Return the user details in JSON format
        echo json_encode([
            "success" => true,
            "user" => $user
        ]);
    } else {
        // User not found
        echo json_encode([
            "success" => false,
            "message" => "User not found"
        ]);
    }
} catch (PDOException $e) {
    // Handle any SQL errors
    echo json_encode(["error" => "Query error: " . $e->getMessage()]);
}
?>
