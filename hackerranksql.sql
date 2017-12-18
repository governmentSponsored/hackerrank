//https://www.hackerrank.com/challenges/weather-observation-station-4/problem
select (SELECT COUNT(*) from station) - (select count(*) from (SELECT DISTINCT CITY FROM STATION) as count)

//https://www.hackerrank.com/challenges/weather-observation-station-5/problem
SELECT CITY, CHAR_LENGTH(CITY) as the_length
FROM STATION 
ORDER BY the_length, city
LIMIT 1;
SELECT CITY, CHAR_LENGTH(CITY) as the_length
FROM STATION 
ORDER BY the_length desc
LIMIT 1;

//https://www.hackerrank.com/challenges/weather-observation-station-11/problem
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
    CITY NOT LIKE 'U%')

//https://www.hackerrank.com/challenges/more-than-75-marks/problem
select name from students where marks > 75
order by substring(name,-3,CHAR_LENGTH(name)), ID

//https://www.hackerrank.com/challenges/what-type-of-triangle/problem
SELECT
    (CASE
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN (A = B OR B = C OR A = C) AND (A + B > C AND B + C > A) THEN 'Isosceles'
        WHEN (A != B AND B != C AND A != C) AND (A + B > C AND B + C > A) THEN 'Scalene'
        ELSE 'Not A Triangle'
    END) as Name
from triangles

//https://www.hackerrank.com/challenges/the-pads/problem
select CONCAT(Name,'(',SUBSTRING(Occupation,1,1),')')
from OCCUPATIONS
order by Name;
select CONCAT('There are a total of ', count(*), ' ', LOWER(Occupation), 's.')
from OCCUPATIONS
group by Occupation
order by count(*), Occupation;

//https://www.hackerrank.com/challenges/occupations/problem
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber