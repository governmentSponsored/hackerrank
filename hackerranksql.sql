#all of this is for mysql, so note the syntax will be different for different sql flavors
#https://www.hackerrank.com/challenges/weather-observation-station-4/problem
select (SELECT COUNT(*) from station) - (select count(*) from (SELECT DISTINCT CITY FROM STATION) as count);

#https://www.hackerrank.com/challenges/weather-observation-station-5/problem
SELECT CITY, CHAR_LENGTH(CITY) as the_length
FROM STATION 
ORDER BY the_length, city
LIMIT 1;
SELECT CITY, CHAR_LENGTH(CITY) as the_length
FROM STATION 
ORDER BY the_length desc
LIMIT 1;

#https://www.hackerrank.com/challenges/weather-observation-station-11/problem
SELECT DISTINCT CITY FROM STATION
WHERE
    (CITY NOT LIKE '%A' AND
    CITY NOT LIKE '%E' AND
    CITY NOT LIKE '%I' AND
    CITY NOT LIKE '%O' AND
    CITY NOT LIKE '%U') OR
    (CITY NOT LIKE 'A%' AND
    CITY NOT LIKE 'E%' AND
    CITY NOT LIKE 'I%' AND
    CITY NOT LIKE 'O%' AND
    CITY NOT LIKE 'U%');

#https://www.hackerrank.com/challenges/more-than-75-marks/problem
select name from students where marks > 75
order by substring(name,-3,CHAR_LENGTH(name)), ID;

#https://www.hackerrank.com/challenges/what-type-of-triangle/problem
SELECT
    (CASE
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN (A = B OR B = C OR A = C) AND (A + B > C AND B + C > A) THEN 'Isosceles'
        WHEN (A != B AND B != C AND A != C) AND (A + B > C AND B + C > A) THEN 'Scalene'
        ELSE 'Not A Triangle'
    END) as Name
from triangles

#https://www.hackerrank.com/challenges/the-pads/problem
select CONCAT(Name,'(',SUBSTRING(Occupation,1,1),')')
from OCCUPATIONS
order by Name;
select CONCAT('There are a total of ', count(*), ' ', LOWER(Occupation), 's.')
from OCCUPATIONS
group by Occupation
order by count(*), Occupation;

