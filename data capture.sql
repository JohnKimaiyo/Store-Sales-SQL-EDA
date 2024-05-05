CREATE DATABASE sales;

USE sales;

CREATE TABLE sales.cust_california(
customer_id smallint(5) NOT NULL
,address_id smallint(5) NOT NULL
,district varchar(20) NOT NULL
,city_id smallint(5) NOT NULL
,city varchar(50) NOT NULL
,PRIMARY KEY(customer_id,address_id,city_id)
,KEY idx_fk_customer_id (customer_id)
,KEY idx_fk_address_id (address_id)
,KEY idx_fk_city_id (city_id)
)
;