
CREATE DATABASE etmeyers;

\c etmeyers;


DROP SCHEMA PUBLIC CASCADE;


CREATE SCHEMA PUBLIC;


CREATE TABLE Person(pid integer, pname text, city text, primary key (pid));


CREATE TABLE Company(cname text, headquarter text, primary key (cname));


CREATE TABLE Skill(skill text, primary key (skill));


CREATE TABLE worksFor(pid integer, cname text, salary integer, primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text, city text, primary key (cname,
                                                                 city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill
        (pid integer, skill text, primary key (pid,
                                               skill),
         foreign key (pid) references Person (pid) on delete cascade,
         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer, mid integer, primary key (eid,
                                                               mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));


CREATE TABLE Knows(pid1 integer, pid2 integer, primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));


INSERT INTO Person
VALUES (1001,
        'Jean',
        'Cupertino'), (1002,
                       'Vidya',
                       'Cupertino'), (1003,
                                      'Anna',
                                      'Seattle'), (1004,
                                                   'Qin',
                                                   'Seattle'), (1005,
                                                                'Megan',
                                                                'MountainView'), (1006,
                                                                                  'Ryan',
                                                                                  'Chicago'), (1007,
                                                                                               'Danielle',
                                                                                               'LosGatos'), (1008,
                                                                                                             'Emma',
                                                                                                             'Bloomington'), (1009,
                                                                                                                              'Hasan',
                                                                                                                              'Bloomington'), (1010,
                                                                                                                                               'Linda',
                                                                                                                                               'Chicago'), (1011,
                                                                                                                                                            'Nick',
                                                                                                                                                            'MountainView'), (1012,
                                                                                                                                                                              'Eric',
                                                                                                                                                                              'Cupertino'), (1013,
                                                                                                                                                                                             'Lisa',
                                                                                                                                                                                             'Indianapolis'), (1014,
                                                                                                                                                                                                               'Deepa',
                                                                                                                                                                                                               'Bloomington'), (1015,
                                                                                                                                                                                                                                'Chris',
                                                                                                                                                                                                                                'Denver'), (1016,
                                                                                                                                                                                                                                            'YinYue',
                                                                                                                                                                                                                                            'Chicago'), (1017,
                                                                                                                                                                                                                                                         'Latha',
                                                                                                                                                                                                                                                         'LosGatos'), (1018,
                                                                                                                                                                                                                                                                       'Arif',
                                                                                                                                                                                                                                                                       'Bloomington'), (1019,
                                                                                                                                                                                                                                                                                        'John',
                                                                                                                                                                                                                                                                                        'NewYork');


INSERT INTO Company
VALUES ('Apple',
        'Cupertino'), ('Amazon',
                       'Seattle'), ('Google',
                                    'MountainView'), ('Netflix',
                                                      'LosGatos'), ('Microsoft',
                                                                    'Redmond'), ('IBM',
                                                                                 'NewYork'), ('ACM',
                                                                                              'NewYork'), ('Yahoo',
                                                                                                           'Sunnyvale');


INSERT INTO worksFor
VALUES (1001,
        'Apple',
        65000), (1002,
                 'Apple',
                 45000), (1003,
                          'Amazon',
                          55000), (1004,
                                   'Amazon',
                                   55000), (1005,
                                            'Google',
                                            60000), (1006,
                                                     'Amazon',
                                                     55000), (1007,
                                                              'Netflix',
                                                              50000), (1008,
                                                                       'Amazon',
                                                                       50000), (1009,
                                                                                'Apple',
                                                                                60000), (1010,
                                                                                         'Amazon',
                                                                                         55000), (1011,
                                                                                                  'Google',
                                                                                                  70000), (1012,
                                                                                                           'Apple',
                                                                                                           50000), (1013,
                                                                                                                    'Yahoo',
                                                                                                                    55000), (1014,
                                                                                                                             'Apple',
                                                                                                                             50000), (1015,
                                                                                                                                      'Amazon',
                                                                                                                                      60000), (1016,
                                                                                                                                               'Amazon',
                                                                                                                                               55000), (1017,
                                                                                                                                                        'Netflix',
                                                                                                                                                        60000), (1018,
                                                                                                                                                                 'Apple',
                                                                                                                                                                 50000), (1019,
                                                                                                                                                                          'Microsoft',
                                                                                                                                                                          50000);


INSERT INTO companyLocation
VALUES ('Apple',
        'Bloomington'), ('Amazon',
                         'Chicago'), ('Amazon',
                                      'Denver'), ('Amazon',
                                                  'Columbus'), ('Google',
                                                                'NewYork'), ('Netflix',
                                                                             'Indianapolis'), ('Netflix',
                                                                                               'Chicago'), ('Microsoft',
                                                                                                            'Bloomington'), ('Apple',
                                                                                                                             'Cupertino'), ('Amazon',
                                                                                                                                            'Seattle'), ('Google',
                                                                                                                                                         'MountainView'), ('Netflix',
                                                                                                                                                                           'LosGatos'), ('Microsoft',
                                                                                                                                                                                         'Redmond'), ('IBM',
                                                                                                                                                                                                      'NewYork'), ('Yahoo',
                                                                                                                                                                                                                   'Sunnyvale');


INSERT INTO Skill
VALUES ('Programming'), ('AI'), ('Networks'), ('OperatingSystems'), ('Databases'), ('WebDevelopment');


INSERT INTO personSkill
VALUES (1001,
        'Programming'), (1001,
                         'AI'), (1002,
                                 'Programming'), (1002,
                                                  'AI'), (1004,
                                                          'AI'), (1004,
                                                                  'Programming'), (1005,
                                                                                   'AI'), (1005,
                                                                                           'Programming'), (1005,
                                                                                                            'Networks'), (1006,
                                                                                                                          'Programming'), (1006,
                                                                                                                                           'OperatingSystems'), (1007,
                                                                                                                                                                 'OperatingSystems'), (1007,
                                                                                                                                                                                       'Programming'), (1009,
                                                                                                                                                                                                        'OperatingSystems'), (1009,
                                                                                                                                                                                                                              'Networks'), (1010,
                                                                                                                                                                                                                                            'Networks'), (1011,
                                                                                                                                                                                                                                                          'Networks'), (1011,
                                                                                                                                                                                                                                                                        'OperatingSystems'), (1011,
                                                                                                                                                                                                                                                                                              'AI'), (1011,
                                                                                                                                                                                                                                                                                                      'Programming'), (1012,
                                                                                                                                                                                                                                                                                                                       'AI'), (1012,
                                                                                                                                                                                                                                                                                                                               'OperatingSystems'), (1012,
                                                                                                                                                                                                                                                                                                                                                     'Programming'), (1013,
                                                                                                                                                                                                                                                                                                                                                                      'Programming'), (1013,
                                                                                                                                                                                                                                                                                                                                                                                       'OperatingSystems'), (1013,
                                                                                                                                                                                                                                                                                                                                                                                                             'Networks'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                           'OperatingSystems'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                 'AI'), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                         'Networks'), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       'Programming'), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        'AI'), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                'OperatingSystems'), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      'AI'), (1017,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              'Programming'), (1018,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               'AI'), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       'Networks'), (1003,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     'WebDevelopment');


