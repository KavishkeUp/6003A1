<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <h2 class="text-center">Customer Bookings</h2>

    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Booking Number</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>Telephone</th>
                <th>Destination</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                String filePath = "D:\\ICBT\\Bookings.txt";  // Corrected file path
                File file = new File(filePath);

                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    
                    while ((line = reader.readLine()) != null) {
                        String[] booking = line.split(",");
                        if (booking.length >= 5) {
            %>
            <tr>
                <td><%= booking[0] %></td>  <!-- Fixed null issue -->
                <td><%= booking[1] %></td>
                <td><%= booking[2] %></td>
                <td><%= booking[3] %></td>
                <td><%= booking[4] %></td>
                <td>
                    <a href="DeleteBookingServlet?bookingNumber=<%= booking[0] %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <%
                        }
                    }
                    reader.close();
                } else {
            %>
            <tr>
                <td colspan="6" class="text-center">No bookings available</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>

</body>
</html>
