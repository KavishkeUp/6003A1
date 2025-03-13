package com.megacitycabs.servlet.Customers;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterCustomerServlet")
public class RegisterCustomerServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\Customers.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerRegNo = request.getParameter("customerRegNo");
        String customerName = request.getParameter("customerName");
        String customerAddress = request.getParameter("customerAddress");
        String customerNIC = request.getParameter("customerNIC");

        // Check for duplicate NIC
        boolean duplicateNIC = false;
        File file = new File(FILE_PATH);
        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] data = line.split(",");
                    if (data.length > 2 && data[3].equals(customerNIC)) {
                        duplicateNIC = true;
                        break;
                    }
                }
            }
        }

        if (duplicateNIC) {
            response.getWriter().println("<script>showError('NIC already exists! Please use a different NIC.');</script>");
        } else {
            // Save new customer details
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
                writer.write(customerRegNo + "," + customerName + "," + customerAddress + "," + customerNIC);
                writer.newLine();
            }

            // Redirect to ViewCustomers.jsp
            response.sendRedirect("ViewCustomers.jsp");
        }
    }
}