INSERT INTO hasManager
VALUES (1004,
        1003), (1006,
                1003), (1015,
                        1003), (1016,
                                1004), (1016,
                                        1006), (1008,
                                                1015), (1010,
                                                        1008), (1007,
                                                                1017), (1002,
                                                                        1001), (1009,
                                                                                1001), (1014,
                                                                                        1012), (1011,
                                                                                                1005);


INSERT INTO Knows
VALUES (1011,
        1009), (1007,
                1016), (1011,
                        1010), (1003,
                                1004), (1006,
                                        1004), (1002,
                                                1014), (1009,
                                                        1005), (1018,
                                                                1009), (1007,
                                                                        1017), (1017,
                                                                                1019), (1019,
                                                                                        1013), (1016,
                                                                                                1015), (1001,
                                                                                                        1012), (1015,
                                                                                                                1011), (1019,
                                                                                                                        1006), (1013,
                                                                                                                                1002), (1018,
                                                                                                                                        1004), (1013,
                                                                                                                                                1007), (1014,
                                                                                                                                                        1006), (1004,
                                                                                                                                                                1014), (1001,
                                                                                                                                                                        1014), (1010,
                                                                                                                                                                                1013), (1010,
                                                                                                                                                                                        1014), (1004,
                                                                                                                                                                                                1019), (1018,
                                                                                                                                                                                                        1007), (1014,
                                                                                                                                                                                                                1005), (1015,
                                                                                                                                                                                                                        1018), (1014,
                                                                                                                                                                                                                                1017), (1013,
                                                                                                                                                                                                                                        1018), (1007,
                                                                                                                                                                                                                                                1008), (1005,
                                                                                                                                                                                                                                                        1015), (1017,
                                                                                                                                                                                                                                                                1014), (1015,
                                                                                                                                                                                                                                                                        1002), (1018,
                                                                                                                                                                                                                                                                                1013), (1018,
                                                                                                                                                                                                                                                                                        1010), (1001,
                                                                                                                                                                                                                                                                                                1008), (1012,
                                                                                                                                                                                                                                                                                                        1011), (1002,
                                                                                                                                                                                                                                                                                                                1015), (1007,
                                                                                                                                                                                                                                                                                                                        1013), (1008,
                                                                                                                                                                                                                                                                                                                                1007), (1004,
                                                                                                                                                                                                                                                                                                                                        1002), (1015,
                                                                                                                                                                                                                                                                                                                                                1005), (1009,
                                                                                                                                                                                                                                                                                                                                                        1013), (1004,
                                                                                                                                                                                                                                                                                                                                                                1012), (1002,
                                                                                                                                                                                                                                                                                                                                                                        1011), (1004,
                                                                                                                                                                                                                                                                                                                                                                                1013), (1008,
                                                                                                                                                                                                                                                                                                                                                                                        1001), (1008,
                                                                                                                                                                                                                                                                                                                                                                                                1019), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                        1008), (1001,
                                                                                                                                                                                                                                                                                                                                                                                                                1019), (1019,
                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1004,
                                                                                                                                                                                                                                                                                                                                                                                                                                1003), (1006,
                                                                                                                                                                                                                                                                                                                                                                                                                                        1003), (1015,
                                                                                                                                                                                                                                                                                                                                                                                                                                                1003), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                        1004), (1016,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                1006), (1008,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1015), (1010,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1008), (1017,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1013), (1002,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001), (1009,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1011,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1005), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1012), (1012,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001), (1014,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        1001), (1018,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1001);

