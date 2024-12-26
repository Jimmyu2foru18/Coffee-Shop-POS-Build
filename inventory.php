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
    <title>Inventory Management - StarBrew</title>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
    <div class="admin-container">
        <?php include 'includes/admin_nav.php'; ?>

        <main class="admin-main">
            <div class="inventory-container">
                <div class="inventory-header">
                    <h2>Inventory Management</h2>
                    <button id="addItemBtn" class="btn-primary">Add New Item</button>
                </div>

                <!-- Inventory Categories -->
                <div class="inventory-categories">
                    <button class="category-btn active" data-category="all">All Items</button>
                    <button class="category-btn" data-category="coffee">Coffee Beans</button>
                    <button class="category-btn" data-category="milk">Dairy Products</button>
                    <button class="category-btn" data-category="syrups">Syrups</button>
                    <button class="category-btn" data-category="food">Food Items</button>
                    <button class="category-btn" data-category="supplies">Supplies</button>
                </div>

                <!-- Inventory Search and Filter -->
                <div class="inventory-filters">
                    <input type="text" id="searchInventory" placeholder="Search items...">
                    <select id="stockFilter">
                        <option value="all">All Stock Levels</option>
                        <option value="low">Low Stock</option>
                        <option value="out">Out of Stock</option>
                        <option value="excess">Excess Stock</option>
                    </select>
                    <button id="exportInventory" class="btn-secondary">Export Data</button>
                </div>

                <!-- Inventory Table -->
                <div class="inventory-table-container">
                    <table id="inventoryTable">
                        <thead>
                            <tr>
                                <th>Item Code</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Current Stock</th>
                                <th>Unit</th>
                                <th>Reorder Level</th>
                                <th>Last Restocked</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="inventoryBody">
                            <!-- Populated by JavaScript -->
                        </tbody>
                    </table>
                </div>

                <!-- Inventory Forms (Hidden by default) -->
                <div id="addItemModal" class="modal">
                    <div class="modal-content">
                        <h3>Add New Inventory Item</h3>
                        <form id="addItemForm">
                            <div class="form-group">
                                <label>Item Name</label>
                                <input type="text" name="itemName" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" required>
                                    <option value="coffee">Coffee Beans</option>
                                    <option value="milk">Dairy Products</option>
                                    <option value="syrups">Syrups</option>
                                    <option value="food">Food Items</option>
                                    <option value="supplies">Supplies</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Initial Stock</label>
                                <input type="number" name="initialStock" required>
                            </div>
                            <div class="form-group">
                                <label>Unit</label>
                                <input type="text" name="unit" required>
                            </div>
                            <div class="form-group">
                                <label>Reorder Level</label>
                                <input type="number" name="reorderLevel" required>
                            </div>
                            <div class="form-buttons">
                                <button type="submit" class="btn-primary">Add Item</button>
                                <button type="button" class="btn-secondary" onclick="closeModal()">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="js/inventory.js"></script>
</body>
</html>
