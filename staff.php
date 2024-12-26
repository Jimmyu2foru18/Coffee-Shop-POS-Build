<?php
session_start();
require_once '../src/config/config.php';
require_once '../src/includes/admin_auth.php';

if (!isAdmin()) {
    redirect('login.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Management - StarBrew</title>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
    <div class="admin-container">
        <?php include 'includes/admin_nav.php'; ?>

        <main class="admin-main">
            <div class="staff-container">
                <div class="staff-header">
                    <h2>Staff Management</h2>
                    <button id="addStaffBtn" class="btn-primary">Add New Staff</button>
                </div>

                <!-- Staff Management Tabs -->
                <div class="staff-tabs">
                    <button class="tab-btn active" data-tab="employees">Employees</button>
                    <button class="tab-btn" data-tab="schedule">Schedule</button>
                    <button class="tab-btn" data-tab="performance">Performance</button>
                    <button class="tab-btn" data-tab="training">Training</button>
                </div>

                <!-- Employees Tab -->
                <div class="tab-content" id="employeesTab">
                    <div class="staff-filters">
                        <input type="text" id="searchStaff" placeholder="Search staff...">
                        <select id="roleFilter">
                            <option value="all">All Roles</option>
                            <option value="manager">Managers</option>
                            <option value="barista">Baristas</option>
                            <option value="cashier">Cashiers</option>
                        </select>
                        <select id="statusFilter">
                            <option value="all">All Status</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="staff-table-container">
                        <table id="staffTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Role</th>
                                    <th>Contact</th>
                                    <th>Schedule</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="staffBody">
                                <!-- Populated by JavaScript -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Schedule Tab -->
                <div class="tab-content hidden" id="scheduleTab">
                    <div class="schedule-controls">
                        <div class="date-navigation">
                            <button id="prevWeek">&lt;</button>
                            <span id="currentWeek">Week of Dec 24, 2024</span>
                            <button id="nextWeek">&gt;</button>
                        </div>
                        <button id="publishSchedule" class="btn-primary">Publish Schedule</button>
                    </div>
                    <div class="schedule-grid">
                        <!-- Populated by JavaScript -->
                    </div>
                </div>

                <!-- Performance Tab -->
                <div class="tab-content hidden" id="performanceTab">
                    <div class="performance-metrics">
                        <div class="metric-card">
                            <h3>Average Customer Rating</h3>
                            <div class="metric-value">4.8/5.0</div>
                        </div>
                        <div class="metric-card">
                            <h3>Orders Per Hour</h3>
                            <div class="metric-value">25</div>
                        </div>
                        <div class="metric-card">
                            <h3>Training Completion</h3>
                            <div class="metric-value">92%</div>
                        </div>
                    </div>
                    <div class="performance-charts">
                        <!-- Charts will be rendered here -->
                    </div>
                </div>

                <!-- Training Tab -->
                <div class="tab-content hidden" id="trainingTab">
                    <div class="training-modules">
                        <div class="module-card">
                            <h3>Basic Barista Training</h3>
                            <p>Essential skills for new baristas</p>
                            <button class="btn-secondary">Manage Module</button>
                        </div>
                        <div class="module-card">
                            <h3>Advanced Coffee Making</h3>
                            <p>Advanced techniques and recipes</p>
                            <button class="btn-secondary">Manage Module</button>
                        </div>
                        <div class="module-card">
                            <h3>Customer Service</h3>
                            <p>Customer interaction and handling</p>
                            <button class="btn-secondary">Manage Module</button>
                        </div>
                    </div>
                </div>

                <!-- Add Staff Modal -->
                <div id="addStaffModal" class="modal">
                    <div class="modal-content">
                        <h3>Add New Staff Member</h3>
                        <form id="addStaffForm">
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" name="fullName" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <select name="role" required>
                                    <option value="manager">Manager</option>
                                    <option value="barista">Barista</option>
                                    <option value="cashier">Cashier</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Contact Number</label>
                                <input type="tel" name="contact">
                            </div>
                            <div class="form-buttons">
                                <button type="submit" class="btn-primary">Add Staff</button>
                                <button type="button" class="btn-secondary" onclick="closeModal()">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="js/staff.js"></script>
</body>
</html>
