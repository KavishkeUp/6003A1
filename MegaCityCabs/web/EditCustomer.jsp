<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
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
    <a href="ViewCustomers.jsp">Back to Customers</a>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
