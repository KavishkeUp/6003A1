<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Drivers | Mega City Cab</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            background-color: #121212;
            color: #e0c097;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .jumbotron {
            background-color: #1c1c1c;
            color: #e0c097;
            border: 1px solid #e0c097;
            padding: 30px;
            border-radius: 8px;
        }
        .jumbotron h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .form-group label {
            color: #e0c097;
        }
        .form-control {
            background-color: #292929;
            color: #e0c097;
            border: 1px solid #e0c097;
        }
        .form-control:focus {
            background-color: #292929;
            color: #e0c097;
            border-color: #c89b3c; /* Change focus border color */
        }
        .btn-custom {
            background-color: #c89b3c;
            color: black;
            border: none;
        }
        .btn-custom:hover {
            background-color: #e0c097;
            color: white;
        }
        .btn-secondary {
            background-color: #1c1c1c;
            color: #e0c097;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #292929;
            color: white;
        }
        .btn-info {
            background-color: #1c1c1c;
            color: #e0c097;
            border: none;
        }
        .btn-info:hover {
            background-color: #292929;
            color: white;
        }
        .form-group.mb-4 {
            margin-bottom: 40px; /* Increased gap between the dropdown and buttons */
        }
        footer {
            background-color: #1c1c1c;
            color: #e0c097;
            padding: 20px 0;
            text-align: center;
        }
        footer a {
            color: #e0c097;
            text-decoration: none;
        }
        footer a:hover {
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="jumbotron mt-5">
            <h1 class="display-4">Manage Drivers</h1>
            <form action="ManageDriversServlet" method="post">
                <div class="form-group">
                    <label>Driver Name</label>
                    <input type="text" name="driverName" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Driver NIC</label>
                    <input type="text" name="driverNIC" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Mobile</label>
                    <input type="text" name="mobile" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Vehicle Registration Plate No</label>
                    <input type="text" name="vehicleRegNo" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Vehicle Brand</label>
                    <input type="text" name="vehicleBrand" class="form-control" required>
                </div>
                <div class="form-group mb-4">
                    <label>Vehicle Type</label>
                    <select name="vehicleType" class="form-control" required>
                        <option value="Standard">Standard</option>
                        <option value="Luxury">Luxury</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-custom">Submit</button>
                <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                <a href="ViewDrivers.jsp" class="btn btn-info">View Drivers</a>
            </form>
        </div>
    </div>
    
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
        <p>Follow us on <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a> | 
           <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a> | 
           <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a></p>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
