  SET ANSI_NULLS ON
  GO
  SET QUOTED_IDENTIFIER ON
  GO
-- ===============================================================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/1/2023
-- Description:	This stored procedure create/recreates a date dimension table
-- Parmameters:   @start_date DATE          (start of date range)
--                @end_date   DATE          (end of date range)
--                @schema     NVARCHAR(100) (schema of date dimension table)
--                @table      NVARCHAR(100) (table name of date dimension table)
-- ===============================================================================
  ALTER PROC dbo.sp_Create_Date_Dim_Table   
    @start_date DATE          -- example '1900-01-01'
  , @end_date   DATE          -- example '2099-12-31'
  , @schema     NVARCHAR(100) -- example 'dbo'
  , @table      NVARCHAR(100) -- example 'dim_Date'
  AS

  DROP TABLE IF EXISTS #tmp_dim_Date

  ;
  WITH dts
    AS (SELECT @start_date          AS dt
        UNION ALL
        SELECT DATEADD(day, +1, dt) AS dt
          FROM dts
         WHERE dt < @end_date)
     , pass1
    AS (SELECT dt
             , DATEPART(year , dt) AS yr_nbr
             , DATEPART(month, dt) AS month_nbr
             , DATEPART(day  , dt) AS day_of_month
          FROM dts)
     , pass2
    AS (SELECT dt
             , yr_nbr
             , month_nbr
             , day_of_month
             , CAST(CAST(yr_nbr AS CHAR(4))
             + '-'
             + SUBSTRING(CAST(100 + month_nbr AS CHAR(3)), 2, 2) 
             + '-01' AS date) AS mth_start_date
          FROM pass1)
     , pass3
    AS (SELECT dt
             , yr_nbr
             , month_nbr
             , day_of_month
             , mth_start_date
             , DATEADD(day, -1, DATEADD(month, +1, mth_start_date)) AS mth_end_date
          FROM pass2)
     , pass4
    AS (SELECT dt
             , DATEPART(weekday, dt) AS day_of_week_nbr
             , DATENAME(weekday, dt) AS day_of_week
             , yr_nbr
             , month_nbr
             , day_of_month
             , mth_start_date
             , mth_end_date
          FROM pass3)
     , pass5
    AS (SELECT dt
             , day_of_week_nbr
             , day_of_week
             , CASE WHEN day_of_week_nbr = 1 THEN DATEADD(day, -0, dt) 
                    WHEN day_of_week_nbr = 2 THEN DATEADD(day, -1, dt) 
                    WHEN day_of_week_nbr = 3 THEN DATEADD(day, -2, dt) 
                    WHEN day_of_week_nbr = 4 THEN DATEADD(day, -3, dt) 
                    WHEN day_of_week_nbr = 5 THEN DATEADD(day, -4, dt) 
                    WHEN day_of_week_nbr = 6 THEN DATEADD(day, -5, dt) 
                    WHEN day_of_week_nbr = 7 THEN DATEADD(day, -6, dt) 
               END AS week_start_date
             , CASE WHEN day_of_week_nbr = 1 THEN DATEADD(day, +6, dt) 
                    WHEN day_of_week_nbr = 2 THEN DATEADD(day, +5, dt) 
                    WHEN day_of_week_nbr = 3 THEN DATEADD(day, +4, dt) 
                    WHEN day_of_week_nbr = 4 THEN DATEADD(day, +3, dt) 
                    WHEN day_of_week_nbr = 5 THEN DATEADD(day, +2, dt) 
                    WHEN day_of_week_nbr = 6 THEN DATEADD(day, +1, dt) 
                    WHEN day_of_week_nbr = 7 THEN DATEADD(day, +0, dt) 
               END AS week_end_date
             , yr_nbr
             , month_nbr
             , day_of_month
             , mth_start_date
             , mth_end_date
          FROM pass4)
     , pass6
    AS (SELECT dt
             , DATEDIFF(day, CAST(CAST(yr_nbr AS CHAR(4))
                      + '-01-01' AS DATE), dt) + 1 AS day_of_year               
             , day_of_week_nbr
             , day_of_week
             , week_start_date
             , week_end_date
             , yr_nbr
             , month_nbr
             , day_of_month
             , mth_start_date
             , mth_end_date
          FROM pass5)
     , max_days_in_year
     AS (SELECT p.yr_nbr
              , max(day_of_year) days_in_year
           FROM pass6 p
          GROUP BY p.yr_nbr)
     , pass7
    AS (SELECT dt
             , CASE WHEN m.days_in_year = 366 THEN 1 ELSE 0 END AS is_leap_year
             , day_of_year               
             , day_of_week_nbr
             , day_of_week
             , week_start_date
             , week_end_date
             , p.yr_nbr
             , month_nbr
             , day_of_month
             ,                  DATEADD(month, -1, mth_start_date)  AS prev_mth_start_date
             ,                  DATEADD(day  , -1, mth_start_date)  AS prev_mth_end_date
             , mth_start_date                                       
             , mth_end_date                                         
             ,                  DATEADD(month, +1, mth_start_date)  AS next_mth_start_date
             , DATEADD(day, -1, DATEADD(month, +2, mth_start_date)) AS next_mth_end_date
          FROM pass6 p
             , max_days_in_year m
         WHERE p.yr_nbr = m.yr_nbr)
     , pass8
    AS (SELECT dt
             , is_leap_year
             , yr_nbr
             , month_nbr
             , day_of_month
             , day_of_year               
             , day_of_week_nbr
             , day_of_week
             , CASE WHEN day_of_week_nbr IN (1, 7) THEN 1 ELSE 0 END AS is_weekend
             , CASE WHEN day_of_week_nbr IN (1, 7) THEN 0 ELSE 1 END AS is_weekday
             , week_start_date
             , week_end_date
             , DATEPART(quarter, dt                 ) AS quarter_nbr
             , prev_mth_start_date
             , DATEPART(year   , prev_mth_start_date) AS prev_mth_start_yr_nbr
             , DATEPART(month  , prev_mth_start_date) AS prev_mth_start_mth_nbr
             , DATEPART(day    , prev_mth_start_date) AS prev_mth_start_day_of_month
             , prev_mth_end_date
             , DATEPART(year   , prev_mth_end_date  ) AS prev_mth_end_yr_nbr
             , DATEPART(month  , prev_mth_end_date  ) AS prev_mth_end_mth_nbr
             , DATEPART(day    , prev_mth_end_date  ) AS prev_mth_end_day_of_month
             , mth_start_date                                       
             , DATEPART(year   , mth_start_date     ) AS mth_start_yr_nbr
             , DATEPART(month  , mth_start_date     ) AS mth_start_mth_nbr
             , DATEPART(day    , mth_start_date     ) AS mth_start_day_of_month
             , mth_end_date                                         
             , DATEPART(year   , mth_end_date       ) AS mth_end_yr_nbr
             , DATEPART(month  , mth_end_date       ) AS mth_end_mth_nbr
             , DATEPART(day    , mth_end_date       ) AS mth_end_day_of_month
             , next_mth_start_date
             , DATEPART(year   , next_mth_start_date) AS next_mth_start_yr_nbr
             , DATEPART(month  , next_mth_start_date) AS next_mth_start_mth_nbr
             , DATEPART(day    , next_mth_start_date) AS next_mth_start_day_of_month
             , next_mth_end_date
             , DATEPART(year   , next_mth_end_date  ) AS next_mth_end_yr_nbr
             , DATEPART(month  , next_mth_end_date  ) AS next_mth_end_mth_nbr
             , DATEPART(day    , next_mth_end_date  ) AS next_mth_end_day_of_month
          FROM pass7)
  SELECT *
    INTO #tmp_dim_Date
    FROM pass8
   ORDER BY 1 DESC
  OPTION (MAXRECURSION 0)

  DECLARE @sql nvarchar(100) = 'DROP TABLE IF EXISTS ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table)

  EXEC (@sql)

  SET @sql = 'SELECT * INTO ' + QUOTENAME(@schema) + '.' + QUOTENAME(@table) + ' FROM #tmp_dim_Date'

  EXEC (@sql)

  DROP TABLE IF EXISTS #tmp_dim_Date
