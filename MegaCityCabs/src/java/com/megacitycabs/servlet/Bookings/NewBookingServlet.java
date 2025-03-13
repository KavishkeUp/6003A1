package com.megacitycabs.servlet.Bookings;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewBookingServlet")
public class NewBookingServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\Bookings.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumber = request.getParameter("bookingNumber");
        String customerData = request.getParameter("customerName");
        
        String customerName = "";
        String address = "";
        String telephone = "";

        if (customerData != null && !customerData.isEmpty()) {
            String[] customerDetails = customerData.split("\\|");
            if (customerDetails.length >= 3) {
                customerName = customerDetails[0];
                address = customerDetails[1];
                telephone = customerDetails[2];
            }
        }

        String destination = request.getParameter("destination");
        String distance = request.getParameter("distance");
        String cabType = request.getParameter("cabType");
        String vehicleNo = request.getParameter("vehicleNo"); // Get selected Vehicle No
        String discount = request.getParameter("discount");
        String taxes = request.getParameter("taxes");
        String totalBill = request.getParameter("totalBill");

        // Ensure null values are replaced with defaults
        if (distance == null || distance.isEmpty()) distance = "0";
        if (discount == null || discount.isEmpty()) discount = "0";
        if (taxes == null || taxes.isEmpty()) taxes = "0";
        if (totalBill == null || totalBill.isEmpty()) totalBill = "0";
        if (vehicleNo == null || vehicleNo.isEmpty()) vehicleNo = "N/A"; // Default if no vehicle is selected

        // Store booking data in text file (added vehicleNo)
        String bookingData = bookingNumber + "," + customerName + "," + address + "," + telephone + "," + destination + "," + 
                             distance + "," + cabType + "," + vehicleNo + "," + discount + "," + taxes + "," + totalBill;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(bookingData);
            writer.newLine();
        }

        // Redirect to ViewBookings.jsp
        response.sendRedirect("ViewBookings.jsp");
    }
}
