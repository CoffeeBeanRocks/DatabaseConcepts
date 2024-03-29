-- Script for Assignment 5

CREATE DATABASE assignment5;

-- Connecting to database 
\c assignment5;

-- Relation schemas and instances for assignment 2

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
choose_element(A)            choose some element from A
bag_union(A,B)               the bag union of A and B
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint 
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Add element to set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;


-- Choose some element from set A
create or replace function choose_element(A anyarray) 
returns anyelement as
$$
   select x 
   from (select UNNEST(A) as x) q
   order by random();
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
$$ language sql;


-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray) 
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray) 
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray) 
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;


-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;



-- Complex-object views on the Person, Company, companyLocation,
-- worksFor, Skill, personSkill, and Knows database

-- Define the view {\tt companyHasEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of
-- pids of persons who work for that company. 

create or replace view companyHasEmployees as
   select cname, array(select pid 
                       from   worksfor w
                       where  w.cname = c.cname order by 1) as employees
   from   company c order by 1;


-- Define a view {\tt cityHasCompanies(city,companies)} which associates
-- with each city the set of cnames of companies who are located in that
-- city. 

create or replace view cityHasCompanies as
   select city, array_agg(cname order by 1) as companies
   from   companyLocation 
   group by city order by 1;




-- Define a view {\tt companyLocations(cname,locations)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.  

create or replace view companyHasLocations     as
   select cname, array(select city 
                       from   companyLocation cc
                       where  c.cname = cc.cname order by 1) as locations
   from   company c
   order by 1;



-- Define a view {\tt knowsPersons(pid,persons)} which associates with each
-- person, identified by a pid, the set of pids of persons he or she
-- knows.

create or replace view knowsPersons as
   select p.pid, array(select k.pid2 
                       from   knows k
                       where  k.pid1 = p.pid order by pid2) as persons
   from   person p
   order by 1;




-- The view {\tt isKnownByPersons(pid,persons)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  Observe that there may be persons who are not known by
-- any one.

create or replace view isKnownByPersons as
   select distinct p.pid, array(select k.pid1 
                                from   knows k
                                where  k.pid2 = p.pid order by pid1) as persons
   from   person p
   order by 1;


-- Define a view {\tt personHasSkills(pid,skills)} which associates with
-- each person, identified by a pid, his or her set of job skills.
-- Observe that a person may not have any job skills.  (Test your view.)

create or replace view personHasSkills  as
   select distinct p.pid, array(select s.skill
                                from   personSkill s
                                where  s.pid = p.pid order by 1) as skills
   from   person p order by 1;



-- Define a view {\tt skillOfPersons(skills,persons)} which associates
-- with each job skill the set of pids of persons who have that job
-- skill.  Observe that there may be job skills that are not job skills
-- of any person.  (Test your view.)

create or replace view  skillOfPersons as
    select js.skill, array(select ps.pid
                           from   personSkill ps
                           where  ps.skill = js.skill order by 1) as persons
    from   Skill js order by 1;


\qecho 'Problem 1'
/*Write a trigger to check for primary key constraint. Trigger should include
definition and function.*/

create or replace function check_company_key_constraint() returns trigger as
$$
	begin
		if new.cname in (select c.cname from Company c) then 
			RAISE EXCEPTION 'cname already exists'; 
			return null;
		end if;
		return new;
	end
$$ language 'plpgsql';

create or replace trigger companyPk
	before insert on Company
	for each row
		execute procedure check_company_key_constraint();

\qecho 'Problem 2'
/*Write a trigger to check for referential integrity constraint. Trigger should
include definition and function.*/

create or replace function check_worksfor_foreignkey_constraint() returns trigger as
$$
	begin
		if new.cname not in (select c.cname from Company c) then 
			RAISE EXCEPTION 'cname does not exists in Company'; 
			return null;
		end if;
		return new;
	end
$$ language 'plpgsql';

create or replace trigger companyFk
	before insert on worksFor
	for each row
		execute procedure check_worksfor_foreignkey_constraint();

\qecho 'Problem 3'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

-- select distinct r.A
-- from R r, S s
-- where r.A > 10 and r.B = s.B;

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language 'plpgsql.'

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/

--TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/

CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);


/* -----------*/
--Create TRIGGERS Insert_R and Insert_S

create or replace function update_view_v_r() returns trigger as 
$$
	begin
		if new.A > 10 and (new.B in (select s.B from S s)) then
			insert into V values (new.A);
		end if;
		return null;
	end;
$$ language plpgsql;

create or replace trigger Insert_R
after insert on R
for each row
execute function update_view_v_r();

create or replace function update_view_v_s() returns trigger as 
$$
	begin
		insert into V select r.A from R r where r.A > 10 and r.B = new.B;
		return null;
	end;
$$ language plpgsql;

create or replace trigger Insert_S
after insert on S
for each row
execute function update_view_v_s();

create or replace function update_view_v() returns trigger as
$$
	begin
		if new.A in (select v.A from V v) then 
			return null;
		end if;
		return new;
	end
$$ language 'plpgsql';

create or replace trigger Insert_V
	before insert on V
	for each row
		execute procedure update_view_v();

/* -----------*/

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/

\qecho 'Problem 4'
/*Consider applying the following constraint over the relation personSkill.
"Each skill of a person who works for Apple should also be the skill of
the person who works for Google". Write a trigger that maintains the
constraint when inserting new pairs of (pid,skill) into the personSkill relation.(
You can ignore the constraint restriction to hold upon the already
existing previous records).*/

/* SECTION Q4 BEGIN */

create or replace function insert_ps() returns trigger as
$$
	begin
		if exists(select 1 
				 	from worksFor w1
				 	where w1.pid = new.pid
				 	and w1.cname = 'Google')
		then
			insert into personSkill(pid,skill) select distinct new.pid, ps.skill
                                             from worksFor w, personSkill ps
                                             where w.cname = 'Apple'
                                             and w.pid = ps.pid;                            
		end if;
		return new;
	end;
$$ language 'plpgsql';

create or replace trigger Insert_ps
	after insert on worksFor
	for each row
		execute procedure insert_ps();

/* -----------*/

/* NEW RECORDS TO BE INSERTED*/


INSERT INTO Person VALUES
    (2001,'Kevin','Cupertino');
INSERT INTO worksFor VALUES
    (2001,'Apple', 65000);

INSERT INTO Person VALUES
    (2002,'Julia', 'Cupertino');
INSERT INTO worksFor VALUES
  (2002,'Google', 45000);
INSERT INTO SKILL VALUES('Devops'); 
INSERT INTO personSkill VALUES
  (2002,'Devops');
     
INSERT INTO Person VALUES
    (2003,'Dora', 'Seattle');
INSERT INTO worksFor VALUES  
  (2003,'Google', 55000);
INSERT INTO SKILL VALUES('Cloud');
INSERT INTO personSkill VALUES
  (2003,'Cloud');

INSERT INTO Person VALUES
     (2004,'Peter', 'Seattle');
INSERT INTO worksFor VALUES  
   (2004,'Apple', 55000);
INSERT INTO SKILL VALUES('Design');
INSERT INTO personSkill VALUES
   (2004,'Design');


INSERT INTO Person VALUES
    (2005,'Alex','Cupertino');
INSERT INTO worksFor VALUES
    (2005,'Apple', 65000);

/* -----------*/

/* TEST YOUR RESULTS*/

SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* -----------*/

/* RETAINING THE ORIGINAL DATA*/

DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005); 

/* SECTION Q4 END */



\qecho 'Problem 5'
/*Consider applying the following constraint over the relation knows. "Whenever a person moves from
company A to company B, they should know all the managers working at the new company B." To
meet this constraint, add the required entries in the Knows table. Test your trigger across the below
updates: */

/* SECTION Q5 BEGIN */
/* Create your trigger here*/

create or replace function update_worksFor() returns trigger as
$$
	begin
		insert into Knows (pid1, pid2)
      select new.pid, hm.mid
      from hasManager hm
      join worksFor wf on hm.mid = wf.pid
      where wf.cname = new.cname
      and new.pid <> hm.mid
      on conflict (pid1, pid2) do nothing;
    return null;
	end;
$$ language 'plpgsql';

create or replace trigger CompanyTransfer
	after update on worksFor
	for each row
		execute procedure update_worksFor();

-- create or replace trigger CompanyTransfer
-- 	after update on worksFor
-- 	for each row
-- 		execute procedure update_worksFor();

/*  ----------------------- */
CREATE TABLE KNOWS_COPY AS SELECT * FROM KNOWS;
CREATE OR REPLACE FUNCTION RETAIN_DATA(P INT, C TEXT)
RETURNS VOID AS $$
BEGIN
UPDATE WORKSFOR SET CNAME = C
WHERE WORKSFOR.PID = P;
TRUNCATE TABLE KNOWS;
INSERT INTO KNOWS SELECT * FROM KNOWS_COPY;
END;
$$ LANGUAGE plpgsql;

UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

/* Check your trigger and return the results*/
SELECT * FROM KNOWS K WHERE K.PID1 = 1005;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');
UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/
SELECT * FROM KNOWS K WHERE K.PID1 = 1012;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');

DROP TABLE KNOWS_COPY;

\qecho 'Problem 6'
/*
Find the cname and headquarter of each company that employs at least two persons who have a
common job skill.
*/

select distinct c.cname, c.headquarter
from Company c
where is_not_empty(array(select row(w1.pid, w2.pid)
                           from worksFor w1, worksFor w2, personHasSkills ps1, personHasSkills ps2
                           where w1.pid = ps1.pid
                           and w2.pid = ps2.pid
                           and w1.pid <> w2.pid
                           and w1.cname = c.cname
                           and w2.cname = c.cname
                           and is_not_empty(set_intersection(ps1.skills, ps2.skills))));

\qecho 'Problem 7'
/*
Find the pid and name of each person p along with the set of pids of persons who (1) know p and (2)
who have the AI skill but not the Networks skill.
*/

select
  p.pid,
  p.pname,
  set_intersection
  (
	  set_intersection
	  (
		  (
			select array_agg(k.pid1 order by k.pid1)
			from knows k
			where k.pid2 = p.pid
		  ),
		  (
			select array_agg(ps.pid order by ps.pid)
			from personHasSkills ps
			where is_in('AI', ps.skills)
		  )
	   ),
	   (
		   select array_agg(ps.pid order by ps.pid)
			from personHasSkills ps
			where is_not_in('Networks', ps.skills)
	   )
  )
from person p
order by p.pid;

\qecho 'Problem 8'
/*
Find the pid and name of each person who has all the skills of the combined set of job skills of the
highest-paid persons who work for Google.
*/

select p.pid, p.pname
from Person p
where subset(array(select row(ps.pid)
				  	from personHasSkills ps
				  	where ps.pid = p.pid),
			   array(select row(ps2.pid)
				 	from personHasSkills ps2
				 	where ps2.pid = (select wf.pid
                                 from worksFor wf
                                 where cname = 'Google'
                                 and salary = (select max(wf2.salary)
                                                from worksFor wf2
                                                where wf2.cname = 'Google'))));

\qecho 'Problem 9'
/*
Find the set of companies that employ at least 3 persons who each know at least five persons. (So this
query returns only one object, i.e., the set of companies specified in the query.)
*/

create or replace view personsWithFiveConnections as
    select pid
    from knowsPersons kp
    where cardinality(kp.persons) >= 5;

select distinct c.cname
from companyHasEmployees c, worksFor w, personsWithFiveConnections pc 
where c.cname = w.cname
and w.pid = pc.pid 
group by c.cname
having count(distinct w.pid) >= 3;

\qecho 'Problem 10'
/*
Find the following set of sets
{S |S ⊆Skill∧|S |≤4}
I.e., this is the set consisting of each set of job skills whose size (cardinality) is at most 4.
*/

create type singleSkill as (skill text);

create or replace view Q as 
   select '{}' as sks
   union
   select make_singleton(row(s.skill)::singleSkill) as sks 
   from Skill s
   union
   select set_union(make_singleton(row(s1.skill)::singleSkill),
            make_singleton(row(s2.skill)::singleSkill)) as sks
   from Skill s1, Skill s2
   union
   select set_union(set_union(make_singleton(row(s1.skill)::singleSkill),
                     make_singleton(row(s2.skill)::singleSkill)),
            make_singleton(row(s3.skill)::singleSkill)) as sks
   from Skill s1, Skill s2, Skill s3
   union
   select set_union(set_union(set_union(make_singleton(row(s1.skill)::singleSkill),
                              make_singleton(row(s2.skill)::singleSkill)),
                     make_singleton(row(s3.skill)::singleSkill)),
            make_singleton(row(s4.skill)::singleSkill)) as sks
   from Skill s1, Skill s2, Skill s3, Skill s4;

create type multiSkill as (skills singleSkill[]);

select '{}' as sks
union
select make_singleton(row(q.sks)::multiSkill)
from Q q
union
select set_union(make_singleton(row(q1.sks)::multiSkill),
         make_singleton(row(q2.sks)::multiSkill))
from Q q1, Q q2;

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment5;





