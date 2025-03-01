package servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\Customers.txt";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerNo = request.getParameter("customerNo");

        File file = new File(FILE_PATH);
        File tempFile = new File("D:\\ICBT\\Customers_temp.txt");

        BufferedReader reader = new BufferedReader(new FileReader(file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

        String line;
        boolean found = false;

        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (!data[0].equals(customerNo)) {
                writer.write(line);
                writer.newLine();
            } else {
                found = true;
            }
        }

        reader.close();
        writer.close();

        if (found) {
            file.delete();
            tempFile.renameTo(file);
            response.getWriter().println("<script>alert('Customer deleted successfully.'); window.location='ViewCustomers.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Customer not found!'); window.location='ViewCustomers.jsp';</script>");
        }
    }
}