\qecho 'Problem 2' 
/*
Find the pid of each person that knows at least 2 people, such
that at least 1 of them works at Apple or Netflix .
A possible way to write this query in Pure SQL is
     select distinct p.pid from Person p, Knows k1, Knows k2
     where k1.pid1 = p.pid
     and k2.pid1 = p.pid
     and k1.pid2 <> k2.pid2
     and exists (
     select 1 from worksFor w
     where (w.pid = k1.pid2 or w.pid = k2.pid2)
     and (w.cname = 'Apple' or w.cname = 'Netflix'));

Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step. */

-- \qecho 'Step 1: Eliminate EXISTS '
-- select distinct p.pid
-- from Person p, Knows k1, Knows k2, worksFor w
-- where k1.pid1 = p.pid
-- and k2.pid1 = p.pid 
-- and k1.pid2 <> k2.pid2
-- and (w.pid = k1.pid2 or w.pid = k2.pid2) and (w.cname = 'Apple' or w.cname = 'Netflix');

-- \qecho 'Step 2: Introduce JOINs '
select distinct p.pid
from Person p
join Knows k1 on k1.pid1 = p.pid
join Knows k2 on k2.pid1 = p.pid and k1.pid2 <> k2.pid2
join worksFor w on (w.pid = k1.pid2 or w.pid = k2.pid2) and (w.cname = 'Apple' or w.cname = 'Netflix');


