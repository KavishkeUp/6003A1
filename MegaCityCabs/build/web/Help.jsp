<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Help - Mega City Cab System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-size: 18px;
        }
        .fa {
            margin-right: 8px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="text-center mb-4">
            <h1><i class="fa fa-question-circle"></i> Mega City Cab System - Help</h1>
            <p class="text-muted">Learn how to use the system efficiently</p>
        </div>

        <div class="accordion" id="helpAccordion">
            <!-- General User Guide -->
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-white text-decoration-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                            <i class="fa fa-user"></i> General User Guide
                        </button>
                    </h2>
                </div>
                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#helpAccordion">
                    <div class="card-body">
                        <p>As a regular user, you can perform the following actions:</p>
                        <ul>
                            <li><strong>Create a New Booking:</strong> Navigate to the "New Booking" page, fill in the required details, and submit.</li>
                            <li><strong>Create a New Customer:</strong> Click on "New Customer", enter details like Name, NIC, Address, and save.</li>
                            <li><strong>Edit or Delete Customers:</strong> Go to the "Customers" section, select a customer, and choose "Edit" or "Delete".</li>
                            <li><strong>View Bookings:</strong> The "Bookings" page lets you see all your reservations with status updates.</li>
                            <li><strong>Print Invoices:</strong> Select a completed booking and click on "Generate Invoice" to print a bill.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Admin Guide -->
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-white text-decoration-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                            <i class="fa fa-user-shield"></i> Admin Guide
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#helpAccordion">
                    <div class="card-body">
                        <p>As an Admin, you have access to additional functionalities:</p>
                        <ul>
                            <li><strong>Manage Drivers & Vehicles:</strong> Add new drivers and vehicles, view details, and update them.</li>
                            <li><strong>Enable/Disable Vehicles & Drivers:</strong> Temporarily deactivate or enable any driver or vehicle as needed.</li>
                            <li><strong>All Regular User Features:</strong> Admins can also create/edit bookings, manage customers, and print invoices.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h2 class="mb-0">
                        <button class="btn btn-link text-white text-decoration-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                            <i class="fa fa-info-circle"></i> Frequently Asked Questions (FAQ)
                        </button>
                    </h2>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#helpAccordion">
                    <div class="card-body">
                        <p><strong>Q1: How do I reset my password?</strong></p>
                        <p>A: Contact the system administrator to reset your credentials.</p>
                        
                        <p><strong>Q2: Can I print a booking invoice?</strong></p>
                        <p>A: Yes, you can print a booking by navigating to "View Bookings".</p>
                        
                        <p><strong>Q3: How to update customer details?</strong></p>
                        <p>A: Go to "Edit Customers", find your profile, and update the necessary details.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Back Button -->
        <div class="text-center mt-4">
            <a href="dashboard.jsp" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
