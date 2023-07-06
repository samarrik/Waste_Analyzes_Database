--Autors: Ivan Samarskyi

-- 1. Each person who has an agreement of the type "employee" with salary more than 10000kc. Display the name and the salary.
select distinct name, salary
from person join agreement using (id_person) join employee using (id_agreement)
where salary > 10000;

-- 2. ID of agreements  of employees who have never made a record.
select id_agreement
from employee e
where not exists (
    --there i check whether there is this id_agreement in records
    select 'SUCH EMPLOYEE HAS MADE A RECORD'
    from record r
    where r.id_agreement = e.id_agreement
);

-- 3. Addresses where are located companies which haven't ever conducted an analysis
select *
from address

except

select address.*
from address join client_company using (id_address) join analysis using (id_company);

-- 4. How much money our company needs to pay all employees monthly
create or replace view WeAreBankrupts as
select sum (salary)
from agreement join employee using (id_agreement)
where date_till is null
;

select * from WeAreBankrupts;
drop view WeAreBankrupts;

--5. Delete a person Ivan Samarskyi
begin;
delete
from person p1
where exists (
    select *
    from person p2
    where p2.name = 'Ivan' AND p2.name = 'Samarskyi'
);
rollback;

--6. IDs of agreements of employees and voluteers ever worked in our company with the name Chloe
select id_agreement
from agreement join person using (id_person)
where name = 'Chloe';

-- 7. Print out the id of the analysis in which participated everyone who started working in 2023
--make the universe of all agreement signed in 2023 and all analyzes
create or replace view universe as
(   select *
    from
    (select ag.id_agreement from agreement ag where (date_start > to_date('31.12.2022','dd.mm.yy') and date_start < to_date('01.01.2024','dd.mm.yy') )) as AGR cross join (select an.id_analysis from analysis an) as ANL
);


--make real situations
create or replace view realistic as
(
select p.id_agreement, p.id_analysis
from participation p
);

--make unreal situations
create or replace view unrealistic as
(
select *
from universe

except

select *
from realistic
);

create or replace view result_id as
(
    select id_analysis
    from universe

    except

    select id_analysis
    from unrealistic
);

select *
from result_id;

drop view universe CASCADE;
drop view realistic CASCADE;

--8. Names of all comapnies that asked us to make an analysis
select distinct name
from client_company left outer join analysis on (analysis.id_company = client_company.id_company)
where id_analysis is not null;

--9.Set an average salary for all employees
begin;
select * from employee;
update employee e1 set salary = ( select avg(e2.salary) from employee e2 );
select * from employee;
rollback;

-- 10.Select all types which have "taxable" records and which have in total more than 50 kg of waste and order it by the name of the type in ascending order
select type, sum(weight)
from record
where tax_czk is not null
group by type
having sum(weight) > 50
order by type asc;

--11. Agreement IDs of all emplyees which have made more than one record
select *
from (
    select e.id_agreement, ( select count(*) from record where (e.id_agreement = record.id_agreement)  ) as num_of_rec
    from employee e
) AS T
where num_of_rec > 1;

--12. Only those analyses which have records only about plastic
select distinct a1.id_analysis
from analysis a1 join record r1 on (a1.id_analysis = r1.id_analysis)
where type = 'Plastic'

except

select distinct a2.id_analysis
from analysis a2 join record r2 on (a2.id_analysis = r2.id_analysis)
where type != 'Plastic';