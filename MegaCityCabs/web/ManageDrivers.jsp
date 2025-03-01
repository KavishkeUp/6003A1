<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Drivers | Mega City Cab</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                <div class="form-group">
                    <label>Vehicle Type</label>
                    <select name="vehicleType" class="form-control" required>
                        <option value="Standard">Standard</option>
                        <option value="Luxury">Luxury</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
                <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                <a href="ViewDrivers.jsp" class="btn btn-info">View Drivers</a>
            </form>
        </div>
    </div>
</body>
</html>
