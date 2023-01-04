  CREATE TYPE StatsAggTableType 
     AS TABLE
        (nbr DECIMAL(10, 5));
  GO

-- =============================================
-- Author:		sqldude2022@yahoo.com
-- Create date: 01/04/2023
-- Description:	Calculate the median value
-- =============================================
  CREATE PROC dbo.sp_calc_median
      @pop StatsAggTableType READONLY
  AS
  BEGIN
      WITH nbr_obs
        AS (SELECT COUNT(*) AS obs
              FROM @pop)
      , seqs
      AS (SELECT obs
               , nbr
               , ROW_NUMBER() OVER (ORDER BY nbr) AS seq
            FROM @pop
               , nbr_obs)
      , median_result
      AS (SELECT CASE WHEN obs % 2 = 1 THEN (SELECT nbr FROM seqs WHERE seq = (obs + 1) / 2)
                      ELSE                 ((SELECT nbr FROM seqs WHERE seq = (obs + 0) / 2)
                                          + (SELECT nbr FROM seqs WHERE seq = (obs + 2) / 2)) / 2
                 END AS median
            FROM nbr_obs)
      SELECT median
        FROM median_result
  END
  GO
