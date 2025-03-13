package com.megacitycabs.servlet.Customers;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\Customers.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerNo = request.getParameter("customerNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String newNIC = request.getParameter("nic");
        String oldNIC = request.getParameter("oldNIC");
        String existingNICs = request.getParameter("existingNICs");

        if (!newNIC.equals(oldNIC) && existingNICs.contains(newNIC)) {
            response.getWriter().println("<script>alert('Duplicate NIC not allowed!'); window.history.back();</script>");
            return;
        }

        File file = new File(FILE_PATH);
        File tempFile = new File("D:\\ICBT\\Customers_temp.txt");

        BufferedReader reader = new BufferedReader(new FileReader(file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

        String line;
        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (data[0].equals(customerNo)) {
                writer.write(customerNo + "," + name + "," + address + "," + newNIC);
            } else {
                writer.write(line);
            }
            writer.newLine();
        }

        reader.close();
        writer.close();

        file.delete();
        tempFile.renameTo(file);

        response.sendRedirect("ViewCustomers.jsp");
    }
}
