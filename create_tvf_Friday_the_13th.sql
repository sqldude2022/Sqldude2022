-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: Generate a table of Friday the 
--              13ths between a range of dates
--              (inclusive).
-- =============================================
  CREATE FUNCTION [dbo].[tvf_Friday_the_13ths]
                 (@StartDate DateTime2 null
                , @EndDate   DateTime2 null)
  RETURNS TABLE 
  AS
  RETURN
  WITH dts
    AS (SELECT @StartDate AS dt
	         , CASE WHEN DAY(COALESCE(@StartDate, GETDATE())) = 13
			         AND DATENAME(WEEKDAY, COALESCE(@StartDate, GETDATE())) = 'Friday'
					     THEN 'Y' 
			        ELSE      'N' 
			   END AS FridayTheThirteenth
        UNION ALL
		SELECT DATEADD(day, +1, dt) AS dt
	         , CASE WHEN DAY(DATEADD(day, +1, dt)) = 13
			         AND DATENAME(WEEKDAY, DATEADD(day, +1, dt)) = 'Friday'
					     THEN 'Y' 
			        ELSE      'N' 
			   END AS FridayTheThirteenth
           FROM dts
		  WHERE dt < COALESCE(@EndDate, GETDATE()))
  SELECT dt
    FROM dts
   WHERE FridayTheThirteenth = 'Y'
-- ORDER BY 1 DESC
