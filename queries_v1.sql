DROP TABLE IF EXISTS "user";
CREATE TABLE IF NOT EXISTS "user"(id SERIAL PRIMARY KEY, name TEXT NOT NULL, location TEXT NOT NULL);

INSERT INTO "user" (id, name, location) VALUES (1, 'srirama', 'ayodhya');
INSERT INTO "user" (id, name, location) VALUES (2, 'sita', 'mithila');
SELECT * FROM "user";


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

SELECT * FROM CUSTOMER;


SELECT * FROM customer WHERE (branch, balance) IN (SELECT branch, MAX(balance) FROM customer GROUP BY branch);
SELECT A.* FROM CUSTOMER A JOIN (SELECT BRANCH, MAX(BALANCE) AS MAX_BALANCE FROM CUSTOMER GROUP BY BRANCH) B ON A.BRANCH = B.BRANCH AND A.BALANCE = B.MAX_BALANCE;
SELECT id, name, branch, balance
FROM (
    SELECT id, name, branch, balance,
               DENSE_RANK() OVER (PARTITION BY branch ORDER BY balance DESC) AS r
                   FROM customer
                   ) c
                   WHERE r = 1;