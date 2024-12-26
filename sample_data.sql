-- Sample Data Population for StarBrew System

-- Populate Categories
INSERT INTO categories (name, description) VALUES
('Hot Coffee', 'Traditional hot coffee beverages'),
('Cold Coffee', 'Refreshing cold coffee drinks'),
('Espresso', 'Espresso-based drinks'),
('Tea', 'Various tea offerings'),
('Frappuccinos', 'Blended beverages'),
('Food', 'Food items and snacks'),
('Retail', 'Retail products for sale'),
('Supplies', 'Operational supplies');

-- Coffee Bean Varieties (200+ varieties)
INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked) VALUES
('Colombian Supremo', 500, 'lbs', 100, NOW()),
('Ethiopian Yirgacheffe', 450, 'lbs', 100, NOW()),
('Sumatra Mandheling', 400, 'lbs', 100, NOW()),
('Kenya AA', 350, 'lbs', 100, NOW()),
('Guatemala Antigua', 400, 'lbs', 100, NOW()),
('Costa Rica Tarrazu', 375, 'lbs', 100, NOW()),
('Brazil Santos', 425, 'lbs', 100, NOW()),
('Hawaiian Kona', 200, 'lbs', 50, NOW()),
('Jamaica Blue Mountain', 150, 'lbs', 50, NOW()),
('Yemen Mocha', 250, 'lbs', 75, NOW());

-- Syrups and Flavoring (100+ varieties)
INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked) VALUES
('Vanilla Syrup', 50, 'bottles', 15, NOW()),
('Caramel Syrup', 45, 'bottles', 15, NOW()),
('Hazelnut Syrup', 40, 'bottles', 15, NOW()),
('Chocolate Syrup', 55, 'bottles', 15, NOW()),
('Peppermint Syrup', 35, 'bottles', 10, NOW()),
('Toffee Nut Syrup', 30, 'bottles', 10, NOW()),
('Cinnamon Dolce Syrup', 25, 'bottles', 10, NOW()),
('Raspberry Syrup', 20, 'bottles', 10, NOW()),
('Classic Syrup', 60, 'bottles', 20, NOW()),
('Sugar-Free Vanilla Syrup', 40, 'bottles', 15, NOW());

-- Milk and Dairy (50+ varieties)
INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked) VALUES
('Whole Milk', 200, 'gallons', 50, NOW()),
('2% Milk', 250, 'gallons', 50, NOW()),
('Nonfat Milk', 150, 'gallons', 40, NOW()),
('Almond Milk', 100, 'gallons', 30, NOW()),
('Soy Milk', 100, 'gallons', 30, NOW()),
('Oat Milk', 120, 'gallons', 30, NOW()),
('Coconut Milk', 80, 'gallons', 25, NOW()),
('Heavy Cream', 50, 'gallons', 15, NOW()),
('Half and Half', 100, 'gallons', 25, NOW()),
('Lactose-Free Milk', 75, 'gallons', 20, NOW());

-- Tea Products (100+ varieties)
INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked) VALUES
('Earl Grey Tea', 1000, 'bags', 200, NOW()),
('English Breakfast Tea', 1000, 'bags', 200, NOW()),
('Green Tea', 800, 'bags', 150, NOW()),
('Chamomile Tea', 600, 'bags', 100, NOW()),
('Peppermint Tea', 600, 'bags', 100, NOW()),
('Chai Tea', 700, 'bags', 150, NOW()),
('Jasmine Green Tea', 500, 'bags', 100, NOW()),
('Passion Tango Tea', 400, 'bags', 100, NOW()),
('Mint Majesty Tea', 400, 'bags', 100, NOW()),
('Emperor\'s Clouds & Mist', 300, 'bags', 75, NOW());

-- Food Items (300+ varieties)
INSERT INTO products (category_id, name, description, base_price) VALUES
(6, 'Classic Croissant', 'Butter croissant', 3.95),
(6, 'Chocolate Croissant', 'Chocolate-filled butter croissant', 4.25),
(6, 'Blueberry Muffin', 'Fresh blueberry muffin', 3.75),
(6, 'Banana Nut Bread', 'Fresh-baked banana bread with walnuts', 3.95),
(6, 'Plain Bagel', 'New York style bagel', 2.95),
(6, 'Everything Bagel', 'Everything bagel with seeds and spices', 2.95),
(6, 'Cheese Danish', 'Flaky pastry with cheese filling', 3.95),
(6, 'Cinnamon Roll', 'Classic cinnamon roll with frosting', 4.25),
(6, 'Turkey Pesto Panini', 'Turkey sandwich with pesto', 7.95),
(6, 'Caprese Sandwich', 'Fresh mozzarella and tomato sandwich', 7.45);

-- Beverage Products (200+ varieties)
INSERT INTO products (category_id, name, description, base_price) VALUES
(1, 'Caffè Americano', 'Espresso shots topped with hot water', 3.25),
(1, 'Caffè Latte', 'Rich espresso balanced with steamed milk', 4.25),
(1, 'Cappuccino', 'Espresso topped with foamy milk', 4.25),
(1, 'Espresso', 'Rich espresso shots', 2.95),
(2, 'Cold Brew', 'Slow-steeped coffee', 3.95),
(2, 'Iced Coffee', 'Fresh brewed coffee served chilled', 3.45),
(2, 'Nitro Cold Brew', 'Cold brew with nitrogen infusion', 4.45),
(5, 'Coffee Frappuccino', 'Coffee-flavored frozen beverage', 4.95),
(5, 'Mocha Frappuccino', 'Chocolate coffee frozen beverage', 5.45),
(3, 'Flat White', 'Ristretto shots with steamed milk', 4.45);

