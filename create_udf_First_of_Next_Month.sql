-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: For a given date, return the 
--              first day of the next month.
-- =============================================
  CREATE FUNCTION [dbo].[udf_First_of_Next_Month]
  (
      @dt date
  )
  RETURNS date
  AS
  BEGIN
      RETURN DATEADD(month, +1, dbo.udf_First_of_Month(@dt))
  END
  
