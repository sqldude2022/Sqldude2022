-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: For a given date, return the 
--              first day of the month.
-- =============================================
  CREATE FUNCTION [dbo].[udf_First_of_Month]
  (
      @dt date
  )
  RETURNS date
  AS
  BEGIN
  
      RETURN DATEADD(month, month(@dt) - 1, dbo.udf_First_of_Year(@dt))
  END
