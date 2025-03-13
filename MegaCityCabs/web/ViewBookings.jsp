<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings | Mega City Cab</title>
    
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
        h2 {
            font-size: 2rem;
            margin-bottom: 30px;
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
        .btn-success {
            background-color: #4CAF50;
            color: white;
        }
        .btn-success:hover {
            background-color: #45a049;
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
        .btn-container {
            margin-bottom: 50px; /* Increase the gap between footer and buttons */
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <h2 class="text-center">Booking Records</h2>
        <table class="table table-bordered table-striped">
            <thead>
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

        <div class="text-center mt-4 btn-container">
            <a href="NewBooking.jsp" class="btn btn-success">New Booking</a>
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
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
