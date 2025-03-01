<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Booking</title>
    <script>
        // Function to fill customer details when a customer is selected
        function fillCustomerDetails() {
            var customerData = document.getElementById("customerName").value;
            if (customerData) {
                var details = customerData.split("|");
                document.getElementById("address").value = details[1];
                //document.getElementById("telephone").value = details[2];
            } else {
                document.getElementById("address").value = "";
                //document.getElementById("telephone").value = "";
            }
        }

        // Function to calculate the total bill
        function calculateTotalBill() {
            var distance = parseFloat(document.getElementById("distance").value) || 0;
            var cabType = document.getElementById("cabType").value;
            var discount = parseFloat(document.getElementById("discount").value) || 0;
            var taxes = parseFloat(document.getElementById("taxes").value) || 0;
            
            var rate = (cabType === "Standard") ? 500 : 750;
            var total = (distance * rate) - discount + taxes;

            document.getElementById("totalBill").value = total.toFixed(2);
        }

        // Function to filter vehicles based on selected Cab Type
        function filterVehicles() {
            var selectedCabType = document.getElementById("cabType").value;
            var vehicleSelect = document.getElementById("vehicleNo");
            var vehicleOptions = vehicleSelect.options;

            for (var i = 0; i < vehicleOptions.length; i++) {
                var vehicleType = vehicleOptions[i].getAttribute("data-type");

                if (selectedCabType === "All" || vehicleType === selectedCabType) {
                    vehicleOptions[i].style.display = "block";
                } else {
                    vehicleOptions[i].style.display = "none";
                }
            }
        }

        // Function to update Driver Name and Vehicle Brand when a vehicle is selected
        function updateVehicleDetails() {
            var selectedVehicle = document.getElementById("vehicleNo").selectedOptions[0];

            if (selectedVehicle) {
                document.getElementById("driverName").value = selectedVehicle.getAttribute("data-driver") || "";
                document.getElementById("vehicleBrand").value = selectedVehicle.getAttribute("data-brand") || "";
            } else {
                document.getElementById("driverName").value = "";
                document.getElementById("vehicleBrand").value = "";
            }
        }

        // Event listeners
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("cabType").addEventListener("change", filterVehicles);
            document.getElementById("vehicleNo").addEventListener("change", updateVehicleDetails);
            filterVehicles();
        });
    </script>
</head>
<body>
    <h2>New Booking</h2>
    <form action="NewBookingServlet" method="post">
        <label>Booking Number:</label>
        <input type="text" name="bookingNumber" value="B<%= System.currentTimeMillis() %>" readonly><br><br>

        <label>Customer Name:</label>
        <select name="customerName" id="customerName" onchange="fillCustomerDetails()" required>
            <option value="">Select Customer</option>
            <% 
                String filePath = "D:\\ICBT\\Customers.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length >= 4) {
                            String customerValue = data[1] + "|" + data[2] + "|" + data[3];
            %>
            <option value="<%= customerValue %>"><%= data[1] %></option>
            <% 
                        }
                    }
                    reader.close();
                }
            %>
        </select>
        <a href="RegisterCustomer.jsp">
            <button type="button">New Customer</button>
        </a><br><br>

        <label>Address:</label>
        <input type="text" id="address" name="address" readonly><br><br>

        <label>Telephone:</label>
        <input type="text" id="telephone" name="telephone" required><br><br>

        <label>Destination:</label>
        <input type="text" name="destination" required><br><br>

        <label>Distance (km):</label>
        <input type="number" id="distance" name="distance" oninput="calculateTotalBill()" required><br><br>

        <label>Cab Type:</label>
        <select name="cabType" id="cabType" onchange="calculateTotalBill()" required>
            <option value="Standard">Standard</option>
            <option value="Luxury">Luxury</option>
        </select>

        <label>Vehicle No:</label>
        <select name="vehicleNo" id="vehicleNo" onchange="updateVehicleDetails()" required>
            <option value="">Select Vehicle</option>
            <% 
                String vehicleFilePath = "D:\\ICBT\\DriverDetails.txt";
                File vehicleFile = new File(vehicleFilePath);
                if (vehicleFile.exists()) {
                    BufferedReader vehicleReader = new BufferedReader(new FileReader(vehicleFile));
                    String vehicleLine;
                    while ((vehicleLine = vehicleReader.readLine()) != null) {
                        String[] vehicleData = vehicleLine.split(",");
                        if (vehicleData.length >= 7 && vehicleData[6].equals("Enabled")) {
            %>
            <!-- Store Driver Name and Vehicle Brand in data attributes -->
            <option value="<%= vehicleData[3] %>" data-type="<%= vehicleData[5] %>" data-driver="<%= vehicleData[1] %>" data-brand="<%= vehicleData[4] %>">
                <%= vehicleData[3] %> - <%= vehicleData[4] %> (<%= vehicleData[5] %>)
            </option>
            <% 
                        }
                    }
                    vehicleReader.close();
                }
            %>
        </select><br><br>

        <label>Driver Name:</label>
        <input type="text" id="driverName" name="driverName" readonly><br><br>

        <label>Vehicle Brand:</label>
        <input type="text" id="vehicleBrand" name="vehicleBrand" readonly><br><br>

        <label>Discount (LKR):</label>
        <input type="number" id="discount" name="discount" oninput="calculateTotalBill()"><br><br>

        <label>Taxes (LKR):</label>
        <input type="number" id="taxes" name="taxes" oninput="calculateTotalBill()"><br><br>

        <label>Total Bill (LKR):</label>
        <input type="text" id="totalBill" name="totalBill" readonly><br><br>

        <button type="submit">Submit Booking</button>
    </form>

    <br>
    <a href="ViewBookings.jsp" style="display: inline-block; padding: 10px 20px; margin: 10px; background-color: #4CAF50; color: white; text-align: center; text-decoration: none; border-radius: 5px; transition: background-color 0.3s ease;">View Bookings</a>
    <a href="dashboard.jsp" style="display: inline-block; padding: 10px 20px; margin: 10px; background-color: #4CAF50; color: white; text-align: center; text-decoration: none; border-radius: 5px; transition: background-color 0.3s ease;">Back to Dashboard</a>

</body>
</html>
