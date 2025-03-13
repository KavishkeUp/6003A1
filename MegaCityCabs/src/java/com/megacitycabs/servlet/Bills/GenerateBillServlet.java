package com.megacitycabs.servlet.Bills;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    private static final String BOOKINGS_FILE = "D:\\ICBT\\Bookings.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumber = request.getParameter("bookingNumber");

        // Find the booking in the file
        String[] bookingDetails = null;
        try (BufferedReader reader = new BufferedReader(new FileReader(BOOKINGS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 11 && data[0].equals(bookingNumber)) { // Ensure Vehicle No is included
                    bookingDetails = data;
                    break;
                }
            }
        }

        if (bookingDetails == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found.");
            return;
        }

        // Generate PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=Bill_" + bookingNumber + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add Title
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph title = new Paragraph("Mega City Cab - Invoice", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph(" "));

            // Booking Details Table
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            addTableRow(table, "Booking Number", bookingDetails[0]);
            addTableRow(table, "Customer Name", bookingDetails[1]);
            addTableRow(table, "Address", bookingDetails[2]);
            addTableRow(table, "Telephone", bookingDetails[3]);
            addTableRow(table, "Destination", bookingDetails[4]);
            addTableRow(table, "Distance (km)", bookingDetails[5]);
            addTableRow(table, "Cab Type", bookingDetails[6]);
            addTableRow(table, "Vehicle No", bookingDetails[7]); // Added Vehicle No
            addTableRow(table, "Discount (LKR)", bookingDetails[8]);
            addTableRow(table, "Taxes (LKR)", bookingDetails[9]);
            addTableRow(table, "Total Bill (LKR)", bookingDetails[10]);

            document.add(table);

            // Footer
            document.add(new Paragraph("Thank you for choosing Mega City Cab!", new Font(Font.FontFamily.HELVETICA, 12, Font.BOLDITALIC)));

            document.close();
        } catch (Exception e) {
            throw new ServletException("Error generating PDF", e);
        }
    }

    private void addTableRow(PdfPTable table, String label, String value) {
        PdfPCell cell1 = new PdfPCell(new Phrase(label));
        PdfPCell cell2 = new PdfPCell(new Phrase(value));
        table.addCell(cell1);
        table.addCell(cell2);
    }
}
