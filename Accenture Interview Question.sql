--Create Table for employee id, employee names, email
CREATE TABLE employees  (employee_id int,employee_name varchar(15), email_id varchar(15) );

--Insert Data
delete from employees;
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com'); 
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('106','Anjali Chouhan', 'JO.DA@ABC.COM');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('107','Ankit Bansal', 'AN.BA@ABC.COM');

select * from employees

--Delete uppercase email id in case of duplicate
--First Solution
with cte as(
select *, ASCII(email_id) as ascii_email
, rank() over(partition by email_id order by ASCII(email_id) desc) as rn
from employees
)
select * from cte where rn=1

--Second Solution
ALTER TABLE employees
ALTER COLUMN email_id VARCHAR(15) COLLATE SQL_Latin1_General_CP1_CS_AS

select *, LOWER(email_id) as l_emil_id
from employees
where email_id=LOWER(email_id)

with cte as(
select *
, rank() over(partition by lower(email_id) order by ASCII(email_id) desc) as rn
from employees
)
select * from cte where rn=1






