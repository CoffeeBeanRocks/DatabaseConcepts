-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE assignment6;

-- Connecting to database 
\c assignment6

-- Consider the lecture on Nested and Semi-structured Data models.  In
-- that lecture, we considered the {\tt studentGrades} nested relation
-- and we constructed it using a PostgreSQL query starting from the {\tt
-- Enroll} relation.

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');


\qecho 'Problem 1'

--Write a PostgreSQL view courseGrades that creates the nested relation of type
--(cno,gradeInfo{(grade,students{(sid)})})

--This view should compute for each course, the grade information of the
--students enrolled in this course. In particular, for each course and for
--each grade, this relation stores in a set the students who obtained that
--grade in that course.

create type studentType as (sid text);
create type gradeStudents as (grade text, student studentType[]);

create or replace view courseGrades as
with e as (select cno, grade, array_agg(row(sid)::studentType) as students
		   from enroll
		   group by(cno, grade)
		   ),
	 f as (select cno, array_agg(row(grade, students)::gradeStudents
									order by grade) as gradeInfo
			from e
			group by (cno)
		   )
select * from f order by cno;

select * from courseGrades;		

\qecho 'Problem 2'

--Starting from the courseGrades view in Problem 1 solve the following query
--Find each (s, C) pair where s is the sid of a students and C is
--the set of cnos of courses in which the student received an ‘A’ or
--a ‘B’ but not a ‘C’. The type of your answer relation should be (sid : text, Courses : {(cno : text)}).

select f as sid, array_agg(cg.cno) as courses
from courseGrades cg, unnest(cg.gradeInfo) g, unnest(g.student) as f
where (g.grade = 'A' or g.grade = 'B')
group by f
order by f;

\qecho 'Problem 3'

--Write a PostgreSQL view jcourseGrades that creates a semi-structured
--database which stores jsonb objects whose structure conforms with the
--structure of tuples as described for the courseGrades in Problem 1.
--Test your view.

create or replace view jstudentGrades as
with e as (select cno, grade, array_to_json(array_agg(json_build_object('sid', sid))) as students
		   from enroll
		   group by(cno, grade)
		   order by(cno, grade)
		   ),
	 f as (select json_build_object('cno', cno, 'gradeInfo', array_to_json(array_agg(json_build_object('grade', grade, 'students', students)))) as gradeInfo
			from e
			group by (cno)
		   	order by (cno)
		   )
select * from f;

select * from jstudentGrades;

\qecho 'Problem 4'

-- Write a PL/pgSQL function that takes an array of integers as input 
-- and returns a new array where each element is the sum of all the 
-- elements in the input array up to and including that element. 
-- For example, if the input array is [1, 2, 3, 4], the output array should be [1, 3, 6, 10].

create or replace function runningSum(input integer[])
returns integer[] as $$
declare
    result integer[] := '{}';
    curr integer := 0;
begin
    for i in 1..array_length(input, 1) loop
        curr := curr + input[i];
        result := result || curr;
    end loop;

    return result;
end;
$$ language plpgsql;

select runningSum(array[1, 2, 3, 4]);

\qecho 'Problem 5'

-- Write a function that takes a positive integer as input and 
-- returns an array of all the prime numbers up to and including that integer.

create or replace function generatePrimes(n integer)
returns integer[] as $$
declare
    primes integer[] := '{}';
    isPrime boolean;
begin
    if n < 2 then
        return primes;
    end if;

    for i in 2..n loop
        isPrime := TRUE;

        for j in 2..TRUNC(sqrt(i)) loop
            if i % j = 0 then
                isPrime := FALSE;
                exit;
            end if;
        end loop;

        if isPrime then
            primes := primes || i;
        end if;
    end loop;

    return primes;
end;
$$ language plpgsql;

select generatePrimes(15);

\qecho 'Problem 6'

-- same generation

create table PC(parent int, child int);

insert into PC values 
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);

-- Consider a parent-child relation PC(parent, child). (You can assume
-- that PC is a rooted tree and the domain of the attributes parent
-- and child is int.) An edge (p,c) in PC indicates that node p is a
-- parent of node c. Now consider a pair of nodes (m,n) in PC (m and n
-- maybe the same nodes.) We say that m and n are in the same
-- generation when the distance from m to the root of PC is the same
-- as the distance from n to the root of PC.

-- Consider the following recursive query that computes the {\tt
-- sameGeneration} relation:

/*
WITH RECURSIVE sameGeneration(m, n) AS
          ((SELECT parent, parent FROM PC) UNION (select child, child from PC)
          UNION
          SELECT  t1.child, t2.child
          FROM    sameGeneration pair, PC t1, PC t2
          WHERE   pair.m = t1.parent and pair.n = t2.parent)
SELECT DISTINCT pair.m, pair.n from sameGeneration pair order by m, n;
*/

-- Write a non-recursive function sameGeneration() in the language
-- plpgsql that computes the sameGeneration relation.

create table if not exists SG(m int, n int);

create or replace function new_SG_pairs()
	returns table (m int, n int) as
$$  
	(select pc1.child, pc2.child
	from SG sg, PC pc1, PC pc2
	where sg.m = pc1.parent
	and sg.n = pc2.parent)
	
	except
	
	(select * 
	from SG);
$$ language sql;

create or replace function sameGeneration()
  returns table (m int, n int) as
$$
begin	
	drop table if exists SG;
	create table SG(m int, n int);
	
	insert into SG
	select distinct p1.parent, p1.parent
	from PC p1
	where not exists (select 1 from PC p2 where p2.child = p1.parent);
	
	while exists(select 1 from new_SG_pairs()) 
	loop
		insert into SG
		select *
		from new_SG_pairs();
	end loop;
	
    return query 
		select * 
		from SG 
		order by 1,2;
end;
$$ language plpgsql;

select * from sameGeneration();

\c postgres

drop database assignment6;