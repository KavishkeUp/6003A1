🚖 Mega City Cab Reservation System

An online vehicle reservation system for Mega City Cab, built using Java EE 7, Servlets, and JSP, with Apache Tomcat as the server.

📌 Features

🔐 User Authentication – Secure login system for customers and admins.
📝 New Booking – Customers can book a cab by selecting the cab type and destination.
💰 Billing System – Calculates total fare based on distance, cab type, discounts, and taxes.
📄 Invoice Generation – Generates PDF invoices for completed bookings.
🚗 Car & Driver Management – Admins can manage available vehicles and assign drivers.
📊 Booking History – Customers and admins can view past bookings.

📦 Technologies Used

Java EE 7 (Servlets, JSP)
Apache Tomcat
iText PDF (for invoice generation)
Git & GitHub (Version Control)
HTML, CSS, JavaScript (Frontend)

🚀 Setup & Installation

1️⃣ Clone the Repository
git clone https://github.com/your-username/mega-city-cab.git](https://github.com/KavishkeUp/6003A1.git
cd mega-city-cab

2️⃣ Open in NetBeans
Open NetBeans IDE.
Click File → Open Project and select the folder.
Ensure Apache Tomcat is installed and configured.

3️⃣ Create Required Data Files
Before running the application, create the following text files at the specified locations:

📂 D:\ICBT

📄 Bookings.txt → Stores all cab booking records.
📄 Customers.txt → Stores registered customer details.
📄 DriverDetails.txt → Stores driver assignments and details.

4️⃣ Run the Application
Start Apache Tomcat in NetBeans.
Open your browser and visit:
http://localhost:8080/MegaCityCabs

📝 File Structure

📂 MegaCityCabs
 ┣ 📂 src
 ┃ ┣ 📂 servlets
 ┃ ┃ ┣ 📄 ViewDriversServlet.java
 ┃ ┃ ┣ 📄 RegisterCustomerServlet.java
 ┃ ┃ ┣ 📄 NewBookingServlet.java
 ┃ ┃ ┣ 📄 ManageDriversServlet.java
 ┃ ┃ ┣ 📄 LogoutServlet.java
 ┃ ┃ ┣ 📄 LoginServlet.java 
 ┃ ┃ ┣ 📄 GenerateBillServlet.java 
 ┃ ┃ ┣ 📄 EditCustomerServlet.java 
 ┃ ┃ ┣ 📄 DeleteCustomerServlet.java 
 ┃ ┃ ┣ 📄 DeleteBookingServlet.java 
 ┃ ┗ 📂 utils
 ┣ 📂 web
 ┃ ┣ 📄 EditCustomer.jsp
 ┃ ┣ 📄 Help.jsp
 ┃ ┣ 📄 Login.jsp
 ┃ ┣ 📄 ManageDrivers.jsp
 ┃ ┣ 📄 NewBooking.jsp
 ┃ ┣ 📄 RegisterCustomer.jsp
 ┃ ┣ 📄 ViewBookings.jsp
 ┃ ┣ 📄 ViewCustomers.jsp
 ┃ ┣ 📄 ViewDrivers.jsp
 ┃ ┣ 📄 dashboard.jsp
 ┃ ┣ 📄 index.jsp
 ┗ 📄 README.md

📜 License
This project is open-source under the MIT License.
