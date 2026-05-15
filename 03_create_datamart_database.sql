-- Create data mart (database)
IF DB_ID('AdventureworksDWH2022') IS NULL
BEGIN
	CREATE DATABASE AdventureworksDWH2022;
END