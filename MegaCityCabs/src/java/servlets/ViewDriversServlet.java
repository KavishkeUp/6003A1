package servlets;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewDriversServlet")
public class ViewDriversServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\DriverDetails.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverNIC = request.getParameter("driverNIC");
        String newStatus = request.getParameter("newStatus");

        List<String> driverRecords = new ArrayList<>();
        boolean updated = false;

        File file = new File(FILE_PATH);
        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] details = line.split(",");
                    if (details.length == 7 && details[1].equals(driverNIC)) {
                        // Update status of the selected driver
                        details[6] = newStatus;
                        updated = true;
                    }
                    driverRecords.add(String.join(",", details));
                }
            }

            // Rewrite updated data back to the file
            if (updated) {
                try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_PATH, false))) {
                    for (String record : driverRecords) {
                        writer.println(record);
                    }
                }
            }
        }

        response.sendRedirect("ViewDrivers.jsp");
    }
}
