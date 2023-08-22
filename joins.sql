
----  JOINS IN SQL

-- lets first create a new database 

create database joinDb

use joinDb

create table football
(
	football_id int auto_increment,
	name varchar(25),
	primary key(football_id)
)


create table criket
(
criket_id int auto_increment,
name varchar(25),
primary key(criket_id)
)


--- inserting some data into the tables so as we can use them for query joins

insert into football(name)values('fumbuka'),('mlasa'),('madumu'),('bariki'),('jack')


insert into `criket`(name)values('mlasa'),('jack'),('zegge'),('emma'),('damian')


select * from criket

select * from football


--- QN1: find the student that plays both football and criket using INNER JOIN

select * from criket as c inner join football as f on c.name = f.name


select * from criket as c inner join football as f where c.name = f.name


select c.criket_id,f.football_id,c.name,f.name from criket as c inner join football as f where c.name = f.name




use ruzuku

--- let me perform inner join from contact_persons and contacts tables

select name,gender,contact from contact_persons inner join contacts using(contactable_id)


/* select * from users where full_name = 'bizytech'; */


select * from validation_errors

alter table validation_errors_grano rename to validation_errors


--- creating validation_errors table using sql

CREATE TABLE validation_errors (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    payload JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);





----- INNER JOINS
--- foreaxample, assume we have three tables, orders,orderdetails and products
/* 
select o.ordernumber,o.status,p.product_name, sum(quantityordered * priceeach) as revenue
from orders as o INNER JOIN orderdetails as od ON o.`order_number` = od.`oder_number`
INNER JOIN products as p ON p.`product_code` = od.product_code` GROUP BY ordernumber; */


------ LEFT JOIN
--- It return all the rows from the left tbale and the matvhing rowas from right table

--- example

select c.customernumber,c.customername,ordernumber,status FROM customers as c
LEFT JOIN orders as o ON c.customernumber = o.customernumber;


select s.product_id as 'nambari ya bidhaa',s.sell_price as 'bei ya kuuza',c.cost_price as 'bei ya kununua'
from sales as s LEFT JOIN c_products as c ON s.`product_id` = c.`Product_id`;

--- RIGHT JOIN 
--- itreturn all the rows fromthe right tablle and the matchhing rows from the left table

--- here lets use ruzuku db to perform right join

use ruzuku


--- lets write a query to right join two table such farms and members

select f.name as 'farm name',m.firstname as 'farmer name',m.gender as 'sex',m.`status`
from farms as f RIGHT JOIN members as m ON f.`member_id` = m.`id`  limit 20
