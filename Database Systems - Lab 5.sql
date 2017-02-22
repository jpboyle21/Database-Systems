--John Boyle
--Database Systems
--Lab 5
--Prof. Labouseur



--query 1 cities of agents booking order for customer c006
select city
from agents a inner join orders o on a.aid = o.aid
where o.cid = 'c006';

--query 2 ids of products ordered thru agent who makes at least one order from kyoto desc
select distinct p.pid
from orders o inner join agents a on o.aid = a.aid
			  inner join customers c on o.cid = c.cid
              inner join products p on o.pid = p.pid
where c.city = 'Kyoto'
order by p.pid desc;

--query 3 names of customers who never placed order use subquery
select c.name
from customers c
where c.cid not in(
    select cid
    from orders);

--query 4 same as query 3 but with outer join
select c.name
from customers c 
where c.cid not in(
    select c.cid
    from orders o left outer join customers c on o.cid = c.cid);

--query 5 names of customers who placed order with agent in own city
select distinct c.name
from orders o inner join customers c on o.cid = c.cid
		      inner join agents a on o.aid = a.aid
where c.city = a.city;

--query 6 names of customers/agents living in same city along with name
--regardless if customer ever placed order with thar agent
select c.name as "Cust Name",
	   a.name as "Agent Name",
       c.city as "Cust city",
       a.city as "Agent City"
from agents a, customers c
where a.city = c.city;

--query 7 name and city of customers who live in THE city that makes 
--the FEWEST different products use count and group by
select c.name, c.city
from customers c
where c.city in(
    select p.city
    from products p
    group by p.city
    order by count(quantity));