#https://www.hackerrank.com/challenges/occupations/problem
set @row1=0, @row2=0, @row3=0, @row4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@row1:=@row1+1)
            when Occupation='Professor' then (@row2:=@row2+1)
            when Occupation='Singer' then (@row3:=@row3+1)
            when Occupation='Actor' then (@row4:=@row4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber;

#https://www.hackerrank.com/challenges/the-company/problem
select 
    c.company_code, 
    c.founder, 
    count(distinct lm.lead_manager_code), 
    count(distinct sm.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
from Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
where
    c.company_code = lm.company_code AND
    lm.lead_manager_code = sm.lead_manager_code AND
    sm.senior_manager_code = m.senior_manager_code AND
    m.manager_code = e.manager_code
group by c.company_code, c.founder 
order by c.company_code;

#https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem
select count(*) 
from CITY
where population > 100000;

#https://www.hackerrank.com/challenges/revising-aggregations-sum/problem
select sum(population)
from city
where district = 'California';

#https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem
select avg(population)
from city
where district = 'California';

#https://www.hackerrank.com/challenges/average-population/problem
select round(avg(population))
from city;

#https://www.hackerrank.com/challenges/the-blunder/problem
select Ceil(avg(salary) - avg(replace(salary,0,'')))
from employees;

#https://www.hackerrank.com/challenges/earnings-of-employees/problem
select 
    salary * months as earnings, 
    count(*) 
from employee 
group by earnings 
order by earnings desc limit 1;

#https://www.hackerrank.com/challenges/weather-observation-station-2/problem
select round(sum(LAT_N),2), round(sum(long_w),2)
from station;

#https://www.hackerrank.com/challenges/weather-observation-station-13/problem
select round(sum(lat_n),4)
from station
where lat_n > 38.7880 and lat_n < 137.2345;

#https://www.hackerrank.com/challenges/weather-observation-station-14/problem
select round(max(lat_n),4)
from station
where lat_n < 137.2345;

#https://www.hackerrank.com/challenges/weather-observation-station-15/problem
/*Tried to do it both with & w/o sub query*/
select round(long_w,4)
from station
where lat_n = (
    select max(lat_n) 
    from station 
    where lat_n < 137.2345
);
select round(long_w,4)
from station
where lat_n < 137.2345
order by lat_n desc
limit 1;

#https://www.hackerrank.com/challenges/weather-observation-station-16/problem
select round(min(lat_n),4)
from station
where lat_n > 38.7780;

#https://www.hackerrank.com/challenges/weather-observation-station-17/problem
select round(long_w,4)
from station
where lat_n > 38.7780
order by lat_n
limit 1;

#https://www.hackerrank.com/challenges/weather-observation-station-18/problem
select round(abs(min(lat_n) - min(long_w)) + abs(max(lat_n) - max(long_w)),4) 
from station; #actual answer to the question

select round(((max(LAT_N) - min(LAT_N)) + (max(LONG_W) - min(LONG_W))), 4) 
from STATION; #the answer the site accepts...

#https://www.hackerrank.com/challenges/weather-observation-station-19/problem #12672
select 
    round(sqrt(
            power((min(lat_n) - max(lat_n)),2) +
            power((min(long_w) - max(long_w)),2)
        ),4)
from station;

#https://www.hackerrank.com/challenges/weather-observation-station-20/problem
Select 
    round(S.LAT_N,4) median 
from 
    station S 
where 
    (select 
        count(Lat_N) 
    from 
        station 
    where 
        Lat_N < S.LAT_N ) = 
    (select 
        count(Lat_N) 
    from 
        station 
    where 
        Lat_N > S.LAT_N)

#https://www.hackerrank.com/challenges/symmetric-pairs/problem
select x, y from functions func1
where exists(
    select x, y 
    from functions func2 
    where 
        func1.x = func2.y and 
        func2.x = func1.y and
        func1.x < func2.x
) and (x != y)
union 
select x, y from functions func1 
where 
    x=y and 
    ((
        select count(*) 
        from functions 
        where 
            func1.x = x and 
            func1.x = y
    ) > 1)
order by x;

#https://www.hackerrank.com/challenges/asian-population/problem
select sum(city.population)
from city inner join country on city.countrycode = country.code
where continent = 'Asia'

#https://www.hackerrank.com/challenges/african-cities/problem
select city.name
from city inner join country on country.code = city.countrycode
where continent = 'Africa'

#https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
select country.continent, floor(avg(city.population))
from country inner join city on country.code = city.countrycode
group by country.continent

#https://www.hackerrank.com/challenges/the-report/problem
select (
    case when g.grade < 8 then NULL 
    else s.name
    end), 
    g.grade, s.marks
from grades g inner join students s on s.marks >= g.min_mark and s.marks <= g.max_mark
order by grade desc, s.name asc

#https://www.hackerrank.com/challenges/full-score/problem
select 
	h.hacker_id, name
from
	hackers h inner join
	submissions s on s.hacker_id = h.hacker_id inner join
	challenges c on c.challenge_id = s.challenge_id inner join
	difficulty d on d.difficulty_level = c.difficulty_level
where 
	s.score = d.score and 
	d.difficulty_level = c.difficulty_level
group by name, h.hacker_id
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, h.hacker_id asc;

#https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
select id, age, coins_needed, `power`
from 
	wands w inner join 
	wands_property wp on w.code = wp.code
where 
	is_evil = 0 and 
	coins_needed = (
		select min(coins_needed) 
		from 
			wands w2 inner join 
			wands_property wp2 on w2.code = wp2.code 
		where wp.age = wp2.age and w2.power = w.power
	)
order by `power` desc, age desc

#https://www.hackerrank.com/challenges/challenges/problem
select h.hacker_id, h.name, count(c.challenge_id) the_count
from 
    hackers h inner join
    challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having 
	the_count = (
		select count(c2.challenge_id)
		from 
		    hackers h2 inner join
		    challenges c2 on h2.hacker_id = c2.hacker_id
		group by h2.hacker_id
	    order by count(c2.challenge_id) desc
	    limit 1
	) or 
	the_count in (
		select temp.the_count2 from (
			select count(*) the_count2
			from challenges
			group by hacker_id
		) temp
		group by temp.the_count2
		having count(temp.the_count2) = 1
	)
order by count(c.challenge_id) desc, h.hacker_id;

#https://www.hackerrank.com/challenges/contest-leaderboard/problem
/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.
*/
select h.hacker_id, name, sum(score) as total_score
from 
	hackers h inner join
	(
		select hacker_id, max(score) as score 
		from submissions 
		group by challenge_id, hacker_id
	) max_score on h.hacker_id = max_score.hacker_id
group by h.hacker_id, name
having total_score > 0
order by total_score desc, h.hacker_id;

#https://www.hackerrank.com/challenges/print-prime-numbers/problem
/* still a work in progress...*/
select GROUP_CONCAT(SeqValue SEPARATOR '&') as primes
from
	(SELECT
	    (HUNDREDS.SeqValue + TENS.SeqValue + ONES.SeqValue) SeqValue
	FROM
	    (
	    SELECT 0  SeqValue
	    UNION ALL
	    SELECT 1 SeqValue
	    UNION ALL
	    SELECT 2 SeqValue
	    UNION ALL
	    SELECT 3 SeqValue
	    UNION ALL
	    SELECT 4 SeqValue
	    UNION ALL
	    SELECT 5 SeqValue
	    UNION ALL
	    SELECT 6 SeqValue
	    UNION ALL
	    SELECT 7 SeqValue
	    UNION ALL
	    SELECT 8 SeqValue
	    UNION ALL
	    SELECT 9 SeqValue
	    ) ONES
	CROSS JOIN
	    (
	    SELECT 0 SeqValue
	    UNION ALL
	    SELECT 10 SeqValue
	    UNION ALL
	    SELECT 20 SeqValue
	    UNION ALL
	    SELECT 30 SeqValue
	    UNION ALL
	    SELECT 40 SeqValue
	    UNION ALL
	    SELECT 50 SeqValue
	    UNION ALL
	    SELECT 60 SeqValue
	    UNION ALL
	    SELECT 70 SeqValue
	    UNION ALL
	    SELECT 80 SeqValue
	    UNION ALL
	    SELECT 90 SeqValue
	    ) TENS
	CROSS JOIN
	    (
	    SELECT 0 SeqValue
	    UNION ALL
	    SELECT 100 SeqValue
	    UNION ALL
	    SELECT 200 SeqValue
	    UNION ALL
	    SELECT 300 SeqValue
	    UNION ALL
	    SELECT 400 SeqValue
	    UNION ALL
	    SELECT 500 SeqValue
	    UNION ALL
	    SELECT 600 SeqValue
	    UNION ALL
	    SELECT 700 SeqValue
	    UNION ALL
	    SELECT 800 SeqValue
	    UNION ALL
	    SELECT 900 SeqValue
	    ) HUNDREDS
	) as ALL_NUMBERS
where 
	(SeqValue <= 3 AND SeqValue > 1) AND
	(SeqValue % 2 != 0 or SeqValue % 3 != 0)