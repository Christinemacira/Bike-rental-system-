<!DOCTYPE html>
<html>
<head>
    <title>Bike Rental User Identification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }
        h2 {
            margin-top: 0;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 20px;
            padding: 15px;
            border-radius: 4px;
            background-color: #e9ecef;
        }
        .error {
            color: #dc3545;
        }
        .success {
            color: #28a745;
        }
        .login-btn, .admin-login-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
            margin-top: 20px;
            cursor: pointer;
        }
        .login-btn {
            background-color: #28a745;
            color: white;
        }
        .admin-login-btn {
            background-color: #ffc107;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Enter Your ID Number</h2>

    <form method="POST" action="index.php">
        <label for="id_number">ID Number:</label>
        <input type="text" id="id_number" name="id_number" required>
        <input type="submit" value="Check Information">
    </form>

    <!-- Admin login button appears by default -->
    <a href="../admin/index.php" class="admin-login-btn">Admin Login</a>

    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id_number = $_POST['id_number'];

        // Set the API URL
        $url = 'http://localhost/bikerental-website-main/API/api.php';

        // Prepare the data for the POST request
        $data = json_encode(["id_number" => $id_number]);

        // Initialize cURL session
        $ch = curl_init($url);

        // Set cURL options
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        // Execute the cURL request and get the response
        $response = curl_exec($ch);

        // Close cURL session
        curl_close($ch);

        // Decode the JSON response
        $response_data = json_decode($response, true);

        // Check if the user was found and display the information
        echo '<div class="result">';
        if (isset($response_data['success']) && $response_data['success'] === true) {
            echo '<p class="success"><strong>User Found:</strong></p>';
            echo '<p>Name: ' . htmlspecialchars($response_data['user']['name']) . '</p>';
            echo '<p>Address: ' . htmlspecialchars($response_data['user']['address']) . '</p>';
            echo '<p>Other Info: ' . htmlspecialchars($response_data['user']['other_info']) . '</p>';
            echo '<a href="../welcome.php#loginform" class="login-btn">Proceed to Login</a>';
        } else {
            echo '<p class="error">' . htmlspecialchars($response_data['message']) . '</p>';
        }
        echo '</div>';
    }
    ?>

</div>

</body>
</html>
