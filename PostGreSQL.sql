CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_password" VARCHAR(200),
  "user_email" VARCHAR(200),
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "user_bio" VARCHAR(150)
);

CREATE TABLE "recipe" (
  "recipe_id" SERIAL PRIMARY KEY,
  "recipe_instructions" VARCHAR(1000),
  "recipe_ingredients" VARCHAR(1000),
  "recipe_public" BOOLEAN,
  "author_id" INT NOT NULL
);

CREATE TABLE "posts" (
  "Post_id" SERIAL PRIMARY KEY,
  "Post_content" VARCHAR(1000),
  "Post_image" VARCHAR(2000),
  "Author_id" INT NOT NULL,
  "recipe_content" INT NOT NULL
);

CREATE TABLE "occasions" (
  "occasion_id" SERIAL PRIMARY KEY,
  "occasion_name" VARCHAR(500),
  "occasion_image" VARCHAR(2000),
  "info_id" INT NOT NULL
);

CREATE TABLE "grocery" (
  "Grocery_id" SERIAL PRIMARY KEY,
  "Grocery_name" varchar(500),
  "Added_to_list" INT NOT NULL,
  "Info_id" INT NOT NULL
);

ALTER TABLE "recipe" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "posts" ADD FOREIGN KEY ("Author_id") REFERENCES "users" ("user_id");

ALTER TABLE "posts" ADD FOREIGN KEY ("recipe_content") REFERENCES "recipe" ("recipe_id");

ALTER TABLE "occasions" ADD FOREIGN KEY ("info_id") REFERENCES "recipe" ("recipe_instructions");

ALTER TABLE "grocery" ADD FOREIGN KEY ("Added_to_list") REFERENCES "recipe" ("recipe_ingredients");

ALTER TABLE "grocery" ADD FOREIGN KEY ("Info_id") REFERENCES "users" ("user_id");
