-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/2/2023
-- Description: Return a random male first name
-- =============================================
  CREATE FUNCTION [dbo].[udf_random_male_first_name]
  (
  )
  RETURNS nvarchar(100)
  AS
  BEGIN
      -- Declare the return variable here
      DECLARE @ResultVar nvarchar(100)
  
      SELECT @ResultVar = name
        FROM dbo.vw_random_male_first_name
      OPTION (maxrecursion 0)
      
      RETURN @ResultVar
  END
