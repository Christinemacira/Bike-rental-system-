<?php
// Start the session at the very top of the file
session_start();

// Database connection (No password)
try {
    $dbh = new PDO("mysql:host=localhost;dbname=bikerental", "username", "");
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

if (isset($_POST['signup'])) {
    $fname = trim($_POST['fullname']);
    $email = trim($_POST['emailid']);
    $mobile = trim($_POST['mobileno']);
    $password = md5(trim($_POST['password'])); // Trim any extra spaces
    $dob = trim($_POST['dob']);
    $address = trim($_POST['address']);
    $city = trim($_POST['city']);
    $country = trim($_POST['country']);

    // Prepare SQL query
    $sql = "INSERT INTO tblusers (FullName, EmailId, ContactNo, Password, dob, Address, City, Country) 
            VALUES (:fname, :email, :mobile, :password, :dob, :address, :city, :country)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':fname', $fname, PDO::PARAM_STR);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':mobile', $mobile, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->bindParam(':dob', $dob, PDO::PARAM_STR);
    $query->bindParam(':address', $address, PDO::PARAM_STR);
    $query->bindParam(':city', $city, PDO::PARAM_STR);
    $query->bindParam(':country', $country, PDO::PARAM_STR);

    // Execute the query
    $query->execute();
    $lastInsertId = $dbh->lastInsertId();
    if ($lastInsertId) {
        echo "<script>alert('Registration successful. Now you can login');</script>";
    } else {
        echo "<script>alert('Something went wrong. Please try again');</script>";
    }
}
?>

<script type="text/javascript">
    function checkAvailability() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "check_availability.php",
            data: 'emailid=' + $("#emailid").val(),
            type: "POST",
            success: function(data) {
                $("#user-availability-status").html(data);
                $("#loaderIcon").hide();
            },
            error: function() {}
        });
    }

    function valid() {
        var password = document.signup.password.value.trim();  // Trim spaces
        var confirmPassword = document.signup.confirmpassword.value.trim();  // Trim spaces

        if (password !== confirmPassword) {
            alert("Password and Confirm Password Field do not match!!");
            document.signup.confirmpassword.focus();
            return false;
        }
        return true;
    }
</script>

<!-- Sign Up Modal HTML -->
<div class="modal fade" id="signupform">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title">Sign Up</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="signup_wrap">
                        <div class="col-md-12 col-sm-6">
                            <form method="post" name="signup" onSubmit="return valid();">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="fullname" placeholder="Full Name*" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="mobileno" placeholder="Mobile Number*" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="emailid" id="emailid" onBlur="checkAvailability()" placeholder="Email Address*" required>
                                    <span id="user-availability-status" style="font-size:12px;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control" placeholder="Password*" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="confirmpassword" class="form-control" placeholder="Confirm Password*" required>
                                </div>
                                <div class="form-group">
                                    <input type="date" class="form-control" name="dob" placeholder="Date of Birth*" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="address" placeholder="Address*" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="city" placeholder="City*" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="country" placeholder="Country*" required>
                                </div>
                                <div class="form-group checkbox">
                                    <input type="checkbox" id="terms_agree" required>
                                    <label for="terms_agree">I Agree with <a href="about-us.php?type=terms" target="_blank">Terms and Conditions</a></label>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Sign Up" name="signup" id="submit" class="btn btn-block">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <p>Already got an account? <a href="#loginform" data-toggle="modal" data-dismiss="modal">Login Here</a></p>
            </div>
        </div>
    </div>
</div>
