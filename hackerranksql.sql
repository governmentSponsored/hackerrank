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
