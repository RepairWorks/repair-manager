-- ============================================
-- DEVICE TYPES
-- ============================================
INSERT INTO device_types (name) VALUES
('Laptop'),
('Smartphone'),
('Tablet'),
('Console');

-- ============================================
-- CUSTOMERS
-- ============================================
INSERT INTO customers (first_name, last_name, phone, email) VALUES
('Michael', 'Smith', '123456789', 'michael@example.com'),
('Sarah', 'Johnson', '987654321', 'sarah@example.com'),
('John', 'Doe', '555555555', 'john@example.com');

-- ============================================
-- SUPPLIERS
-- ============================================
INSERT INTO suppliers (name, phone, email, address) VALUES
('Tech Supplies Ltd', '111222333', 'contact@techsupplies.com', '123 Tech Street'),
('Gadget World', '444555666', 'sales@gadgetworld.com', '456 Gadget Avenue');

-- ============================================
-- PRODUCTS
-- ============================================
INSERT INTO products (supplier_id, name, cost_price, sale_price, stock_quantity, barcode) VALUES
(1, 'Screen Protector', 5.00, 12.00, 50, 'SP001'),
(1, 'Laptop Battery', 30.00, 65.00, 20, 'LB001'),
(2, 'USB-C Charger', 10.00, 25.00, 40, 'UC001');

-- ============================================
-- SERVICES
-- ============================================
INSERT INTO services (name, price, estimated_minutes) VALUES
('Screen Replacement', 50.00, 30),
('Battery Replacement', 40.00, 20),
('Diagnostics', 20.00, 15);

-- ============================================
-- DEVICES
-- ============================================
INSERT INTO devices (customer_id, device_type_id, brand, model, serial_number, notes) VALUES
(1, 1, 'Dell', 'XPS 13', 'SN12345', 'No power'),
(2, 2, 'Apple', 'iPhone 12', 'IP12345', 'Cracked screen'),
(3, 1, 'HP', 'Spectre x360', 'HP98765', 'Battery issues');

-- ============================================
-- REPAIRS
-- ============================================
INSERT INTO repairs (device_id, customer_id, status, problem_description, total_price) VALUES
(1, 1, 'pending', 'Laptop will not turn on', 0.00),
(2, 2, 'in_progress', 'Cracked screen', 0.00),
(3, 3, 'completed', 'Battery drains quickly', 0.00);

-- ============================================
-- REPAIR PRODUCTS
-- ============================================
INSERT INTO repair_products (repair_id, product_id, quantity, unit_price) VALUES
(2, 1, 1, 12.00), -- iPhone screen protector
(3, 2, 1, 65.00); -- HP battery

-- ============================================
-- REPAIR SERVICES
-- ============================================
INSERT INTO repair_services (repair_id, service_id, quantity, unit_price) VALUES
(1, 3, 1, 20.00), -- Diagnostics
(2, 1, 1, 50.00), -- Screen replacement
(3, 2, 1, 40.00); -- Battery replacement

-- ============================================
-- INVOICES
-- ============================================
INSERT INTO invoices (repair_id, customer_id, total_amount, paid) VALUES
(1, 1, 20.00, 0),
(2, 2, 62.00, 1),
(3, 3, 105.00, 1);

-- ============================================
-- INVOICE LINES
-- ============================================
-- Repair 1: Diagnostics only
INSERT INTO invoice_lines (invoice_id, description, quantity, unit_price) VALUES
(1, 'Diagnostics', 1, 20.00);

-- Repair 2: iPhone screen replacement + screen protector
INSERT INTO invoice_lines (invoice_id, description, quantity, unit_price) VALUES
(2, 'Screen Replacement', 1, 50.00),
(2, 'Screen Protector', 1, 12.00);

-- Repair 3: Battery replacement + HP battery
INSERT INTO invoice_lines (invoice_id, description, quantity, unit_price) VALUES
(3, 'Battery Replacement', 1, 40.00),
(3, 'Laptop Battery', 1, 65.00);
