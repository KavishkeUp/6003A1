<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Dashboard | Mega City Cab</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="jumbotron mt-5">
            <h1 class="display-4">Welcome, <%= sessionObj.getAttribute("username") %>!</h1>
            <p class="lead">Manage cab bookings, customers, and drivers.</p>
            <hr class="my-4">
            <p>
                <a class="btn btn-primary btn-lg" href="NewBooking.jsp" role="button">Create New Booking</a>
                <a class="btn btn-secondary btn-lg" href="ViewBookings.jsp" role="button">View Bookings</a>
            </p>
            <p class="text-right">
                <a href="LogoutServlet" class="btn btn-danger">Logout</a>
            </p>
        </div>
    </div>
</body>
</html>
