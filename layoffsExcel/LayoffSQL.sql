

-- checking if we imported correct data

SELECT * FROM
layoffanalysis.dbo.layoffs_data$


--<< total number of employees laid off all over the world >>

SELECT sum(Laid_off_count) as world_count FROM
layoffanalysis.dbo.layoffs_data$
--There are total 429935 employees laid off all over the world




-- << Total number of companies that laid off their employees >>

SELECT count(Company) total_companies, sum(Laid_Off_Count) TotalEmployees
FROM layoffanalysis.dbo.layoffs_data$
--There are total 2468 companies laid off their employees


-- << total employees laid off in INDIA >>
SELECT Country,sum(Laid_Off_Count) LayoffIndia
FROM layoffanalysis.dbo.layoffs_data$
WHERE Country like '%india%'
GROUP BY Country
-- India Faced total lay off of 37464 employees


-- total laid offs in United States
SELECT Country,sum(Laid_Off_Count) LayoffUS
FROM layoffanalysis.dbo.layoffs_data$
WHERE Country like '%states%'
GROUP BY Country
-- United staes Faced total lay off of 295514 employees

-- total laid offs in FRANCE
SELECT Country,sum(Laid_Off_Count) LayoffFrance
FROM layoffanalysis.dbo.layoffs_data$
WHERE Country like '%FRANCE%'
GROUP BY Country
-- France Faced total lay off of 925 employees




-- Employees laid off in India industry wise
SELECT Country,	Industry, SUM(Laid_Off_Count) IndustryLayoffIndia
FROM layoffanalysis.dbo.layoffs_data$
where Country= 'India'
group by Industry, Country
Order by 3 DESC
-- Education industry in India had most layoffs

-- <<VIEW>>
CREATE VIEW IndustryLayoffIndia as 
SELECT Country,	Industry, SUM(Laid_Off_Count) IndustryLayoffIndia
FROM layoffanalysis.dbo.layoffs_data$
where Country= 'India'
group by Industry, Country



-- Employees laid off in US industry wise
SELECT Country,	Industry, SUM(Laid_Off_Count) IndustryLayoffUS
FROM layoffanalysis.dbo.layoffs_data$
where Country LIKE '%States%'
group by Industry, Country
Order by 3 DESC
-- Consumer industry in US had most layoffs, followed by retail and Hardware
 --<< VIEW >>
CREATE VIEW IndustryLayoffUS as
SELECT Country,	Industry, SUM(Laid_Off_Count) IndustryLayoffUS
FROM layoffanalysis.dbo.layoffs_data$
where Country LIKE '%States%'
group by Industry, Country


-- Employees laid off in canada industry wise
SELECT Country,	Industry, SUM(Laid_Off_Count) IndustryLayoffCanada
FROM layoffanalysis.dbo.layoffs_data$
where Country LIKE '%CANADA%'
group by Industry, Country
Order by 3 DESC
-- Retail industry in CANADA had most layoffs, followed by food and Finance


-- Laid offs by country
SELECT  Country, sum(Laid_Off_Count) countrywise_lay_off
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Country
ORDER BY 2 DESC
-- United States is most affected by layoff with total 295514  employees loosing their jobs
--<< view >>
CREATE VIEW countrywise_lay_off as
SELECT  Country, sum(Laid_Off_Count) countrywise_lay_off
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Country


-- Company with most layoff count

SELECT Company, Max(Laid_Off_Count) as HighestLayOff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Company
ORDER BY 2 DESC
-- Google has the highest layoff count i.e, 12000 employees
-- Top 5 companies with high layoff are Google, Meta, Microsoft, Amazon, Erricson


-- Year wise layoff's

SELECT year, SUM(Laid_off_count) YearWiseCount
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY year
Order by 1
-- In 2020 - 80998 were laid off, In 2021 total 15823 employees were laid off, 2022 - 164411 employees are laid off
-- In 2023, till april, 168203 employees are laid off which is maximum
-- << view >>
create view YearWiseCount as 
SELECT year, SUM(Laid_off_count) YearWiseCount
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY year

-- Industry wise layoff
SELECT Industry, SUM(Laid_Off_Count) IndustryLayOff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Industry
ORDER BY 2 DESC
-- Consumer Industry is most affected by layoff with total 56142 employees loosing their jobs, followed by Retail and other sectors
-- << view >>
create view IndustrywiseLayOff as
SELECT Industry, SUM(Laid_Off_Count) IndustryLayOff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Industry




-- Least affected Industry in layoffs
SELECT Industry, SUM(Laid_Off_Count) IndustryLayOff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Industry
ORDER BY 2 
-- Manufacturing, Aerospac and Energy are the least affected by the layoffs


-- stage of layoff
SELECT Stage, SUM(Laid_Off_Count) StageLayOff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Stage
ORDER BY 2 DESC
-- 239640 Employees were laid off during companies post IPO stage




-- Company with highest percent employees laid off
SELECT Company, MAX(Percentage) percentLayoff
FROM layoffanalysis.dbo.layoffs_data$
GROUP BY Company
ORDER BY 2 DESC
-- Ahead, airlift, Airy rooms and many other companies laid off almost 1% of their workforce



-- Company with highest funds raised
SELECT Country,	Company,Industry, MAX(Funds_Raised) MaxFunds
FROM layoffanalysis.dbo.layoffs_data$
group by Industry, Country, Company
Order by 4 DESC
-- Netflix which is in UNITED STATES raised  most funds  i.e, 121900


-- funds raised by countries
SELECT Country,	 SUM(Funds_Raised) MaxFunds
FROM layoffanalysis.dbo.layoffs_data$
group by Country
Order by 2 DESC
-- United states raised the most funds followed by India


-- which sector in india raised the mist funds
SELECT Country,	Industry, SUM(Funds_Raised) MaxFunds
FROM layoffanalysis.dbo.layoffs_data$
where Country like 'india'
group by Country, Industry
Order by 3 DESC
-- Transporattion sector raised most funds in india followed by retail sector


