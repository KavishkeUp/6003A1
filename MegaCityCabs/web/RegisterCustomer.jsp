<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        .form-container {
            width: 40%;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-container input:focus {
            border-color: #4CAF50;
            outline: none;
        }
        .form-container button {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-container button:hover {
            background-color: #45a049;
        }
        .form-container a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        .form-container a:hover {
            color: #45a049;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            margin-top: 30px;
        }
    </style>
    <script>
        function showError(message) {
            alert(message);
            window.history.back(); // Go back to the form if error occurs
        }
    </script>
</head>
<body>

<header>
    <h1>Customer Management System</h1>
</header>

<h2>Register New Customer</h2>

<div class="form-container">
    <form action="RegisterCustomerServlet" method="post">
        <label>Customer Registration Number:</label>
        <input type="text" name="customerRegNo" value="C<%= System.currentTimeMillis() %>" readonly><br>

        <label>Name:</label>
        <input type="text" name="customerName" required><br>

        <label>Address:</label>
        <input type="text" name="customerAddress" required><br>

        <label>NIC:</label>
        <input type="text" name="customerNIC" required><br>

        <button type="submit">Register Customer</button>
    </form>

    <div style="text-align: center;">
        <a href="ViewCustomers.jsp">View Customers</a> | 
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</div>

<footer>
    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
</footer>

</body>
</html>
