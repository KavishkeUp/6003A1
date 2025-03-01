<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <!-- Include Bootstrap CSS from CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <h2 class="text-center">Booking Records</h2>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Booking No</th>
                    <th>Customer Name</th>
                    <th>Address</th>
                    <th>Telephone</th>
                    <th>Destination</th>
                    <th>Distance (km)</th>
                    <th>Cab Type</th>
                    <th>Vehicle No</th>
                    <th>Discount (LKR)</th>
                    <th>Taxes (LKR)</th>
                    <th>Total Bill (LKR)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String filePath = "D:\\ICBT\\Bookings.txt";
                    File file = new File(filePath);
                    if (file.exists()) {
                        BufferedReader reader = new BufferedReader(new FileReader(file));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            String[] data = line.split(",");
                            if (data.length >= 11) { // Ensure all fields (including Vehicle No) are present
                                String bookingNumber = data[0];
                %>
                <tr>
                    <td><%= data[0] %></td> <!-- Booking No -->
                    <td><%= data[1] %></td> <!-- Customer Name -->
                    <td><%= data[2] %></td> <!-- Address -->
                    <td><%= data[3] %></td> <!-- Telephone -->
                    <td><%= data[4] %></td> <!-- Destination -->
                    <td><%= data[5] %></td> <!-- Distance -->
                    <td><%= data[6] %></td> <!-- Cab Type -->
                    <td><%= data[7] %></td> <!-- Vehicle No -->
                    <td><%= data[8] %></td> <!-- Discount -->
                    <td><%= data[9] %></td> <!-- Taxes -->
                    <td><%= data[10] %></td> <!-- Total Bill -->
                    <td>
                        <form action="GenerateBillServlet" method="post" target="_blank">
                            <input type="hidden" name="bookingNumber" value="<%= bookingNumber %>">
                            <button type="submit" class="btn btn-primary btn-sm">Print Bill</button>
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

        <div class="text-center mt-4">
            <a href="NewBooking.jsp" class="btn btn-success">New Booking</a>
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js from CDN (optional for better functionality) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