\qecho 'Problem 3';
/*
Return the the pair (p, c) where p is the pid of a person, and c is the cname of the company such that 
 (1) p is managed by someone who has at-least 2 skills 
 (2) and (p) does not know anyone that lives in Seattle
 
A possible way to write this query in Pure SQL is

select p.pid, c.cname
from person p , company c, worksfor w
where p.pid = w.pid and c.cname = w.cname
and exists (
	select 1 from hasManager m, personSkill ps1, personSkill ps2 
	where m.eid = p.pid and ps1.pid = m.mid and ps2.pid = m.mid
	and ps1.skill <> ps2.skill
)
and p.pid not in (
	select k1.pid1 from knows k1 
	where k1.pid2 in (select p1.pid from person p1 where p1.city='Seattle')
);

Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ 

-- \qecho 'Step 1: Eliminate EXISTS '
-- select distinct p.pid, c.cname
-- from Person p, Company c, worksFor w, hasManager m, personSkill ps1, personSkill ps2
-- where p.pid = w.pid
-- and c.cname = w.cname
-- and m.eid = p.pid 
-- and ps1.pid = m.mid 
-- and ps2.pid = m.mid
-- and ps1.skill <> ps2.skill
-- and p.pid not in (
-- 	select k1.pid1 from knows k1 
-- 	where k1.pid2 in (select p1.pid from person p1 where p1.city='Seattle'))
-- order by p.pid;

-- \qecho 'Step 2: Eliminate NOT IN '
-- select q.pid, q.cname
-- from (
-- 		select p.pid, c.cname
-- 		from Person p, Company c, worksFor w, hasManager m, personSkill ps1, personSkill ps2
-- 		where c.cname = w.cname 
-- 		and p.pid = w.pid
-- 		and m.eid = p.pid
-- 		and ps1.pid = m.mid
-- 		and ps2.pid = m.mid 
-- 		and ps1.skill <> ps2.skill

-- 		except 
	
-- 		select p.pid, w.cname
-- 		from Person p, worksFor w, Person p1, Knows k1
-- 		where k1.pid1 = p.pid 
-- 		and k1.pid2 = p1.pid
-- 		and p1.city = 'Seattle')q
-- order by q.pid;

-- \qecho 'Step 3: Introduce JOINs '
select q.pid, q.cname
from (
	select p.pid, c.cname
	from person p
	cross join company c
	join worksfor w on c.cname = w.cname and p.pid = w.pid
	join hasManager m on m.eid = p.pid
	join personSkill ps1 on ps1.pid = m.mid
	join personSkill ps2 on (ps2.pid = m.mid and ps1.skill <> ps2.skill)
	
	except
	
	select p.pid, w.cname
	from person p
	cross join worksfor w
	cross join person p1
	join knows k1 on k1.pid1 = p.pid and k1.pid2 = p1.pid 
	where p1.city = 'Seattle')q
order by q.pid;


\qecho 'Problem 4';
/*
Return each skill that is the skill of at least 2 persons, such that
at least 1 of them lives in Bloomington
Formulate this query in Pure SQL.
Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ 

-- Pure SQL
-- select s.skill
-- from Skill s
-- where exists ( select 1 
--                 from personSkill ps, personSkill ps1, Person p, Person p1
--                 where ps.skill = s.skill
--                 and ps1.skill = s.skill
--                 and ps.pid <> ps1.pid
--                 and p.pid = ps.pid
--                 and p1.pid = ps1.pid
--                 and (p.city = 'Bloomington' or p1.city = 'Bloomington')
-- );

-- RA SQL
-- \qecho 'Step 1: Eliminate EXISTS '
-- select distinct s.skill
-- from Skill s, personSkill ps, personSkill ps1, Person p, Person p1
-- where ps.skill = s.skill
-- and ps1.skill = s.skill 
-- and ps1.pid <> ps.pid
-- and p.pid = ps.pid
-- and p1.pid = ps1.pid
-- and (p.city = 'Bloomington' or p1.city = 'Bloomington');

-- \qecho 'Step 2: Introduce JOINs '
select distinct s.skill
from Skill s
join personSkill ps on ps.skill = s.skill
join personSkill ps1 on ps1.skill = s.skill and ps1.pid <> ps.pid
join Person p on p.pid = ps.pid
join Person p1 on p1.pid = ps1.pid
where (p.city = 'Bloomington' or p1.city = 'Bloomington');

\qecho 'Problem 5';
/*
Return the pair (p, s) where p is the pid of a person that works at
a company headquartered in MountainView and s is the minimum salary
among all people that know p.
Formulate this query in Pure SQL.*/
/*Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ 

--Pure SQL
-- select distinct wf1.pid, wf2.salary
-- from worksFor wf1, worksFor wf2, Company c, Knows k
-- where wf1.cname = c.cname
-- and c.headquarter = 'MountainView'
-- and k.pid2 = wf1.pid
-- and k.pid1 = wf2.pid
-- and not exists (select 1
-- 		from worksFor wf3, Knows k2
-- 		where k2.pid2 = wf1.pid
-- 		and k2.pid1 = wf3.pid
-- 		and wf3.salary < wf2.salary );

--RA SQL
-- \qecho 'Step 1: Eliminate NOT EXISTS '
-- select q.pid, q.salary
-- from (select wf1.pid, wf2.salary
-- 		from worksFor wf1, worksFor wf2, Company c, Knows k
-- 		where wf1.cname = c.cname
-- 		and c.headquarter = 'MountainView'
-- 		and k.pid2 = wf1.pid
-- 		and k.pid1 = wf2.pid

-- 		except 

-- 		select wf1.pid, wf2.salary
-- 		from worksFor wf1, worksFor wf2, worksFor wf3, Knows k2
-- 		where k2.pid2 = wf1.pid
-- 		and k2.pid1 = wf3.pid
-- 		and wf3.salary < wf2.salary)q;

-- \qecho 'Step 2: Introduce JOINs '
select q.pid, q.salary
from (select w.pid, w1.salary
	 	from worksFor w
	 	join Knows k on k.pid2 = w.pid
	 	join worksFor w1 on w1.pid = k.pid1
	 	join Company c on w.cname = c.cname and c.headquarter = 'MountainView'
	 	
	  	except
	  
	  select w.pid, w1.salary
	  	from worksFor w
	  	join Knows k on k.pid2 = w.pid
	  	join worksFor w2 on w2.pid = k.pid1
	  	join worksFor w1 on w2.salary < w1.salary
	 )q;

\qecho 'Problem 6';
/*
Return each cname such that
(1) at least 1 person working there has the OperatingSystems skill
(2) at least 2 persons working there live in different cities
Formulate this query in Pure SQL.
Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/

--Pure SQL
-- select c.cname
-- from Company c
-- where exists (select 1
-- 		from worksFor wf, personSkill ps
-- 		where wf.cname = c.cname
-- 		and ps.pid = wf.pid
-- 		and ps.skill = 'OperatingSystems')
-- and exists (select 1
-- 		from worksFor wf1, worksFor wf2, Person p1, Person p2
-- 		where wf1.cname = c.cname
-- 		and wf2.cname = c.cname
-- 		and p1.pid = wf1.pid
-- 		and p2.pid = wf2.pid
-- 		and p1.city <> p2.city);

--RA SQL
--\qecho 'Step 1: Eliminate first EXISTS '
-- select distinct c.cname
-- from Company c, worksFor wf, personSkill ps
-- where wf.cname = c.cname
-- and ps.pid = wf.pid
-- and ps.skill = 'OperatingSystems' 
-- and exists (select 1
-- 		from worksFor wf1, worksFor wf2, Person p1, Person p2
-- 		where wf1.cname = c.cname
-- 		and wf2.cname = c.cname
-- 		and p1.pid = wf1.pid
-- 		and p2.pid = wf2.pid
-- 		and p1.city <> p2.city);

--\qecho 'Step 1: Eliminate second EXISTS '
-- select distinct c.cname
-- from Company C, worksFor wf, personSkill ps, worksFor wf1, worksFor wf2, Person p1, Person p2
-- where wf.cname = c.cname
-- and ps.pid = wf.pid 
-- and ps.skill = 'OperatingSystems'
-- and wf1.cname = c.cname
-- and wf2.cname = c.cname
-- and p1.pid = wf1.pid
-- and p2.pid = wf2.pid 
-- and p1.city <> p2.city;

-- \qecho 'Step 3: Introduce JOINs '
select distinct c.cname
from Company c
join worksFor wf on wf.cname = c.cname
join personSkill ps on ps.pid = wf.pid and ps.skill = 'OperatingSystems'
join worksFor wf1 on wf1.cname = c.cname
join worksFor wf2 on wf2.cname = c.cname
join Person p1 on p1.pid = wf1.pid
join Person p2 on p2.pid = wf2.pid and p1.city <> p2.city;

\c postgres;


DROP DATABASE etmeyers;