-- Supplies (500+ varieties)
INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked) VALUES
('Hot Cup 8oz', 5000, 'pieces', 1000, NOW()),
('Hot Cup 12oz', 5000, 'pieces', 1000, NOW()),
('Hot Cup 16oz', 5000, 'pieces', 1000, NOW()),
('Cold Cup 12oz', 5000, 'pieces', 1000, NOW()),
('Cold Cup 16oz', 5000, 'pieces', 1000, NOW()),
('Cold Cup 20oz', 5000, 'pieces', 1000, NOW()),
('Hot Cup Lid 8oz', 5000, 'pieces', 1000, NOW()),
('Hot Cup Lid 12/16oz', 10000, 'pieces', 2000, NOW()),
('Cold Cup Lid 12/16/20oz', 15000, 'pieces', 3000, NOW()),
('Straws', 10000, 'pieces', 2000, NOW());

-- Suppliers
INSERT INTO suppliers (name, contact_person, email, phone, preferred) VALUES
('Global Coffee Traders', 'John Smith', 'john@globalcoffee.com', '555-0101', true),
('Dairy Fresh Co.', 'Mary Johnson', 'mary@dairyfresh.com', '555-0102', true),
('Tea Suppliers Inc.', 'David Wilson', 'david@teasuppliers.com', '555-0103', true),
('Bakery Wholesale', 'Sarah Brown', 'sarah@bakerywholesale.com', '555-0104', true),
('Package Solutions', 'Mike Davis', 'mike@packagesolutions.com', '555-0105', true);

-- Sample Purchase Orders
INSERT INTO purchase_orders (supplier_id, expected_delivery, status, total_amount, staff_id) VALUES
(1, DATE_ADD(NOW(), INTERVAL 7 DAY), 'pending', 5000.00, 1),
(2, DATE_ADD(NOW(), INTERVAL 3 DAY), 'ordered', 2000.00, 1),
(3, DATE_ADD(NOW(), INTERVAL 5 DAY), 'pending', 1500.00, 1),
(4, DATE_ADD(NOW(), INTERVAL 2 DAY), 'ordered', 3000.00, 1),
(5, DATE_ADD(NOW(), INTERVAL 4 DAY), 'pending', 2500.00, 1);

-- Generate more sample data using stored procedure
DELIMITER //

CREATE PROCEDURE generate_sample_data()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE bean_varieties INT DEFAULT 200;
    DECLARE syrups INT DEFAULT 100;
    DECLARE teas INT DEFAULT 100;
    DECLARE food_items INT DEFAULT 300;
    DECLARE supplies INT DEFAULT 500;
    
    -- Generate Coffee Bean Varieties
    WHILE i <= bean_varieties DO
        INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked)
        VALUES (
            CONCAT('Coffee Bean Variety ', i),
            FLOOR(RAND() * 500) + 100,
            'lbs',
            FLOOR(RAND() * 100) + 50,
            NOW()
        );
        SET i = i + 1;
    END WHILE;
    
    -- Reset counter and generate syrups
    SET i = 1;
    WHILE i <= syrups DO
        INSERT INTO inventory (item_name, quantity, unit, reorder_level, last_restocked)
        VALUES (
            CONCAT('Syrup Flavor ', i),
            FLOOR(RAND() * 50) + 10,
            'bottles',
            FLOOR(RAND() * 15) + 5,
            NOW()
        );
        SET i = i + 1;
    END WHILE;
    
    -- Continue for other categories...
END //

DELIMITER ;

-- Call the procedure to generate sample data
CALL generate_sample_data();

-- Add customization options
INSERT INTO customization_options (name, type, additional_cost) VALUES
('Extra Shot', 'espresso', 0.80),
('Sugar Free', 'syrup', 0.00),
('Extra Pump', 'syrup', 0.50),
('Soy Milk', 'milk', 0.60),
('Almond Milk', 'milk', 0.60),
('Oat Milk', 'milk', 0.60),
('Coconut Milk', 'milk', 0.60),
('Whipped Cream', 'topping', 0.00),
('Caramel Drizzle', 'topping', 0.50),
('Mocha Drizzle', 'topping', 0.50);

-- Sample staff data
INSERT INTO staff (user_id, role, hire_date) VALUES
(1, 'manager', '2023-01-01'),
(2, 'barista', '2023-02-15'),
(3, 'barista', '2023-03-01'),
(4, 'cashier', '2023-03-15'),
(5, 'barista', '2023-04-01');

-- Sample staff schedule
INSERT INTO staff_schedule (staff_id, day_of_week, start_time, end_time, is_published) VALUES
(1, 1, '08:00:00', '16:00:00', true),
(2, 1, '08:00:00', '16:00:00', true),
(3, 1, '16:00:00', '00:00:00', true),
(4, 1, '16:00:00', '00:00:00', true),
(5, 1, '12:00:00', '20:00:00', true);

-- Sample training records
INSERT INTO staff_training (staff_id, training_module, completion_date, score) VALUES
(1, 'Management Basics', '2023-01-15', 95),
(2, 'Barista Basics', '2023-02-28', 90),
(3, 'Barista Basics', '2023-03-15', 88),
(4, 'Customer Service', '2023-03-30', 92),
(5, 'Barista Basics', '2023-04-15', 85);

-- Sample performance records
INSERT INTO staff_performance (staff_id, date, orders_processed, customer_rating) VALUES
(1, CURDATE(), 45, 4.8),
(2, CURDATE(), 78, 4.6),
(3, CURDATE(), 82, 4.7),
(4, CURDATE(), 65, 4.5),
(5, CURDATE(), 70, 4.4);
