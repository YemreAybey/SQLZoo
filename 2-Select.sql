/* 1-Just to observe the table */
SELECT name, continent, population FROM world;

/* 2-Show the name for the countries that have a population of 
   at least 200 million */
SELECT name FROM world
  WHERE population >= 200000000;

/* 3-Give the name and the per capita GDP for those countries 
   with a population of at least 200 million. */
SELECT name, GDP/population from world 
  WHERE population >= 200000000;

/* 4-Show the name and population in millions 
   for the countries of the continent 'South America'. */
SELECT name, population/1000000 from world
  WHERE continent like 'South America';

/* 5-Show the name and population for France, Germany, Italy */
SELECT name, population from world 
  WHERE name in ('France', 'Germany', 'Italy');

/* 6-Show the countries which have a name that 
   includes the word 'United' */
SELECT name from world WHERE name like '%United%';

/* 7-Show the countries 
   that are big by area or big by population. */
SELECT name, population, area from world 
  WHERE population > 250000000 OR area > 3000000;

/* 8-Show the countries that are big by area or 
   big by population but not both */
SELECT name, population, area from world 
  WHERE (population > 250000000 and area < 3000000) 
  OR (population < 250000000 and area > 3000000);

/* 9-For South America show population in millions and 
   GDP in billions both to 2 decimal places. */
SELECT name, 
  ROUND(population/1000000, 2) as "Population(Millions)", 
  ROUND(GDP/1000000000, 2) as "GDP(Billions)" 
  from world WHERE continent LIKE 'South America';

/* 10-show per-capita GDP for the trillion dollar 
   countries to the nearest $1000. */
SELECT name, ROUND(GDP/Population, -3) as "per-capita GDP" 
  FROM world WHERE GDP >= 1000000000000;

/* 11-Show the name and capital where 
   the name and the capital have 
   the same number of characters. */
SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital);

/* 12-Show the name and the capital where the first letters of 
   each match. Don't include countries 
   where the name and the capital are the same word. */
SELECT name, capital FROM world 
  WHERE LEFT(name,1) = LEFT(capital, 1) AND name <> capital;

/* 13-Find the country that has all the vowels 
   and no spaces in its name. */
SELECT name FROM world
  WHERE name LIKE '%a%' AND name LIKE '%e%' 
  AND name LIKE '%o%' AND name LIKE '%u%' 
  AND name LIKE '%i%' AND name NOT LIKE '% %';