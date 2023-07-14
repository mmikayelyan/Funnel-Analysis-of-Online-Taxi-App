CREATE TABLE "app_downloads" (
  "app_download_key" integer PRIMARY KEY,
  "platform" text,
  "download_ts" timestamp
);

CREATE TABLE "signups" (
  "user_id" integer PRIMARY KEY,
  "session_id" text,
  "signup_ts" timestamp,
  "age_range" text
);

CREATE TABLE "ride_requests" (
  "ride_id" integer PRIMARY KEY,
  "user_id" integer,
  "driver_id" integer,
  "request_ts" timestamp,
  "accept_ts" timestamp,
  "pickup_location" text,
  "destination_location" text,
  "pickup_ts" timestamp,
  "dropoff_ts" timestamp,
  "cancel_ts" timestamp
);

CREATE TABLE "transactions" (
  "ride_id" integer PRIMARY KEY,
  "purchase_amount_usd" float,
  "charge_status" text,
  "transaction_ts" timestamp
);

CREATE TABLE "reviews" (
  "review_id" integer PRIMARY KEY,
  "ride_id" integer,
  "driver_id" integer,
  "user_id" integer,
  "rating" integer,
  "free_response" text
);

ALTER TABLE "signups" ADD FOREIGN KEY ("session_id") REFERENCES "app_downloads" ("app_download_key");

ALTER TABLE "ride_requests" ADD FOREIGN KEY ("user_id") REFERENCES "signups" ("user_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("ride_id") REFERENCES "ride_requests" ("ride_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("ride_id") REFERENCES "ride_requests" ("ride_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "signups" ("user_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("ride_id") REFERENCES "transactions" ("ride_id");
