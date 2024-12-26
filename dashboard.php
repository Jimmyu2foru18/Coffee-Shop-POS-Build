<?php
session_start();
require_once '../src/config/config.php';
require_once '../src/includes/admin_auth.php';

// Check if user is admin
if (!isAdmin()) {
    redirect('login.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StarBrew Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="admin-container">
        <nav class="admin-nav">
            <div class="nav-header">
                <h2>StarBrew Admin</h2>
            </div>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="inventory.php">Inventory Management</a></li>
                <li><a href="staff.php">Staff Management</a></li>
                <li><a href="reports.php">Reports & Analytics</a></li>
                <li><a href="schedule.php">Staff Scheduling</a></li>
                <li><a href="menu.php">Menu Management</a></li>
            </ul>
        </nav>

        <main class="admin-main">
            <div class="dashboard-grid">
                <!-- Quick Stats -->
                <div class="stat-card">
                    <h3>Today's Sales</h3>
                    <div id="todaySales">Loading...</div>
                </div>
                <div class="stat-card">
                    <h3>Active Staff</h3>
                    <div id="activeStaff">Loading...</div>
                </div>
                <div class="stat-card">
                    <h3>Low Stock Items</h3>
                    <div id="lowStock">Loading...</div>
                </div>
                <div class="stat-card">
                    <h3>Pending Orders</h3>
                    <div id="pendingOrders">Loading...</div>
                </div>

                <!-- Charts -->
                <div class="chart-container">
                    <canvas id="salesChart"></canvas>
                </div>
                <div class="chart-container">
                    <canvas id="inventoryChart"></canvas>
                </div>

                <!-- Recent Activities -->
                <div class="recent-activities">
                    <h3>Recent Activities</h3>
                    <div id="activitiesList">Loading...</div>
                </div>

                <!-- Alerts -->
                <div class="alerts-section">
                    <h3>Important Alerts</h3>
                    <div id="alertsList">Loading...</div>
                </div>
            </div>
        </main>
    </div>

    <script src="js/dashboard.js"></script>
</body>
</html>
