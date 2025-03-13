package com.megacitycabs.servlet.Bookings;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\Bookings.txt";  // Fixed file path

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumber = request.getParameter("bookingNumber");
        File inputFile = new File(FILE_PATH);
        File tempFile = new File("D:\\ICBT\\Bookings_temp.txt");

        boolean recordDeleted = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] booking = line.split(",");
                if (!booking[0].equals(bookingNumber)) {  // Only remove matching record
                    writer.write(line);
                    writer.newLine();
                } else {
                    recordDeleted = true;
                }
            }
        }

        if (recordDeleted) {
            inputFile.delete();
            tempFile.renameTo(inputFile);
        } else {
            tempFile.delete();  // If no record was deleted, discard temp file
        }

        response.sendRedirect("ViewBookings.jsp");
    }
}
