-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/3/2023
-- Description: Generate a table of frequencies 
--              for each word in a text string.
-- =============================================
  CREATE FUNCTION dbo.tvf_word_frequencies
  (
      @txt nvarchar(max)
  )
  RETURNS 
      @freq_tbl TABLE 
      (
          word nvarchar(100)
        , freq int
      )
  AS
  BEGIN
      SET @txt = REPLACE(@txt, '’', '''') 

      ;
      WITH contractions
        AS (
                      SELECT 02 AS idx, 'aren''t    '  AS contraction, 'are not     ' AS expanded
            UNION ALL SELECT 03 AS idx, 'can''t     '  AS contraction, 'cannot      ' AS expanded
            UNION ALL SELECT 04 AS idx, 'couldn''t  '  AS contraction, 'could not   ' AS expanded
            UNION ALL SELECT 05 AS idx, 'didn''t    '  AS contraction, 'did not     ' AS expanded
            UNION ALL SELECT 06 AS idx, 'doesn''t   '  AS contraction, 'does not    ' AS expanded
            UNION ALL SELECT 07 AS idx, 'don''t     '  AS contraction, 'do not      ' AS expanded
            UNION ALL SELECT 08 AS idx, 'hadn''t    '  AS contraction, 'had not     ' AS expanded
            UNION ALL SELECT 09 AS idx, 'hasn''t    '  AS contraction, 'has not     ' AS expanded
            UNION ALL SELECT 10 AS idx, 'haven''t   '  AS contraction, 'have not    ' AS expanded
            UNION ALL SELECT 11 AS idx, 'he''d      '  AS contraction, 'he had      ' AS expanded
            UNION ALL SELECT 12 AS idx, 'he''ll     '  AS contraction, 'he will     ' AS expanded
            UNION ALL SELECT 13 AS idx, 'he''s      '  AS contraction, 'he is       ' AS expanded
            UNION ALL SELECT 14 AS idx, 'I''d       '  AS contraction, 'I had       ' AS expanded
            UNION ALL SELECT 15 AS idx, 'I''ll      '  AS contraction, 'I will      ' AS expanded
            UNION ALL SELECT 16 AS idx, 'I''m       '  AS contraction, 'I am        ' AS expanded
            UNION ALL SELECT 17 AS idx, 'I''ve      '  AS contraction, 'I have      ' AS expanded
            UNION ALL SELECT 18 AS idx, 'isn''t     '  AS contraction, 'is not      ' AS expanded
            UNION ALL SELECT 19 AS idx, 'let''s     '  AS contraction, 'let us      ' AS expanded
            UNION ALL SELECT 20 AS idx, 'mightn''t  '  AS contraction, 'might not   ' AS expanded
            UNION ALL SELECT 21 AS idx, 'mustn''t   '  AS contraction, 'must not    ' AS expanded
            UNION ALL SELECT 22 AS idx, 'shan''t    '  AS contraction, 'shall not   ' AS expanded
            UNION ALL SELECT 23 AS idx, 'she''d     '  AS contraction, 'she had     ' AS expanded
            UNION ALL SELECT 24 AS idx, 'she''ll    '  AS contraction, 'she will    ' AS expanded
            UNION ALL SELECT 25 AS idx, 'she''s     '  AS contraction, 'she is      ' AS expanded
            UNION ALL SELECT 26 AS idx, 'shouldn''t '  AS contraction, 'should not  ' AS expanded
            UNION ALL SELECT 27 AS idx, 'that''s    '  AS contraction, 'that is     ' AS expanded
            UNION ALL SELECT 28 AS idx, 'there''s   '  AS contraction, 'there is    ' AS expanded
            UNION ALL SELECT 29 AS idx, 'they''d    '  AS contraction, 'they had    ' AS expanded
            UNION ALL SELECT 30 AS idx, 'they''ll   '  AS contraction, 'they will   ' AS expanded
            UNION ALL SELECT 31 AS idx, 'they''re   '  AS contraction, 'they are    ' AS expanded
            UNION ALL SELECT 32 AS idx, 'they''ve   '  AS contraction, 'they have   ' AS expanded
            UNION ALL SELECT 33 AS idx, 'we''d      '  AS contraction, 'we had      ' AS expanded
            UNION ALL SELECT 34 AS idx, 'we''re     '  AS contraction, 'we are      ' AS expanded
            UNION ALL SELECT 35 AS idx, 'we''ve     '  AS contraction, 'we have     ' AS expanded
            UNION ALL SELECT 36 AS idx, 'weren''t   '  AS contraction, 'were not    ' AS expanded
            UNION ALL SELECT 37 AS idx, 'what''ll   '  AS contraction, 'what will   ' AS expanded
            UNION ALL SELECT 38 AS idx, 'what''re   '  AS contraction, 'what are    ' AS expanded
            UNION ALL SELECT 39 AS idx, 'what''s    '  AS contraction, 'what is     ' AS expanded
            UNION ALL SELECT 40 AS idx, 'what''ve   '  AS contraction, 'what have   ' AS expanded
            UNION ALL SELECT 41 AS idx, 'where''s   '  AS contraction, 'where is    ' AS expanded
            UNION ALL SELECT 42 AS idx, 'who''d     '  AS contraction, 'who had     ' AS expanded
            UNION ALL SELECT 43 AS idx, 'who''ll    '  AS contraction, 'who will    ' AS expanded
            UNION ALL SELECT 44 AS idx, 'who''re    '  AS contraction, 'who are     ' AS expanded
            UNION ALL SELECT 45 AS idx, 'who''s     '  AS contraction, 'who is      ' AS expanded
            UNION ALL SELECT 46 AS idx, 'who''ve    '  AS contraction, 'who have    ' AS expanded
            UNION ALL SELECT 47 AS idx, 'won''t     '  AS contraction, 'will not    ' AS expanded
            UNION ALL SELECT 48 AS idx, 'y''all     '  AS contraction, 'you         ' AS expanded
            UNION ALL SELECT 49 AS idx, 'wouldn''t  '  AS contraction, 'would not   ' AS expanded
            UNION ALL SELECT 50 AS idx, 'you''d     '  AS contraction, 'you had     ' AS expanded
            UNION ALL SELECT 51 AS idx, 'you''ll    '  AS contraction, 'you will    ' AS expanded
            UNION ALL SELECT 52 AS idx, 'you''re    '  AS contraction, 'you are     ' AS expanded
            UNION ALL SELECT 53 AS idx, 'she ain''t '  AS contraction, 'she is not  ' AS expanded
            UNION ALL SELECT 54 AS idx, 'he ain''t  '  AS contraction, 'he is not   ' AS expanded
            UNION ALL SELECT 55 AS idx, 'it ain''t  '  AS contraction, 'it is not   ' AS expanded
            UNION ALL SELECT 56 AS idx, 'we ain''t  '  AS contraction, 'we are not  ' AS expanded
            UNION ALL SELECT 57 AS idx, 'they ain''t'  AS contraction, 'they are not' AS expanded
            UNION ALL SELECT 58 AS idx, 'you ain''t '  AS contraction, 'you are not ' AS expanded
            )
         , txt_tbl
        AS (SELECT @txt AS txt)
         , replaces
        AS (SELECT contraction
                 , expanded
                 , idx
                 , REPLACE(REPLACE(txt, contraction, expanded), '  ', ' ') AS txt
              FROM contractions
                 , txt_tbl
             WHERE idx = 1
            UNION ALL
            SELECT r.contraction
                 , r.expanded
                 , r.idx
                 , REPLACE(REPLACE(txt, r.contraction, r.expanded), '  ', ' ') AS txt
              FROM contractions c
                 , replaces     r
             WHERE r.idx = c.idx + 1)
      SELECT @txt = REPLACE(txt, '''s', '') 
        FROM replaces
       WHERE idx = (SELECT max(idx) idx FROM contractions)
      OPTION (maxrecursion 0)
      
      ;
      WITH chars 
        AS (SELECT '[].,{}!():;@#$%^&*-+=0123456789"''<>`~\|?/' + CHAR(13) + CHAR(10) as chrs)
         , txt_tbl
        AS (SELECT @txt AS txt)
         , replaces
        AS (SELECT SUBSTRING(chrs, 1, 1) AS chr
                 , chrs
                 , 1                     AS idx
                 , REPLACE(REPLACE(txt, SUBSTRING(chrs, 1, 1), ''), '  ', ' ') AS txt
              FROM chars
                 , txt_tbl
            UNION ALL
            SELECT SUBSTRING(chrs, idx+1, 1) AS chr
                 , chrs
                 , idx + 1                   AS idx
                 , REPLACE(REPLACE(txt, SUBSTRING(chrs, idx+1, 1), ''), '  ', ' ') AS txt
              FROM replaces r
             WHERE idx < LEN(r.chrs))
      SELECT @txt = txt
        FROM replaces
       WHERE idx = len(chrs)
      OPTION (maxrecursion 0)
      
      ;
      WITH words
        AS (
      SELECT value AS word
        FROM string_split(@txt, ' ')
       WHERE value <> ' ')
       INSERT INTO @freq_tbl
      SELECT word
           , COUNT(*) AS nbr
        FROM words
       GROUP BY word
       ORDER BY 2 DESC, 1
    
      RETURN 
  END
