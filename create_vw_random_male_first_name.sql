-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/2/2023
-- Description: Return a random male first name
-- =============================================
  CREATE VIEW [dbo].[vw_random_male_first_name]
  AS
  WITH name_data
    AS (SELECT v.male_name AS name
             , v.male_freq AS freq
          FROM dbo.vw_top_100_first_names v)
     , total_freq
    AS (SELECT CAST(SUM(freq) AS BIGINT) AS freq
          FROM name_data)
     , rankings
    AS (SELECT name
             , freq
             , ROW_NUMBER() OVER (ORDER BY freq DESC) AS seq
          FROM name_data)
     , running_totals
    AS (SELECT name
             , seq
             , CAST(1    AS BIGINT) AS start_val
             , CAST(freq AS BIGINT) AS end_val
          FROM rankings
         WHERE seq = 1
        UNION ALL
        SELECT r.name
             , r.seq
             , CAST(t.end_val + 1      AS BIGINT) AS start_val
             , CAST(t.end_val + r.freq AS BIGINT) AS end_val
          FROM running_totals t
             , rankings       r
         WHERE t.seq + 1
             = r.seq)
     , rndm
    AS (SELECT CAST(RAND() * freq AS BIGINT) AS RND FROM total_freq)
  SELECT name
    FROM rndm
    LEFT JOIN running_totals t
           ON rnd BETWEEN t.start_val 
                      AND t.end_val
