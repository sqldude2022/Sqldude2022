-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: For a given date, return the 
--              last day of the month.
-- =============================================
  CREATE FUNCTION [dbo].[udf_Last_of_Month]
  (
      @dt date
  )
  RETURNS date
  AS
  BEGIN
      RETURN DATEADD(day, -1, DATEADD(month, +1, dbo.udf_First_of_Month(@dt)))
  END
