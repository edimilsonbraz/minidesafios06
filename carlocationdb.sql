CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "cpf" varchar,
  "phone" varchar,
  "address" varchar
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "cnpj" varchar,
  "phone" varchar,
  "customers_id" int
);

CREATE TABLE "addresses" (
  "id" int PRIMARY KEY,
  "agencies_id" int,
  "address" text,
  "estado" text,
  "cidade" text,
  "cep" varchar
);

CREATE TABLE "cars" (
  "id" int PRIMARY KEY,
  "models_id" int,
  "orders_id" int,
  "name" text,
  "cor" text
);

CREATE TABLE "models" (
  "id" int PRIMARY KEY,
  "name" text,
  "ano" text,
  "design" text,
  "features" text
);

CREATE TABLE "orders" (
  "id" int PRIMARY KEY,
  "code" int,
  "customers_id" int,
  "agencies_id" int,
  "cars_id" int
);

ALTER TABLE "agencies" ADD FOREIGN KEY ("customers_id") REFERENCES "customers" ("id");

ALTER TABLE "agencies" ADD FOREIGN KEY ("id") REFERENCES "addresses" ("agencies_id");

ALTER TABLE "cars" ADD FOREIGN KEY ("models_id") REFERENCES "models" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customers_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("agencies_id") REFERENCES "agencies" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("cars_id") REFERENCES "cars" ("id");

ALTER TABLE "cars" ADD FOREIGN KEY ("orders_id") REFERENCES "orders" ("id");
