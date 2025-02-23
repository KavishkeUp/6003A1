<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>New Booking</h2>
        <form action="NewBookingServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Customer Name:</label>
                <input type="text" name="customerName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address:</label>
                <input type="text" name="address" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Telephone:</label>
                <input type="text" name="telephone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Destination:</label>
                <input type="text" name="destination" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit Booking</button>
        </form>
    </div>
</body>
</html>
