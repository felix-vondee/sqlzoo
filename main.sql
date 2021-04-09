-------------------------- SELECT FROM WORLD ----------------------------

-- select population of germany
SELECT population FROM world
  WHERE name = 'Germany'

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- country and the area for countries with an area between 200,000 and 250,000
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Show the name for the countries that have a population of at least 200 million
SELECT name
  FROM world
  WHERE NOT population < 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
  FROM world
  WHERE NOT population < 200000000

-- Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population / 1000000
  FROM world
  WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy
SELECT name, population
  FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name
  FROM world
  WHERE name LIKE '%United%'

-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
  FROM world
  WHERE area > 3000000
  OR population > 250000000

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.
SELECT name, population, area
  FROM world
  WHERE area > 3000000 AND NOT population > 250000000
  OR population > 250000000 AND NOT area > 3000000

  -- For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2)
  FROM world
  WHERE continent = 'South America'

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, -3)
  FROM world
  WHERE NOT gdp < 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
  WHERE LENGTH(name) = LENGTH(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
  FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1)
  AND NOT name = capital

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
  FROM world
  WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND NOT name LIKE '% %'

-------------------------- END SELECT FROM WORLD -----------------------------

-------------------------- SELECT FROM NOBEL ----------------------------

-- displays Nobel prizes for 1950
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950

-- Show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature'

-- Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein'

-- Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
  FROM nobel
  WHERE subject = 'Peace'
  AND NOT yr < 2000

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Literature'
  AND yr BETWEEN 1980 AND 1989

-- Show all details of the presidential winners
SELECT * FROM nobel
  WHERE winner IN (
    'Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama'
  )

-- Show the winners with first name John
SELECT winner
  FROM nobelA
  WHERE winner LIKE 'John%'

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984
SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Physics' AND yr = 1980
  OR subject = 'Chemistry' AND yr = 1984

-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980
  AND NOT subject IN ('Chemistry', 'Medicine')

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Medicine' AND yr < 1910
  OR subject = 'Literature' AND NOT yr < 2004

-- Find all details of the prize won by PETER GRÜNBERG
SELECT *
  FROM nobel
  WHERE winner = 'PETER GRÜNBERG'

-- Find all details of the prize won by EUGENE O'NEILL
SELECT *
  FROM nobel
  WHERE winner = 'EUGENE O''NEILL'

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner

-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner

----------------------- END SELECT FROM NOBEL -----------------------------------