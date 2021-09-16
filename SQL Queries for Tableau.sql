--Queries used for Tableau

--1.
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 AS DeathPercentage
FROM [Portfolio Project]..CovidDeaths
WHERE continent is not null 
ORDER BY 1,2

--2
SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM [Portfolio Project]..CovidDeaths
WHERE continent IS NULL 
and location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount desc

--3
SELECT location, population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM [Portfolio Project]..CovidDeaths
GROUP BY location, population
ORDER BY PercentPopulationInfected desc


--4
SELECT Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM [Portfolio Project]..CovidDeaths
GROUP BY location, population, date
ORDER BY PercentPopulationInfected desc
