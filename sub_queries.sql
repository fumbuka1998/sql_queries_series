
-- SUBQUERIES
-- refers to the queries within query

show databases
use classicmodels

select * from products

use sql_intro

select * from employees

-- eg1.
select * from employees where salary<(select AVG(`salary`) from `employees`)

-- eg2: fetch the employees with their salary greater than the salary of fatna temba using sub queries

select emp_name as 'full name', dept, salary from employees where
salary >(select salary from employees where emp_name = 'fatna temba')

-- eg3: using two tables
use classicmodels

select * from `products`

select * from orderdetails

select productcode,productname,msrp from products where productcode in(select productcode from 
orderdetails where priceeach > 100 ) 


-- MySQL subquery with comparison operators

select * from offices

-- lets query the employees whose work offices are loocated in usa

select lastname,firstname,officecode from `employees` where officecode 
in(select officecode FROM offices where `country` = 'usa')


-- lets query the customers with highest pay
select * from payments

select customernumber,checknumber,amount from payments where amount = (select max(amount) from payments)


-- lets query the customer with payment greater than the average payment
select customernumber,checknumber from payments where amount > (select avg(amount) from payments)



-- MySQL subquery with IN and NOT IN operators

select * from customers


select * from orders

-- task: fetch customers who have not placed order at all

select customernumber,customername from customers where customernumber not in(select `customerNumber` from orders)

-- or

select customername from customers where customernumber not in (select DISTINCT customernumber from orders)


-- MySQL subquery in the FROM clause
-- task: find the maximum ,minimum, and average number of items in sales order


select * from orders

	
select min(items),max(items),floor(avg(items)) from (select ordernumber, count(ordernumber) as items from orderdetails
group by `orderNumber`) as orderlines

-- select products whose buy price is greater than the avrage buy price for every products in each product line

select * from products
select productname,buyprice from `products` where buyprice > (select avg(buyprice) from products)

-- using the productlines
select productname, buyprice,productline from products p1 where buyprice < (select avg(buyprice) from products
where productline = p1.productline)

-- select orders with total amount greater than 60k
select ordernumber, sum(priceeach * quantityordered) as total from orderdetails inner join orders using(ordernumber)
group by ordernumber having sum(priceeach * quantityordered)>60000;

select * from customers
-- find customers who placed at least one sales order with the total value greater than 60K
select customernumber,customername from customers
where exists(
select ordernumber, sum(priceeach * quantityordered) as total from orderdetails inner join orders using(ordernumber)
group by ordernumber having sum(priceeach * quantityordered)>60000
)
