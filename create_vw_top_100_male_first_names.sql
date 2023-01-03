-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/2/2023
-- Description: Return a result of the top 100 
--              male first names.
-- =============================================
  CREATE VIEW [dbo].[vw_top_100_male_first_names]
  AS
  SELECT v.male_name
       , v.male_freq
    FROM vw_top_100_first_names v
