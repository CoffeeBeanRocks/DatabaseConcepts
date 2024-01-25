-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE etmeyers;

-- Connecting to database 
\c etmeyers

-- Relation schemas and instances for assignment 4

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

\qecho 'Problem 6'
/*Find each pair (c, p) where c is the city and p is the pid of the person
that lives in c, and earns the lowest salary among all persons living in c. You must not use set 
predicates in this query*/

select p.city, p.pid
from Person p, worksFor w
where p.pid = w.pid
and w.salary in (select MIN(w1.salary)
			   	from Person p1, worksFor w1
			   	where p1.pid = w1.pid
			   	and p1.city = p.city)
order by p.city, p.pid;

\qecho 'Problem 7'
/*Let p1 be a person and N be the set of skills of Netflix employees. 
Find the pid and name of each person p1 if p1 has less then 2 of the skills in N i.e. 
the combined set of job skills of persons who work for Netflix.
*You must not use set predicates in this query.*/

create or replace view NetflixSkills as 
select distinct ps.skill
from personSkill ps, worksFor w
where ps.pid = w.pid
and w.cname = 'Netflix';

select p.pid, p.pname
from Person p
where ( select count(ps.skill)
	   	from personSkill ps
	   	where ps.pid = p.pid
	   	and ps.skill in (select *
						from NetflixSkills)
) < 2
order by p.pid;

\qecho 'Problem 8'
/*Find each pid of a person who knows at least two people who (a) work for
Apple and (b) who make less than 60000.
You must not use set predicates in this query.*/

select p.pid
from Person p
where (
    select count(w.pid)
    from Knows k, worksFor w
    where p.pid = k.pid1 
    and k.pid2 = w.pid
    and w.cname = 'Apple'
    and w.salary < 60000
) >= 2
order by p.pid;

\qecho 'Problem 9'
/*Find the pid and name of each person who knows at least
3 people who each have at most 2 managers.*/

create or replace view PeopleWith2Managers as
select p.pid, p.pname
from Person p
where (select count(*)
	  	from hasManager hm
	  	where hm.eid = p.pid) <= 2
		and exists (select 1
                      from hasManager hm
                      where hm.eid = p.pid);
			
create or replace function PeopleWhoKnowsPeopleWith2Managers(personPid int)
	returns integer as
	$$
	     select count(*)
          from Knows k
          where k.pid1 = personPid
          and k.pid2 in (select p2m.pid
					 	from PeopleWith2Managers p2m);
	$$ language sql;
	
select p.pid, p.pname
from Person p
where (PeopleWhoKnowsPeopleWith2Managers(p.pid)) >= 3;

\qecho 'Problem 10'
/*Find the cname of each company that employs an even
number of persons who have at least 2 skills*/

create or replace view EmployeesWith2Skills as
     select distinct wf.pid, wf.cname
     from worksFor wf
     where exists(select 1 
                    from personSkill ps, personSkill ps1
                    where ps.pid = wf.pid
                    and ps1.pid = wf.pid
                    and ps.skill <> ps1.skill);
 
create or replace function EmployeesWith2SkillsAtCompany(company text)
     returns integer as
     $$
          select count(e2s.cname)
          from employeesWith2Skills e2s
          where e2s.cname = company;
     $$ language sql;
 
select distinct c.cname
from Company c
where mod(EmployeesWith2SkillsAtCompany(c.cname),2) = 0;

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE etmeyers;
