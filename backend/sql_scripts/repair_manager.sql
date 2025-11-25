-- ============================================
--   CRM / REPAIR SHOP DATABASE
-- ============================================

DROP DATABASE IF EXISTS repair_manager_db;
CREATE DATABASE repair_manager_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repair_manager_db;

-- ============================================
--   DEVICE TYPES
--   Example: laptop, smartphone, tablet, console...
-- ============================================
CREATE TABLE device_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
--   CUSTOMERS
-- ============================================
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_customers_name ON customers (last_name, first_name);
CREATE INDEX idx_customers_phone ON customers (phone);
CREATE INDEX idx_customers_email ON customers (email);

-- ============================================
--   DEVICES (customer-owned items)
-- ============================================
CREATE TABLE devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    device_type_id INT NOT NULL,
    brand VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_device_customer FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_device_type FOREIGN KEY (device_type_id) REFERENCES device_types(id)
);

CREATE INDEX idx_devices_customer ON devices (customer_id);
CREATE INDEX idx_devices_type ON devices (device_type_id);
CREATE INDEX idx_devices_serial ON devices (serial_number);

-- ============================================
--   SUPPLIERS
-- ============================================
CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    phone VARCHAR(30),
    email VARCHAR(150),
    address VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_suppliers_name ON suppliers (name);

-- ============================================
--   PRODUCTS (physical stock)
-- ============================================
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NULL,
    name VARCHAR(150) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    sale_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    stock_quantity INT NOT NULL DEFAULT 0,
    barcode VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE INDEX idx_products_name ON products (name);
CREATE INDEX idx_products_barcode ON products (barcode);
CREATE INDEX idx_products_supplier ON products (supplier_id);

-- ============================================
--   SERVICES (labor, no stock)
-- ============================================
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estimated_minutes INT DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_services_name ON services (name);

-- ============================================
--   REPAIRS (repair tickets)
-- ============================================
CREATE TABLE repairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    customer_id INT NOT NULL,
    status ENUM('pending','in_progress','completed','canceled') NOT NULL DEFAULT 'pending',
    problem_description TEXT,
    total_price DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_repair_device FOREIGN KEY (device_id) REFERENCES devices(id),
    CONSTRAINT fk_repair_customer FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE INDEX idx_repairs_device ON repairs (device_id);
CREATE INDEX idx_repairs_customer ON repairs (customer_id);
CREATE INDEX idx_repairs_status ON repairs (status);

-- ============================================
--   REPAIR PRODUCTS (join)
-- ============================================
CREATE TABLE repair_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repair_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_rp_repair FOREIGN KEY (repair_id) REFERENCES repairs(id),
    CONSTRAINT fk_rp_product FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE INDEX idx_rp_repair ON repair_products (repair_id);
CREATE INDEX idx_rp_product ON repair_products (product_id);

-- ============================================
--   REPAIR SERVICES (join)
-- ============================================
CREATE TABLE repair_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repair_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_rs_repair FOREIGN KEY (repair_id) REFERENCES repairs(id),
    CONSTRAINT fk_rs_service FOREIGN KEY (service_id) REFERENCES services(id)
);

CREATE INDEX idx_rs_repair ON repair_services (repair_id);
CREATE INDEX idx_rs_service ON repair_services (service_id);

-- ============================================
--   INVOICES
--   One repair can generate an invoice
--   (or multiple if partial payments later)
-- ============================================
CREATE TABLE invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repair_id INT NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    paid BOOLEAN NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_invoice_repair FOREIGN KEY (repair_id) REFERENCES repairs(id),
    CONSTRAINT fk_invoice_customer FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE INDEX idx_invoices_repair ON invoices (repair_id);
CREATE INDEX idx_invoices_customer ON invoices (customer_id);
CREATE INDEX idx_invoices_paid ON invoices (paid);

-- ============================================
--   INVOICE LINES
--   Stores itemized billing (products & services)
-- ============================================
CREATE TABLE invoice_lines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    description VARCHAR(200) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_invoice_line_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);

CREATE INDEX idx_invoice_lines_invoice ON invoice_lines (invoice_id);

-- ============================================
-- END OF SCHEMA
-- ============================================
