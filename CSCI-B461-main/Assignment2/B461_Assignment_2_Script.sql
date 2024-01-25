CREATE DATABASE etmeyers;

\c etmeyers;

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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
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
 (1012,1001),
 (1014,1001),
 (1018,1001),
 (1001,1001),
 (1002,1002),
 (1003,1003),
 (1004,1004),
 (1005,1005),
 (1006,1006),
 (1007,1007),
 (1008,1008),
 (1009,1009),
 (1010,1010),
 (1011,1011),
 (1012,1012),
 (1013,1013),
 (1014,1014),
 (1015,1015),
 (1016,1016),
 (1017,1017),
 (1018,1018),
 (1019,1019);


create table PC(parent integer,
               child integer);
insert into PC values
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(5,8),
(8,9),
(8,10),
(8,11),
(7,12),
(7,13),
(12,14),
(14,15);

-- Find each triple (c, p, s) where c is the cname
-- of a company, p is the pid of a person who earns the lowest salary
-- at that company and knows at least someone who works at Apple,
-- and s is the salary of p.
\qecho 'Problem-1a'
select wf.cname, wf.pid, wf.salary
from worksFor wf
where not exists (select 1
				  from worksFor wf2
				  where wf.cname = wf2.cname 
				  and wf2.salary < wf.salary)
and exists (select 1
			from Knows k1, worksFor wf3
			where wf3.pid = k1.pid2
    		     and wf.pid = k1.pid1 
			and wf3.cname = 'Apple')
order by wf.cname;

\qecho 'Problem-1b'
select wf.cname, wf.pid, wf.salary
from worksFor wf
where wf.salary <= all (select wf2.salary
					    from worksFor wf2
					    where wf2.cname = wf.cname)
and wf.pid in (select k1.pid1
			   from Knows k1, worksFor wf3
			   where wf3.pid = k1.pid2
			   and wf3.cname = 'Apple')
order by wf.cname;

\qecho 'Problem-1c'
select wf1.cname, wf1.pid, wf1.salary
from worksFor wf1, worksFor wf2, Knows k1
where wf1.pid = k1.pid1
and wf2.pid = k1.pid2
and wf2.cname = 'Apple'
except
select wf2.cname, wf2.pid, wf2.salary
from worksFor wf2, worksFor wf3
where wf2.cname = wf3.cname
and wf2.salary > wf3.salary
order by cname;


-- Find each pair (c1, c2) of cnames of different
-- companies such that no employee of c1 and no employee of c2 live
-- in Chicago.
\qecho 'Problem-2a'
select distinct c1.cname, c2.cname
from Company c1, Company c2
where c1.cname <> c2.cname
and not exists (select 1
    			 from worksFor wf, Person p1
    			 where c1.cname = wf.cname 
      		 and wf.pid = p1.pid 
      		 and p1.city = 'Chicago')
and not exists (select 1
			 from worksFor wf2, Person p2
    			 where c2.cname = wf2.cname 
      		 and wf2.pid = p2.pid 
      		 and p2.city = 'Chicago')
order by c1.cname;


\qecho 'Problem-2b'
select distinct c1.cname, c2.cname
from Company c1, Company c2
where c1.cname <> c2.cname
and c1.cname not in (select wf.cname
    				 from worksFor wf, Person p1
    				 where c1.cname = wf.cname 
      				 and wf.pid = p1.pid 
      				 and p1.city = 'Chicago')
and c2.cname not in (select wf2.cname
					 from worksFor wf2, Person p2
    				      where c2.cname = wf2.cname 
      				 and wf2.pid = p2.pid 
      				 and p2.city = 'Chicago')
order by c1.cname;


\qecho 'Problem-2c'
select c1.cname, c2.cname
from Company c1, Company c2
where c1.cname <> c2.cname

except

select c1.cname, c2.cname
from Company c1, Company c2, worksFor wf, Person p1
where c1.cname <> c2.cname
  and c1.cname = wf.cname 
  and wf.pid = p1.pid 
  and p1.city = 'Chicago'
  
except 

select c1.cname, c2.cname
from Company c1, Company c2, worksFor wf, Person p1
where c1.cname <> c2.cname
  and c2.cname = wf.cname 
  and wf.pid = p1.pid 
  and p1.city = 'Chicago';


