<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers</title>
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
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
            padding: 5px;
            border-radius: 4px;
        }
        a:hover {
            background-color: #4CAF50;
            color: white;
        }
        .actions {
            display: flex;
            gap: 10px;
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
            text-align: center;
            padding: 10px;
            background-color: #333;
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
    <a href="RegisterCustomer.jsp" style="background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px;">New Customer</a>
    <a href="dashboard.jsp" style="background-color: #008CBA; color: white; padding: 10px 20px; text-decoration: none; border-radius: 4px;">Back to Dashboard</a>
</div>

<footer>
    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
</footer>

</body>
</html>
