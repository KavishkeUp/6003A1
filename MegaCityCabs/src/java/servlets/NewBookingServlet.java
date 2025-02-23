package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.BufferedWriter;

@WebServlet("/NewBookingServlet")
public class NewBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String destination = request.getParameter("destination");

        // Generate a booking number (simple example using timestamp)
        String bookingNumber = "B" + System.currentTimeMillis();

        // Store booking data in a text file (simulating database storage)
        String bookingData = bookingNumber + "," + customerName + "," + address + "," + telephone + "," + destination;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("D:\\ICBT\\Bookings.txt", true))) {
            writer.write(bookingData);
            writer.newLine();
        } catch (IOException e) {
            out.println("<h3>Error saving booking: " + e.getMessage() + "</h3>");
            return;
        }

        // Redirect to ViewBookings.jsp
        response.sendRedirect("ViewBookings.jsp");
    }
}
