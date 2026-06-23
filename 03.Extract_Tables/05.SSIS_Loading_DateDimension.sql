USE [AdventureworksDWH2022]

DECLARE @CurrentDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2050-12-31';

WHILE @CurrentDate <= @EndDate
BEGIN
    INSERT INTO DimDate
    (
        DateKey,
		FullDate,
		DayNumberOfWeek,
		DayNameOfWeek,
		DayNumberOfMonth ,
		DayNumberOfYear,
		WeekNumberOfYear,
		MonthNumber,
		[MonthName],
		MonthShortName,
		QuarterNumber,
		QuarterName,
		[Year],
		IsWeekend
    )
    VALUES
    (
        CONVERT(INT, CONVERT(VARCHAR(8), @CurrentDate, 112)),
		@CurrentDate,
		DATEPART(WEEKDAY, @CurrentDate),
		DATENAME(WEEKDAY, @CurrentDate),
		DAY(@CurrentDate),
		DATEPART(DAYOFYEAR, @CurrentDate),
		DATEPART(WEEK, @CurrentDate),
		MONTH(@CurrentDate),
		DATENAME(MONTH, @CurrentDate),
		FORMAT(@CurrentDate, 'MMM'),
		DATEPART(QUARTER, @CurrentDate),
		'Q'+CONVERT(VARCHAR(1), DATEPART(QUARTER, @CurrentDate)),
		YEAR(@CurrentDate),
		CASE
			WHEN DATENAME(WEEKDAY, @CurrentDate) IN ('Saturday', 'Sunday') THEN 1
			ELSE 0
		END
    );

    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;