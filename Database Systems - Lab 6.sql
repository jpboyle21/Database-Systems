--query 1, city and name of customers who live in any city who makes most kinds of products 
select name, city
from customers
where city in(
    select city
    from products p
    group by city
    order by count(city) desc
    limit 1);
    
--query 2, names and products whos price usd is strictly above average priceUSD in reverse alphabetical order
select name
from products
where priceUSD > (
    select avg(priceUSD)
    from products)
    order by name desc;
    
--query 3, name, pid, total for all orders low to high
select c.name, o.pid, o.totalUSD
from customers c, orders o
where c.cid = o.cid
order by o.totalUSD asc;

--query 4
select c.name, coalesce(sum(orders.qty),0) 
from customers c
left outer join orders on c.cid = orders.cid
group by c.name
order by c.name asc;

--query 5,  all cust names who bought products from agents in newark with names of products they ordered 
--and names of agents who sold them
select c.name as "CustName",
       p.name as "ProdName", 
       a.name as "AgentName"
from customers c, products p, agents a, orders o
where a.aid = o.aid
and c.cid = o.cid
and p.pid = o.pid
and a.city = 'Newark';

--query 6, check accuracy of o.totalUSD
select o.totalUSD, (p.priceusd * o.qty)-c.discount*(p.priceUSD*10) as "AccCheck"
from products p, orders o, customers c
where p.pid = o.pid
and c.cid = o.cid

--question 7, difference between left outer join and right outer join with examples
'in a left outer join, all of the rows from the left table will be displayed, 
whether or not there are any matching columns in the right table. In a right outer join, 
every row from the right table will be shown, regardless of whether or not there
are any matching columns in the left table.'

--example of right outer join
select *
from customers c
right outer join orders on orders.cid = c.cid

--example of left outer join
select *
from customers c
left outer join orders on orders.cid = c.cid