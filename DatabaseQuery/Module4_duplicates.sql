use bi_marathon_bodyfat;

SELECT *
FROM bone;
----- checking duplicates--

SELECT age,bodyfat, weight, COUNT(bodyfat) as CNT
FROM body_fat_temp
GROUP BY age,bodyfat, weight
HAVING COUNT(bodyfat) >1;

select *
from body_fat_temp

--- adding  duplicates in temporary table--- 

INSERT INTO body_fat_temp (density
  , bodyfat
  , age
  , weight
  , height
  , neck
  , chest
  , abdomen
  , hip
  , thigh
  , knee
  , ankle
  , biceps	
  , forearm	
  , wrist)
  VALUES (1.0708, 12.3,	23,	154.25,	67.75,	36.2,	93.1,	85.2,
  94.5,	59,	37.3,	21.9,	32,	27.4, 17.1)

--- duplicated value added---

---checking duplicates in temporary table METHOD 1---
SELECT age,bodyfat, weight, COUNT(bodyfat) as CNT
FROM body_fat_temp
GROUP BY age,bodyfat, weight
HAVING COUNT(bodyfat) >1;

--- duplicate found --

---checking duplicates in temporary table METHOD 2 (Common Table Expressions)---
WITH CTE (age, 
          bodyfat, 
          weight, 
          duplicatecount)
AS (SELECT age, bodyfat, weight,
           ROW_NUMBER () OVER (PARTITION BY age, bodyfat, weight
    ORDER BY age ) as duplicatecount
    FROM body_fat_temp)
SELECT *
FROM CTE;

---checking duplicated row--
SELECT density 
FROM (SELECT density_id, density, row_number()
OVER (partition by density order by density) as row_num
from bone) as temp_bone 
WHERE  row_num >1

---1.0708 duplicated ---

--- duplicate found----

WITH CTE (age, 
          bodyfat, 
          weight, 
          duplicatecount)
AS (SELECT age, bodyfat, weight,
           ROW_NUMBER () OVER (PARTITION BY age, bodyfat, weight
    ORDER BY age ) as duplicatecount
    FROM body_fat_temp)
DELETE FROM CTE
WHERE duplicatecount >1

---- delete does not work in mysql---

-- using two methods of removing duplicates for mysql
 
 ---first method by DELETE JOIN statment ---

DELETE t1 FROM bone t1
INNER JOIN bone t2
WHERE t1.density_id>t2.density_id and t1.density = t2.density

--- second delete by Row_number statment---

DELETE FROM bone 
WHERE density IN (SELECT density 
FROM (SELECT density, row_number()
OVER (partition by density order by density) as row_num
FROM bone) as temp_bone 
WHERE row_num >1;


----case WHEN to create new column in body_fat_temp---

SELECT *, 
CASE 
    WHEN bodyfat BETWEEN 8 and 19 AND age BETWEEN 20 and 39 THEN "healthy" 
    WHEN bodyfat BETWEEN 11 and 21 AND age BETWEEN 40 and 59 THEN "healthy"
    WHEN bodyfat BETWEEN 13 and 24 AND age BETWEEN 60 and 79 THEN "healthy"
    ELSE "non-healthy"
    END AS bodyfat_range
FROM body_fat_temp

----COALESCE---

SELECT age, bodyfat, density, COALESCE (age, "no age") as age
FROM body_fat_temp

---- NULLIF ----
SELECT age, bodyfat, density, NULLIF (age, "no age") as age
FROM body_fat_temp

-----DISTINCT----

SELECT DISTINCT age
FROM body_fat_temp



    
    
    

