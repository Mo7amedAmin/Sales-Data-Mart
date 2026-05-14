-- Create stg database
IF DB_ID('AdventureWorksSTG2022') IS NULL
BEGIN 
	CREATE DATABASE AdventureWorksSTG2022;
END