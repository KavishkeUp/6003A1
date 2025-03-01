<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Drivers | Mega City Cab</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</body>
</html>
