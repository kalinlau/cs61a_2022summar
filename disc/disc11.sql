/*Disc 11 Part II: SQL

Author: Jialin Liu.
*/

-- Q3
select name from records where supervisor = 'Oliver Warbucks';

-- Q4
select * from records where name = supervisor;

-- Q5
select name from records where salary > 50000 order by name asc;

-- Q6
select b.day, b.time from records as a, meetings as b where a.supervisor = 'Oliver Warbucks';

-- Q7
select a.name from records as a, records as b where a.supervisor = b.name and b.division != a.division;

-- Q8
select m.name from records as a, records as m, records as c
    where a.supervisor = m.name and m.supervisor = c.name and m.name != c.name;

-- Q9
select supervisor, sum(salary) from records group by supervisor;

-- TODO: Q10

-- TODO: Q11