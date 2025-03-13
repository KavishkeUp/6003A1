<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Drivers | Mega City Cab</title>
    
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
        .table {
            background-color: #292929;
            color: #e0c097;
        }
        .table th, .table td {
            border: 1px solid #e0c097;
        }
        .table th {
            background-color: #1c1c1c;
            color: #e0c097;
        }
        .table td {
            background-color: #292929;
            color: white;
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
        .btn-primary {
            background-color: #1c1c1c;
            color: #e0c097;
            border: none;
        }
        .btn-primary:hover {
            background-color: #292929;
            color: white;
        }
        .btn-danger {
            background-color: #b30000;
            color: white;
        }
        .btn-danger:hover {
            background-color: #ff1a1a;
        }
        .btn-success {
            background-color: #4CAF50;
            color: white;
        }
        .btn-success:hover {
            background-color: #45a049;
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
            <h1 class="display-4">View Drivers</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Driver Name</th>
                        <th>Driver NIC</th>
                        <th>Mobile</th>
                        <th>Vehicle Reg No</th>
                        <th>Vehicle Brand</th>
                        <th>Vehicle Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String filePath = "D:\\ICBT\\DriverDetails.txt";
                        File file = new File(filePath);
                        if (file.exists()) {
                            BufferedReader reader = new BufferedReader(new FileReader(file));
                            String line;
                            while ((line = reader.readLine()) != null) {
                                String[] details = line.split(",");
                                if (details.length == 7) {
                                    String driverName = details[0];
                                    String driverNIC = details[1];
                                    String mobile = details[2];
                                    String vehicleRegNo = details[3];
                                    String vehicleBrand = details[4];
                                    String vehicleType = details[5];
                                    String status = details[6];

                                    String rowClass = status.equals("Disabled") ? "text-danger" : "";
                    %>
                                <tr class="<%= rowClass %>">
                                    <td><%= driverName %></td>
                                    <td><%= driverNIC %></td>
                                    <td><%= mobile %></td>
                                    <td><%= vehicleRegNo %></td>
                                    <td><%= vehicleBrand %></td>
                                    <td><%= vehicleType %></td>
                                    <td><%= status %></td>
                                    <td>
                                        <form action="ViewDriversServlet" method="post">
                                            <input type="hidden" name="driverNIC" value="<%= driverNIC %>">
                                            <input type="hidden" name="newStatus" value="<%= status.equals("Enabled") ? "Disabled" : "Enabled" %>">
                                            <button type="submit" class="btn <%= status.equals("Enabled") ? "btn-danger" : "btn-success" %>">
                                                <%= status.equals("Enabled") ? "Disable" : "Enable" %>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                    <%
                                }
                            }
                            reader.close();
                        }
                    %>
                </tbody>
            </table>
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <a href="ManageDrivers.jsp" class="btn btn-primary">Add New Driver</a>
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
