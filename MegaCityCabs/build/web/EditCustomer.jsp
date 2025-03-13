<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer | Mega City Cab</title>
    
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
            margin-top: 20px;
        }

        form {
            width: 40%;
            margin: 20px auto;
            background-color: #292929;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        form label {
            color: #e0c097;
            display: block;
            margin-bottom: 6px;
        }

        form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        form input:focus {
            border-color: #4CAF50;
            outline: none;
        }

        form button {
            background-color: #c89b3c; 
            color: white;
            padding: 10px 20px; 
            width: 100%;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none; 
            border-radius: 4px;
        }

        form button:hover {
            background-color: #45a049;
        }

        form a {
            display: inline-block;
            margin-top: 12px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        form a:hover {
            color: #45a049;
        }

        footer {
            background-color: #1c1c1c;
            color: #e0c097;
            padding: 15px 0;
            text-align: center;
            margin-top: 40px;  /* Reduced gap */
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
        function validateNIC() {
            var nic = document.getElementById("nic").value;
            var existingNICs = document.getElementById("existingNICs").value.split(",");

            if (existingNICs.includes(nic)) {
                alert("Duplicate NIC not allowed!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<header>
    <h1>Customer Management System</h1>
</header>

<h2>Edit Customer</h2>

<%
    String customerNo = request.getParameter("customerNo");
    String filePath = "D:\\ICBT\\Customers.txt";
    File file = new File(filePath);
    String customerData = "";
    String existingNICs = "";

    if (file.exists()) {
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (data.length >= 4) {
                existingNICs += data[3] + ",";
                if (data[0].equals(customerNo)) {
                    customerData = line;
                }
            }
        }
        reader.close();
    }

    String[] customerDetails = customerData.split(",");
%>

<form action="EditCustomerServlet" method="post" onsubmit="return validateNIC();">
    <input type="hidden" name="existingNICs" id="existingNICs" value="<%= existingNICs %>">
    <input type="hidden" name="oldNIC" value="<%= customerDetails[3] %>">
    
    <label>Customer No:</label>
    <input type="text" name="customerNo" value="<%= customerDetails[0] %>" readonly><br><br>

    <label>Name:</label>
    <input type="text" name="name" value="<%= customerDetails[1] %>" required><br><br>

    <label>Address:</label>
    <input type="text" name="address" value="<%= customerDetails[2] %>" required><br><br>

    <label>NIC:</label>
    <input type="text" name="nic" id="nic" value="<%= customerDetails[3] %>" required><br><br>

    <button type="submit">Update</button>
</form>

<br>
<div style="text-align: center;">
    <a href="ViewCustomers.jsp" class="btn btn-secondary btn-sm">Back to Customers</a> | 
    <a href="dashboard.jsp" class="btn btn-secondary btn-sm">Back to Dashboard</a>
</div>

<footer>
    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    <p>Follow us on <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a> | 
       <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a> | 
       <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a></p>
</footer>

</body>
</html>
