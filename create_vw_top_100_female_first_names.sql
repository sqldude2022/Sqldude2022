-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/2/2023
-- Description: Return a result set with the 
--              top 100 female first names.
-- =============================================
  CREATE VIEW [dbo].[vw_top_100_female_first_names]
  AS
  SELECT v.female_name
       , v.female_freq
    FROM vw_top_100_first_names v
