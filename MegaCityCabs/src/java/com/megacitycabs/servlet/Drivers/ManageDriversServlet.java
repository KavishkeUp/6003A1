package com.megacitycabs.servlet.Drivers;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageDriversServlet")
public class ManageDriversServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\ICBT\\DriverDetails.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        String driverNIC = request.getParameter("driverNIC");
        String mobile = request.getParameter("mobile");
        String vehicleRegNo = request.getParameter("vehicleRegNo");
        String vehicleBrand = request.getParameter("vehicleBrand");
        String vehicleType = request.getParameter("vehicleType");

        // New drivers are enabled by default
        String status = "Enabled";

        try (FileWriter fileWriter = new FileWriter(FILE_PATH, true);
             PrintWriter writer = new PrintWriter(fileWriter)) {
            writer.println(driverName + "," + driverNIC + "," + mobile + "," + vehicleRegNo + "," + vehicleBrand + "," + vehicleType + "," + status);
        } catch (IOException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ManageDrivers.jsp");
    }
}

