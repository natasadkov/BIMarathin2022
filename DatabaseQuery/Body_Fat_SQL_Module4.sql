use bi_marathon_bodyfat;

SELECT *
FROM bone;
----- checking duplicates--
SELECT density_id, COUNT(density_id) AS CNT
FROM bone
GROUP BY density_id
Having COUNT(density_id) > 1;

--- ANSWER - zero duplicates --
-- adding duplicates -- 
INSERT INTO bone (density_id, density)
VALUES (1, 1.0708)

--- duplicate entry error -- 

SELECT bodyfat_id, COUNT(bodyfat_id) AS CNT
FROM bodyfat
GROUP BY bodyfat_id
Having COUNT(bodyfat_id) > 1;

---checking duplicates in temporary table---
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

---- delete does not wotk in mysql---


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



    
    
    

