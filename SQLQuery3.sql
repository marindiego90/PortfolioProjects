SELECT * FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3, 4

SELECT * FROM CovidVaccinations
ORDER BY 3, 4

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths ORDER BY 1, 2

SELECT Location, date, total_cases, total_deaths, (Total_deaths/total_cases
)*100 as DeathPercentage
FROM CovidDeaths
WHERE Location LIKE '%spain%'
ORDER BY 1, 2

SELECT Location, date, Population, total_cases, (total_cases/population
)*100 AS DeathPercentage
FROM CovidDeaths
--WHERE Location LIKE '%spain%'
ORDER BY 1, 2

-- Looking at countries with highest infection rates
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population
))*100 as PercentPopulationInfected
FROM CovidDeaths
--WHERE Location LIKE '%spain%'
GROUP BY Location, population
ORDER BY PercentPopulationInfected DESC

-- Showing continents with the highest death count per population
SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

-- Global numbers
SELECT date, SUM(new_cases) AS Total_Cases, SUM(CAST(new_deaths AS INT)) AS Total_Deaths, 
SUM(CAST(New_deaths AS INT))/SUM(New_Cases)*100 AS Death_Percentage
FROM CovidDeaths
--WHERE Location LIKE '%spain%'
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1, 2

SELECT cd.continent, cd.location, cd.date, cd.population
FROM CovidDeaths cd JOIN CovidVaccinations cv ON cd.location = cv.location
WHERE cd.continent IS NOT NULL
ORDER BY 2, 3

