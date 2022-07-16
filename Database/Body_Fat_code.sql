--creating a database ---
create database bi_marathon_BodyFat;
--- drop database bi_marathon_BodyFat---

use bi_marathon_BodyFat;

-- creating a temp table to load cvs file --

create table body_fat_temp
( 
  density	float(5)
  , bodyfat	float(2)
  , age	    int
  , weight	float(2)
  , height	float(2)
  , neck	float(2)
  , chest	float(2)
  , abdomen	float(2)
  , hip	    float(2)
  , thigh	float(2)
  , knee	float(2)
  , ankle	float(2)
  , biceps  float(2)	
  , forearm	float(2)
  , wrist   float(2)
);


-- creating 6 tables :  physical_stats, bone, trunk, lower_limb,  upper_limb,  bodyfat ---

create table physical_stats
(
   physical_stats_id int not null auto_increment
 , age int
 , weight float(5)
 , height float (5)
 , primary key (physical_stats_id)
 );
 
 create table bone
 (
   density_id int not null auto_increment
 , density float(5)
 , primary key (density_id)
 
 );
 
 create table trunk
 (
  trunk_id int not null auto_increment
 , neck float(5)
 , chest float(5)
 , abdomen float(5)
 , primary key (trunk_id)
 );

 create table lower_limb
 (
   lower_limb_id int not null auto_increment
  , hip	float(2)
  , thigh float(2)
  , knee float(2)
  , ankle float(2)
  , primary key (lower_limb_id)
  
  );
  
 create table  upper_limb
 (
    upper_limb_id int not null auto_increment
  , biceps float(2)	
  , forearm	float(2)
  , wrist float(2)
  , primary key (upper_limb_id)
 );

 create table bodyfat
 (
  bodyfat_id int not null auto_increment
  , bodyfat float(2)
  , physical_stats_id int
  , trunk_id int
  , density_id int
  , lower_limb_id int
  , upper_limb_id int
  , primary key (bodyfat_id)
  , foreign key (physical_stats_id) references physical_stats(physical_stats_id) on delete set null
  , foreign key (trunk_id) references trunk (trunk_id) on delete set null
  , foreign key (density_id) references bone (density_id) on delete set null
  , foreign key (lower_limb_id) references lower_limb (lower_limb_id) on delete set null
  , foreign key (upper_limb_id) references upper_limb (upper_limb_id) on delete set null
  
 
 )
 ;
  
----- uploading data to each table from body_fat_temp --- 


INSERT IGNORE INTO physical_stats (age, weight, height)
SELECT DISTINCT age, weight, height
FROM body_fat_temp
  
;
---checking uploadet data--
select *
from physical_stats
;


INSERT IGNORE INTO trunk (neck, chest, abdomen)
SELECT DISTINCT neck, chest, abdomen
FROM body_fat_temp
;
---checking uploadet data--
select *
from trunk;


INSERT IGNORE INTO upper_limb (biceps, forearm, wrist)
SELECT DISTINCT biceps, forearm, wrist
FROM body_fat_temp
;
---checking uploadet data--
select *
from upper_limb;

INSERT IGNORE INTO lower_limb (hip, thigh, knee, ankle)
SELECT DISTINCT hip, thigh, knee, ankle
FROM body_fat_temp
;
---checking uploadet data--
select*
from lower_limb
;


INSERT IGNORE INTO bone (density)
SELECT DISTINCT density 
FROM body_fat_temp;

---checking uploadet data--
select *
from bone

INSERT IGNORE INTO bodyfat (bodyfat, physical_stats_id
  , trunk_id
  , density_id
  , lower_limb_id 
  , upper_limb_id )
SELECT DISTINCT b.bodyfat, p.physical_stats_id
  , t.trunk_id
  , bo.density_id
  , l.lower_limb_id 
  , u.upper_limb_id 
FROM body_fat_temp AS b
JOIN physical_stats as p ON p.age = b.age
JOIN bone bo ON  bo.density = b.density
JOIN lower_limb l ON l.hip = b.hip
JOIN upper_limb u ON u.wrist = b.wrist
JOIN trunk t ON t.neck = b.neck

;
---checking uploadet data--
select *
from bodyfat



  
  