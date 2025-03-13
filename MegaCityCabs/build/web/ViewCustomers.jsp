<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers | Mega City Cab</title>
    
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

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #292929;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e0c097;
        }

        th {
            background-color: #1c1c1c;
            color: #e0c097;
        }

        tr:hover {
            background-color: #333;
        }

        a {
            color: #e0c097;
            text-decoration: none;
            padding: 5px;
            border-radius: 4px;
        }

        a:hover {
            background-color: #c89b3c;
            color: white;
        }

        .actions a {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .actions a:hover {
            background-color: #d32f2f;
        }

        footer {
            background-color: #1c1c1c;
            color: #e0c097;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;  /* Increased gap between footer and buttons */
        }

        footer a {
            color: #e0c097;
            text-decoration: none;
        }

        footer a:hover {
            color: white;
        }
    </style>

    <script>
        function confirmDelete(customerNo) {
            if (confirm("Are you sure you want to delete this customer?")) {
                window.location.href = "DeleteCustomerServlet?customerNo=" + customerNo;
            }
        }
    </script>
</head>

<body>

<header>
    <h1>Customer Management System</h1>
</header>

<h2>Customer List</h2>

<table>
    <tr>
        <th>Customer No</th>
        <th>Name</th>
        <th>Address</th>
        <th>NIC</th>
        <th>Actions</th>
    </tr>
    <%
        String filePath = "D:\\ICBT\\Customers.txt";
        File file = new File(filePath);
        if (file.exists()) {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 4) {
    %>
    <tr>
        <td><%= data[0] %></td>
        <td><%= data[1] %></td>
        <td><%= data[2] %></td>
        <td><%= data[3] %></td>
        <td class="actions">
            <a href="EditCustomer.jsp?customerNo=<%= data[0] %>">Edit</a>
            <a href="javascript:void(0);" onclick="confirmDelete('<%= data[0] %>');">Delete</a>
        </td>
    </tr>
    <%
            }
        }
        reader.close();
    }
    %>
</table>

<div style="text-align: center;">
    <a href="RegisterCustomer.jsp" style="background-color: #c89b3c; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px;">New Customer</a>
    <a href="dashboard.jsp" style="background-color: #999999; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px;">Back to Dashboard</a>
</div>

<footer>
    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    <p>Follow us on <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a> | 
       <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a> | 
       <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a></p>
</footer>

</body>
</html>
