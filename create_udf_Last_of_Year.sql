-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: For a given date, return the 
--              last day of the year.
-- =============================================
  CREATE FUNCTION [dbo].[udf_Last_of_Year]
  (
      @dt date
  )
  RETURNS date
  AS
  BEGIN
      RETURN DATEADD(day, -1, DATEADD(year, +1, dbo.udf_First_of_Year(@dt)))
  END

