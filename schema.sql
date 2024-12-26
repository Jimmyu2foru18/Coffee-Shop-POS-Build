-- StarBrew Database Schema

-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    rewards_points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);

-- Products table
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    is_available BOOLEAN DEFAULT true,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Customization options table
CREATE TABLE customization_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL, -- e.g., 'size', 'milk', 'syrup'
    additional_cost DECIMAL(10,2) DEFAULT 0.00
);

-- Product customizations table
CREATE TABLE product_customizations (
    product_id INT,
    option_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (option_id) REFERENCES customization_options(id),
    PRIMARY KEY (product_id, option_id)
);

-- Orders table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL, -- 'pending', 'preparing', 'completed', 'cancelled'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Order items table
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    customization_notes TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Inventory table
CREATE TABLE inventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit VARCHAR(20) NOT NULL,
    reorder_level INT NOT NULL,
    last_restocked TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Staff table
CREATE TABLE staff (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    role VARCHAR(20) NOT NULL, -- 'admin', 'manager', 'barista'
    hire_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Staff schedule table
CREATE TABLE staff_schedule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    day_of_week INT, -- 0-6 for Sunday-Saturday
    start_time TIME,
    end_time TIME,
    is_published BOOLEAN DEFAULT false,
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Staff training table
CREATE TABLE staff_training (
    id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    training_module VARCHAR(100),
    completion_date DATE,
    score INT,
    notes TEXT,
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Staff performance table
CREATE TABLE staff_performance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    date DATE,
    orders_processed INT,
    customer_rating DECIMAL(3,2),
    attendance_status VARCHAR(20),
    notes TEXT,
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Inventory transactions table
CREATE TABLE inventory_transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    inventory_id INT,
    transaction_type VARCHAR(20), -- 'received', 'used', 'waste', 'adjustment'
    quantity INT,
    unit_cost DECIMAL(10,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    staff_id INT,
    notes TEXT,
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Supplier table
CREATE TABLE suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    preferred BOOLEAN DEFAULT false
);

-- Purchase orders table
CREATE TABLE purchase_orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expected_delivery DATE,
    status VARCHAR(20), -- 'pending', 'ordered', 'received', 'cancelled'
    total_amount DECIMAL(10,2),
    staff_id INT,
    notes TEXT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Purchase order items table
CREATE TABLE purchase_order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    po_id INT,
    inventory_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (po_id) REFERENCES purchase_orders(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

-- Waste tracking table
CREATE TABLE waste_tracking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    inventory_id INT,
    quantity INT,
    reason VARCHAR(100),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    staff_id INT,
    cost DECIMAL(10,2),
    notes TEXT,
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);
