--John Boyle
--Lab 4
--Database Systems
--Alan Labouseur


--query 1 agent cities booking an order for c006
select a.city
from agents a
where a.aid in (
    select o.aid
    from orders o
    where o.cid = 'c006')
    ;
--query 2 distinct ids of products ordered through an agent who takes an order through Kyoto     
select distinct o.pid
from orders o
where aid in(
    select o.aid
    from orders o
    where cid in(
        select c.cid
        from customers c 
        where c.city = 'Kyoto'))
        order by pid desc
        ;

--query 3 ids and names of customers who did NOT place order through a01
select c.cid, c.name
from customers c
where c.cid not in(
    select  o.cid
    from orders o
    where aid = 'ao1');

--query 4 ids of customers who ordered p01 and p07
select c.cid
from customers c
where cid in(
    select o.cid
    from orders o
    where pid = 'p01'
    and cid in(
        select o.cid
        from orders o
        where pid = 'p07'));
        
--query 5 ids of products NOT ordered by  a customer through a08
select distinct p.pid
from products p
where p.pid not in(
    select distinct o.pid
    from orders o
    where aid = 'a08')
    order by pid desc;

--query 6 name discount and city of customers placing order through agents in NY and Tokyo
select c.name, c.city, c.discount
from customers c
where c.cid in(
    select distinct o.cid
    from orders o
    where o.aid in(
        select a.aid
        from agents a
        where a.city = 'New York'
        or a.city = 'Tokyo'));

--query 7 all customers who have same discount as customers in duluth or london
select *
from customers c
where c.cid in(
    select o.cid
    from orders o
    where o.cid in(
        select c.cid
        from customers c
        where c.city = 'Duluth' or c.city = 'London'));

--question 8
'A check constraint is used to limit the value range that can be placed in a column.'
'If you define a check constraint on a single column it allows only certain values for the column.'
'They are used to find a vertain set of data in the set of values. For example,'
'if there is a list of numerous numbers, you can add a check constraint to limit the '
'number of values that are omitted, such as taking a range of numbers less than 5 but greater than 0.'



