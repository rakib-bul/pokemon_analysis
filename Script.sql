-- Data Cleaning

select distinct type1 from pokemon ;

-- Counting number of pokemon according to types
select type1, count(type1)  as count from pokemon group by type1 order by  count desc;

select type1, count(type1) from pokemon where type1 = 'Ice Steel' group by type1; 


--------------------------------------------------------------
-- Setting null values for type2 column
update pokemon set type2 = null where type2 = '';

-- Adding Pokemon type in the type2 column(updated)
update  pokemon set type2 = 'Bug' where type1 like  '% Bug';


-- Adding Pokemon type in the type1 column(updated)

update  pokemon  set type1 = 'Fighting' where type1 like 'Fighting %';


--------------------------------------------------------------
-- Updating Region in Pokemon Table

update pokemon set region_id = 8 where poke_id between 1071 and 1080;

-- Updating Game in Pokemon Table
update pokemon set game_id = 18 where poke_id between 1071 and 1080;



update pokemon set game_id = 13 ,region_id  = 6 where name = 'Scizor Mega Scizor';




-- Search ID of a pokemon
select poke_id, name, legendary from pokemon where poke_id = 595;

select poke_id, name, type1, type2 from pokemon where name like 'Palkia%';

--Define legendaries

update pokemon set legendary = true where name = 'Terrakion';

update pokemon set region_id = 3 where game_id = 14;

select * from pokemon where legendary = true;


-- SQL Operations

--Grouping

select poke_id, name, type1 from pokemon group by poke_id, name, type1 order by type1  asc;

select * from pokemon where type1 = 'Normal' order by poke_id asc;


---Concat
select poke_id, name, concat(type1, ' and ', type2) as type from pokemon; 


SELECT poke_id, name, CONCAT_WS(' and ', type1, type2)AS combined_types, hp+attack+defense+sp_attack+sp_def+speed  
AS total FROM pokemon where legendary = false order by total asc;






select * from pokemon where legendary = true;

update pokemon set mega_evolve = false where name ilike '% ';



-- Simple join Operation
select pokemon.poke_id, pokemon.name, region.region_name from pokemon join region on region_id = region.id group by poke_id, name, region_name  order by region_name asc;

select poke_id , name, SUM(hp + attack + defense + sp_attack + sp_def + speed) as CP, 
region_name, game_name from pokemon left join region on region_id = region.id  join game on game_id = game.id group by poke_id, region_name, game_name  order by CP asc;

-----------------------------------------------
select region_name, count(region_name)  from pokemon left join region on region_id = region.id group by region_name; 
--Sub Query
SELECT
    p.poke_id,
    p.name,
    subquery.type as type,
    r.region_name as Region_name
FROM
    pokemon p
JOIN
    region r ON p.region_id = r.id
JOIN
    (
        SELECT DISTINCT poke_id, CONCAT_WS(' and ', type1, type2) as type
        FROM pokemon
    ) as subquery
    ON p.poke_id = subquery.poke_id
ORDER BY subquery.type ASC;



select name, SUM(hp + attack + defense + sp_attack + sp_def + speed) as CP, type1 from pokemon where mega_evolve = false and legendary = true group by name, type1 order by CP desc limit 5;


