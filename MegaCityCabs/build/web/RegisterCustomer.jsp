<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer | Mega City Cab</title>
    
    <!-- Bootstrap & FontAwesome -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #e0c097;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1c1c1c;
            color: #e0c097;
            padding: 15px 0;
            text-align: center;
            font-size: 24px;
        }

        h2 {
            color: #e0c097;
            text-align: center;
            margin-top: 30px;
        }

        .form-container {
            width: 40%;
            margin: 30px auto;
            padding: 20px;
            background-color: #292929;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #e0c097;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #e0c097;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
            background-color: #333;
            color: #e0c097;
        }

        .form-container input:focus {
            border-color: #c89b3c;
            outline: none;
        }

        .form-container button {
            background-color: #c89b3c;
            color: black;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-container button:hover {
            background-color: #e0c097;
            color: white;
        }

        .form-container a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: #e0c097;
            font-weight: bold;
        }

        .form-container a:hover {
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
    </style>
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
    <p>Follow us on <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a> | 
       <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a> | 
       <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a></p>
</footer>

</body>
</html>
