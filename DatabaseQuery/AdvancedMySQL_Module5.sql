use bi_marathon_bodyfat;

--- 1. --- common table expression---
--- how many persons between 20 and 39 years old who quilify as a healthy ( 8-19 bodyfat range) have a bodyfat more than the average index of bodyfat in that group -----
WITH CTE_1 as (
     SELECT distinct age
     FROM  physical_stats
     WHERE age between 20 and 39 
     )
, CTE_2 as (
     SELECT avg(bodyfat) as avgbodyfat
     FROM body_fat_temp
     WHERE bodyfat between 8 and 19	
)
 SELECT age, bodyfat
 FROM body_fat_temp
 WHERE age in (SELECT distinct age from CTE_1)
     AND bodyfat > ( SELECT avgbodyfat FROM CTE_2)  AND bodyfat < 19;
      
-- 14 rows returned--- ( 14 person)

--- 2.-- Recursive CTEs ---    ;

WITH cte_org as (
 SELECT bodyfat, 
        density_id,
        trunk_id
 FROM bodyfat
 WHERE density_id is null
UNION ALL 
SELECT b.bodyfat,
       b.density_id,
       trunk_id
FROM  bodyfat as b
inner join cte_org as c
on c.density_id =b.density_id 
)
Select * from cte_org;

---question???----

---3.--- pivoting data with case when ---
SELECT *, 
CASE 
    WHEN bodyfat BETWEEN 8 and 19 AND age BETWEEN 20 and 39 THEN "healthy" 
    WHEN bodyfat BETWEEN 11 and 21 AND age BETWEEN 40 and 59 THEN "healthy"
    WHEN bodyfat BETWEEN 13 and 24 AND age BETWEEN 60 and 79 THEN "healthy"
    ELSE "non-healthy"
    END AS bodyfat_range
FROM body_fat_temp


--- 4. Self Joins ---

select l.ankle, b.bodyfat, p.age, p.weight
from lower_limb as l
join bodyfat as b
on l.lower_limb_id = b.lower_limb_id
join upper_limb as u
on u.upper_limb_id = b.upper_limb_id
join physical_stats as p
on p.physical_stats_id = b.physical_stats_id
WHERE l.ankle > u.forearm;

--- 5.----Window function ----

SELECT weight, avg(weight) OVER (ORDER BY weight) as avg_bodyweight
FROM body_fat_temp

-- 6. calculating running totals

SELECT bodyfat, weight, SUM(weight) OVER (ORDER BY bodyfat) as Cumulative
FROM body_fat_temp

--- 7. calculating delta values ---
SELECT bodyfat, chest, abdomen, bodyfat - LAG (bodyfat) OVER (ORDER BY weight)
FROM body_fat_temp

---- 8. Except Vs NOT in
USE bi_marathon_bodyfat
SELECT neck, chest from trunk
EXCEPT
SELECT neck, chest from body_fat_temp


--- ADDING NEW CALCULATED COLUMN IN body_fat_temp ---
USE bi_marathon_bodyfat
ALTER TABLE body_fat_temp
ADD COLUMN 'BMI' int GENERATED ALWAYS AS((weight*703)/(height*height)) STORED AFTER 'bodyfat';






