-- COUNT THE NUMBER OF ATHLETES FROM EACH COUNTRY:
SELECT Country, COUNT(*) AS TotalAthletes
FROM athletes
GROUP BY Country
ORDER BY TotalAthletes DESC;

-- CALCULATE THE TOTAL MEDALS WON BY EACH COUNTRY:
SELECT TeamCountry,
SUM(Gold) TotalGold,
SUM(Silver) TotalSilver,
SUM(Bronze) TotalBronze
FROM medals
GROUP BY TeamCountry
ORDER BY TotalGold DESC;

-- CALCULATE THE AVERAGE NUMBER OF ENTRIES BY EACH DISCIPLINE:
SELECT Discipline,
AVG(Female) Avg_Female,
AVG(Male) Avg_Male
FROM entriesgender
GROUP BY Discipline;

