-- create_tables.sql
-- This script creates the main tables for the e-commerce database: customers, products, and orders.

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),  -- Unique customer ID
  name TEXT,                                       -- Customer name
  email TEXT,                                      -- Customer email
  joined_at TIMESTAMP DEFAULT now()                -- Date when the customer joined
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),  -- Unique product ID
  name TEXT,                                       -- Product name
  category TEXT,                                   -- Product category
  price NUMERIC                                    -- Product price
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),  -- Unique order ID
  customer_id UUID REFERENCES customers(id),      -- Reference to customer
  product_id UUID REFERENCES products(id),        -- Reference to product
  quantity INT,                                    -- Quantity ordered
  order_date DATE                                  -- Date of the order
);
