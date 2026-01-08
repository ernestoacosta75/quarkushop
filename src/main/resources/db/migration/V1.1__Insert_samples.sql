-- 1. CATEGORIES
INSERT INTO "categories" ("id", "created_date", "last_modified_date", "description", "name")
VALUES ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Phones & Smartphones', 'Mobile'),
       ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Computers and Laptops', 'PC');

-- 2. PRODUCTS
INSERT INTO "products" ("id", "created_date", "last_modified_date", "description", "name", "price", "sales_counter", "status", "category_id")
VALUES ('11111111-1111-1111-1111-111111111111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Latest iPhone', 'iPhone 11 Pro', 999.00, 0, 'AVAILABLE', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
       ('22222222-2222-2222-2222-222222222222', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Older iPhone', 'iPhone XS', 759.00, 0, 'AVAILABLE', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
       ('33333333-3333-3333-3333-333333333333', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'MacBook Pro', 'MacBook Pro 13', 1999.00, 0, 'AVAILABLE', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb');

-- 3. REVIEWS
INSERT INTO "reviews" ("id", "created_date", "last_modified_date", "description", "rating", "title")
VALUES ('99999999-9999-9999-9999-999999999999', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Wonderful product', 5, 'Excellent');

-- 4. PRODUCTS_REVIEWS
INSERT INTO "products_reviews" ("product_id", "reviews_id")
VALUES ('11111111-1111-1111-1111-111111111111', '99999999-9999-9999-9999-999999999999');

-- 5. CUSTOMERS
INSERT INTO "customers" ("id", "created_date", "last_modified_date", "email", "enabled", "first_name", "last_name", "telephone")
VALUES ('cccccccc-cccc-cccc-cccc-cccccccccccc', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'jason.bourne@mail.hello', TRUE, 'Jason', 'Bourne', '0102030405');

-- 6. CARTS
INSERT INTO "carts" ("id", "created_date", "last_modified_date", "status", "customer_id")
VALUES ('dddddddd-dddd-dddd-dddd-dddddddddddd', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'NEW', 'cccccccc-cccc-cccc-cccc-cccccccccccc');

-- 7. PAYMENTS
INSERT INTO "payments" ("id", "created_date", "last_modified_date", "paypal_payment_id", "status", "amount")
VALUES ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'somePayId', 'ACCEPTED', 999.00);

-- 8. ORDERS
INSERT INTO "orders" ("id", "created_date", "last_modified_date", "address_1", "city", "country", "postcode", "status", "total_price", "cart_id", "payment_id")
VALUES ('ffffffff-ffff-ffff-ffff-ffffffffffff', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1 Rue Vaugirard', 'Paris', 'FR', '75015', 'PAID', 999.00, 'dddddddd-dddd-dddd-dddd-dddddddddddd', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee');

-- 9. ORDER_ITEMS
INSERT INTO "order_items" ("id", "created_date", "last_modified_date", "quantity", "order_id", "product_id")
VALUES ('00000000-0000-0000-0000-000000000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'ffffffff-ffff-ffff-ffff-ffffffffffff', '11111111-1111-1111-1111-111111111111');