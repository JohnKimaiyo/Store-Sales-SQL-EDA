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

INSERT INTO sales.cust_california(
customer_id
,address_id
,district
,city_id
,city
)
SELECT cus.customer_id
,adr.address_id
,adr.district
,adr.city_id
,cty.city

FROM sakila.customer cus

JOIN sakila.address adr
ON cus.address_id = adr.address_id

JOIN sakila.city cty
ON adr.city_id = cty.city_id

WHERE adr.district = 'California'
;
CREATE TABLE sales.cus_pay_detail AS
SELECT cus.customer_id
,pay.payment_id
,pay.rental_id
,pay.amount
,pay.payment_date

,inv.invenstory_id
,flm.title
,str.store_id
,adr.address_id
,adr.address

FROM sales.cust_california cus

JOIN sakila.payment pay
ON cust.customer_id = pay.customer_id

LEFT JOIN sakila.rental ren
ON pay.rental_id = ren.rental_id

JOIN sakila.inventory inv
ON ren.inventory_id = inv.invenstory_id

JOIN sakila.film flm
ON inv.film_id = flm.film_id

JOIN sakila.store str
ON inv.store_id = str.store_id

JOIN sakila.address adr
ON str.address_id = adr.address_id
;

-- 