\qecho 'Problem-3b'
-- Find each triple (c, p, s) where c is the
-- cname of a company, p is the pid of a person who earns the lowest
-- salary at that company and knows at least someone who works
-- at Apple, and s is the salary of p.
-- \qecho 'Problem-5b'
select w.cname, w.pid, w.salary
from worksFor w
	join Knows k1 on (w.pid = k1.pid1)
	join worksFor w1 on (k1.pid2 = w1.pid and w1.cname = 'Apple')
except 
select w2.cname, w2.pid, w2.salary
from worksFor w2
	join worksFor w3 on (w2.cname = w3.cname and w2.salary > w3.salary)
order by cname;

\qecho 'Problem-4b'
-- Find each pair (c1, c2) of cnames of different
-- companies such that no employee of c1 and no employee of
-- c2 live in Chicago.

select c1.cname, c2.cname
from Company c1 
join Company c2 on c1.cname <> c2.cname

except 

select c1.cname, c2.cname
from Company c1
join Company c2 on c1.cname <> c2.cname 
join worksFor wf on wf.cname = c1.cname
join Person p1 on p1.pid = wf.pid and p1.city = 'Chicago'

except

select c1.cname, c2.cname
from Company c1
join Company c2 on c1.cname <> c2.cname 
join worksFor wf on wf.cname = c2.cname
join Person p2 on p2.pid = wf.pid and p2.city = 'Chicago';

\qecho 'Problem 5'
/* Create a materialized view CompanyKnownPerson such that, for each company, the view returns the pid
of Persons who are known by atleast one different person (other than pid) from the same company and earn the same salary.
Then test your view.*/

create materialized view CompanyKnownPerson as
select wf.pid
from Company c1, worksFor wf
where wf.cname = c1.cname
and exists (select 1 
			from worksFor wf2, Knows k1
			where wf2.pid = k1.pid1
			and k1.pid2 = wf.pid
			and wf2.cname = wf.cname
			and wf.salary = wf2.salary
               and wf.pid <> wf2.pid);

select * from CompanyKnownPerson;
\qecho 'Problem 6'

/*Create a parameterized view SkillOnlyOnePerson (skill1 text) that returns pair of different persons pid1, pid2 such that
pid1 should have the skill identified by skill1 and pid2 should not have the skill identified by skill1.
Test your view for skill1 = 'Networks'.*/

create function SkillOnlyOnePerson(skillName text)
     returns table(pid text, pid2 text) as
     $$     
          select distinct p1.pid, p2.pid
          from Person p1, Person p2
          where exists (select 1
			 	from personSkill ps
			 	where ps.pid = p1.pid
			 	and skill = skillName)
          and not exists (select 1
			 	from personSkill ps2
			 	where ps2.pid = p2.pid
			 	and skill = skillName)
          order by p1.pid, p2.pid;
     $$ language sql;

select *
from SkillOnlyOnePerson('Networks');

\qecho 'Problem 7'
/*Let PC(parent: integer, child: integer) be a rooted parent-child tree. So a pair (n,m) in PC indicates that node n is a parent of node m.
The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:

If n is a node in PC, then the pair (n,n) is in the sameGeneration relation. (Base rule)
If n_1 is the parent of m1 in PC and n2 is the parent of m2 in Tree and (n1,n2) is a pair in the 
sameGeneration relation then (m1,m2) is a pair in the sameGeneration relation. (Inductive Rule)

Write a recursive view for the sameGeneration relation.
Test your view. */

with recursive sameGeneration AS (
	--creating all the initial same generation
	(
		select distinct pc.parent n1, pc.parent n2
		from PC pc
	
		union
	
		select pc2.child m1, pc2.child m2
		from PC pc2
	)
	
	union 
	
	--if m1 and m2's parents exist in the same generation, 
	--then they are also in the same generation
	select distinct pc3.child m1, pc4.child m2
	from PC pc3, PC pc4, sameGeneration sg
	where pc3.parent = sg.n1
	and pc4.parent = sg.n2 
)
select *
from sameGeneration sg
order by sg.n1, sg.n2;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE etmeyers;