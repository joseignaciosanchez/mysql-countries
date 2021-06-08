/*1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente.*/
use world;
select name, language, percentage 
from languages
join countries on languages.country_Code = countries.code
where Language = "Slovene"
order by percentage desc;

/*2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente.*/
use world;
select countries.name as name, count(cities.name) as cities
from cities
join countries on cities.country_Code = countries.code
group by cities.country_Code
order by cities desc;

/*3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? Tu consulta debe organizar el resultado por población en orden descendente.*/
use world;
select cities.name as name, cities.population as population, countries.id as country_id
from cities
join countries on cities.country_id = countries.id
where cities.country_id = 136 && cities.population > 500000
order by population desc;

/*4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? Tu consulta debe organizar el resultado por porcentaje en orden descendente.*/
use world;
select countries.name as name, languages.language as language, 
languages.percentage as percentage
from languages
join countries on languages.country_id = countries.id
where languages.percentage > 89
order by percentage desc;

/*5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?*/
use world;
select countries.name as name, countries.surface_area as surface_area, 
countries.population as population
from countries
where countries.surface_area < 501 && countries.population > 100000
order by name asc;

/*6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años?*/
use world;
select countries.name as name, countries.government_form as government_form, 
countries.capital as capital, countries.life_expectancy as life_expectancy
from countries
where countries.government_form = "Constitutional Monarchy" && 
countries.Capital > 200 && countries.life_expectancy > 75;

/*7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.*/
use world;
select countries.name as country_name, cities.name as cities, cities.district as district, cities.Population as population
from cities
join countries on cities.country_code = countries.code
where cities.district = "Buenos Aires" && cities.population > 500000;

/*8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. */
use world;
select countries.region as region, count(countries.name) as countries
from countries
group by countries.region
order by countries desc;
