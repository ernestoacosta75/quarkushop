-- Clean up existing tables
DROP TABLE IF EXISTS "products_reviews" CASCADE;
DROP TABLE IF EXISTS "order_items" CASCADE;
DROP TABLE IF EXISTS "orders" CASCADE;
DROP TABLE IF EXISTS "carts" CASCADE;
DROP TABLE IF EXISTS "products" CASCADE;
DROP TABLE IF EXISTS "payments" CASCADE;
DROP TABLE IF EXISTS "customers" CASCADE;
DROP TABLE IF EXISTS "categories" CASCADE;
DROP TABLE IF EXISTS "reviews" CASCADE;

-- Create Tables with UUID
CREATE TABLE "categories" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "description" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    CONSTRAINT "categories_pk" PRIMARY KEY ("id")
);

CREATE TABLE "customers" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "email" VARCHAR(255),
    "enabled" BOOLEAN NOT NULL,
    "first_name" VARCHAR(255),
    "last_name" VARCHAR(255),
    "telephone" VARCHAR(255),
    CONSTRAINT "customer_pk" PRIMARY KEY ("id")
);

CREATE TABLE "products" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "description" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL,
    "sales_counter" INTEGER,
    "status" VARCHAR(255) NOT NULL,
    "category_id" UUID,
    CONSTRAINT "product_pk" PRIMARY KEY ("id"),
    CONSTRAINT "product_fk" FOREIGN KEY ("category_id") REFERENCES "categories"("id")
);

CREATE TABLE "payments" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "paypal_payment_id" VARCHAR(255),
    "status" VARCHAR(255) NOT NULL,
    "amount" DECIMAL(10, 2) NOT NULL,
    CONSTRAINT "payment_pk" PRIMARY KEY ("id")
);

CREATE TABLE "carts" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "status" VARCHAR(255) NOT NULL,
    "customer_id" UUID,
    CONSTRAINT "cart_pk" PRIMARY KEY ("id"),
    CONSTRAINT "cart_fk" FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "orders" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "address_1" VARCHAR(255),
    "address_2" VARCHAR(255),
    "city" VARCHAR(255),
    "country" VARCHAR(2),
    "postcode" VARCHAR(10),
    "shipped" TIMESTAMP,
    "status" VARCHAR(255) NOT NULL,
    "total_price" DECIMAL(10, 2) NOT NULL,
    "cart_id" UUID,
    "payment_id" UUID,
    CONSTRAINT "orders_pk" PRIMARY KEY ("id"),
    CONSTRAINT "orders_uk" UNIQUE ("payment_id"),
    CONSTRAINT "orders_fk1" FOREIGN KEY ("payment_id") REFERENCES "payments"("id"),
    CONSTRAINT "orders_fk2" FOREIGN KEY ("cart_id") REFERENCES "carts"("id")
);

CREATE TABLE "order_items" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "quantity" BIGINT NOT NULL,
    "order_id" UUID,
    "product_id" UUID,
    CONSTRAINT "order_item_pk" PRIMARY KEY ("id"),
    CONSTRAINT "order_item_fk1" FOREIGN KEY ("product_id") REFERENCES "products"("id"),
    CONSTRAINT "order_item_fk2" FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "reviews" (
    "id" UUID NOT NULL,
    "created_date" TIMESTAMP NOT NULL,
    "last_modified_date" TIMESTAMP,
    "description" VARCHAR(255) NOT NULL,
    "rating" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    CONSTRAINT "review_pk" PRIMARY KEY ("id")
);

CREATE TABLE "products_reviews" (
    "product_id" UUID NOT NULL,
    "reviews_id" UUID NOT NULL,
    CONSTRAINT "products_reviews_pk" PRIMARY KEY ("product_id", "reviews_id"),
    CONSTRAINT "products_reviews_uk" UNIQUE ("reviews_id"),
    CONSTRAINT "products_reviews_fk1" FOREIGN KEY ("reviews_id") REFERENCES "reviews"("id"),
    CONSTRAINT "products_reviews_fk2" FOREIGN KEY ("product_id") REFERENCES "products"("id")
);