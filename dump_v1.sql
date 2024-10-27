DROP TABLE IF EXISTS "user";
CREATE TABLE IF NOT EXISTS "user"(id SERIAL PRIMARY KEY, name TEXT NOT NULL, location TEXT NOT NULL);

INSERT INTO "user" (id, name, location) VALUES (1, 'srirama', 'ayodhya');
INSERT INTO "user" (id, name, location) VALUES (2, 'sita', 'mithila');


Drop table if exists customer;
CREATE TABLE IF NOT EXISTS customer (id int, name text, branch text, balance float);

INSERT INTO customer VALUES (1, 'aaa', '101', 100);
INSERT INTO customer VALUES (2, 'bbb', '102', 200);
INSERT INTO customer VALUES (3, 'ccc', '103', 300);
INSERT INTO customer VALUES (4, 'ddd', '101', 400);
INSERT INTO customer VALUES (5, 'eee', '102', 500);
INSERT INTO customer VALUES (6, 'fff', '103', 600);
INSERT INTO customer VALUES (7, 'ggg', '101', 700);
INSERT INTO customer VALUES (8, 'hhh', '102', 800);
INSERT INTO customer VALUES (9, 'iii', '103', 900);
COMMIT;