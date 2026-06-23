USE AdventureworksDWH2022
GO



-- Drop Date dimension if exists
IF OBJECT_ID('DimDate', 'U') IS NOT NULL
BEGIN
	DROP TABLE DimDate;
END
GO

CREATE TABLE DimDate
(
    DateKey INT NOT NULL PRIMARY KEY,
    FullDate DATE NOT NULL,
	DayNumberOfWeek TINYINT NOT NULL,
	DayNameOfWeek VARCHAR(10) NOT NULL,
    DayNumberOfMonth TINYINT NOT NULL,
	DayNumberOfYear SMALLINT NOT NULL,
	WeekNumberOfYear TINYINT NOT NULL,
    MonthNumber TINYINT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
	MonthShortName VARCHAR(3) NOT NULL,
    QuarterNumber TINYINT NOT NULL,
	QuarterName VARCHAR(2) NOT NULL,
    Year SMALLINT NOT NULL,
    IsWeekend BIT NOT NULL,
);
	