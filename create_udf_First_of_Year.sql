-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: For a given date, return the 
--              first day of the year.
-- =============================================
  CREATE FUNCTION [dbo].[udf_First_of_Year]
  (
      @dt date
  )
  RETURNS date
  AS
  BEGIN
  
  	RETURN cast(cast(year(@dt) AS char(4))
           + '-01-01' AS date) 
  END
