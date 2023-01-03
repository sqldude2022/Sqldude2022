-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: Calculate PI with very fast 
--              convergence.
-- =============================================
  CREATE FUNCTION [dbo].[calc_pi]()
  RETURNS FLOAT
  AS
  BEGIN
      DECLARE @pi float
    
      SET @pi = 3.14
    
      ;
      WITH pi_calc
        AS (SELECT @pi AS my_pi
                 , 1   AS iter
            UNION ALL
            SELECT my_pi + SIN(my_pi) AS my_pi
                 , iter + 1 AS iter
              FROM pi_calc
             WHERE iter < 10)
      SELECT @pi = my_pi
        FROM pi_calc
       WHERE iter = 10

      RETURN @pi
  END

