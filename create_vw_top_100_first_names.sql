-- =============================================
-- Author:      sqldude2022@yahoo.com
-- Create date: 1/2/2023
-- Description: Return a result of the top 100 
--              male and female first names.
-- =============================================
  CREATE VIEW dbo.vw_top_100_first_names
  AS
  WITH top_100_first_names
    AS (          SELECT 'JAMES      ' AS male_name,  10835570 AS male_freq, 'MARY      ' AS female_name, 8585507 AS female_freq
        UNION ALL SELECT 'JOHN       ' AS male_name,  10682082 AS male_freq, 'PATRICIA  ' AS female_name, 3504089 AS female_freq
        UNION ALL SELECT 'ROBERT     ' AS male_name,  10264073 AS male_freq, 'LINDA     ' AS female_name, 3379992 AS female_freq
        UNION ALL SELECT 'MICHAEL    ' AS male_name,   8585507 AS male_freq, 'BARBARA   ' AS female_name, 3200379 AS female_freq
        UNION ALL SELECT 'WILLIAM    ' AS male_name,   8004214 AS male_freq, 'ELIZABETH ' AS female_name, 3059954 AS female_freq
        UNION ALL SELECT 'DAVID      ' AS male_name,   7716833 AS male_freq, 'JENNIFER  ' AS female_name, 3043626 AS female_freq
        UNION ALL SELECT 'RICHARD    ' AS male_name,   5561475 AS male_freq, 'MARIA     ' AS female_name, 2703994 AS female_freq
        UNION ALL SELECT 'CHARLES    ' AS male_name,   4973651 AS male_freq, 'SUSAN     ' AS female_name, 2592960 AS female_freq
        UNION ALL SELECT 'JOSEPH     ' AS male_name,   4585033 AS male_freq, 'MARGARET  ' AS female_name, 2508052 AS female_freq
        UNION ALL SELECT 'THOMAS     ' AS male_name,   4506656 AS male_freq, 'DOROTHY   ' AS female_name, 2374159 AS female_freq
        UNION ALL SELECT 'CHRISTOPHER' AS male_name,   3379992 AS male_freq, 'LISA      ' AS female_name, 2299048 AS female_freq
        UNION ALL SELECT 'DANIEL     ' AS male_name,   3180785 AS male_freq, 'NANCY     ' AS female_name, 2184749 AS female_freq
        UNION ALL SELECT 'PAUL       ' AS male_name,   3095877 AS male_freq, 'KAREN     ' AS female_name, 2178217 AS female_freq
        UNION ALL SELECT 'MARK       ' AS male_name,   3063220 AS male_freq, 'BETTY     ' AS female_name, 2174952 AS female_freq
        UNION ALL SELECT 'DONALD     ' AS male_name,   3040360 AS male_freq, 'HELEN     ' AS female_name, 2165155 AS female_freq
        UNION ALL SELECT 'GEORGE     ' AS male_name,   3027297 AS male_freq, 'SANDRA    ' AS female_name, 2054121 AS female_freq
        UNION ALL SELECT 'KENNETH    ' AS male_name,   2697462 AS male_freq, 'DONNA     ' AS female_name, 1903899 AS female_freq
        UNION ALL SELECT 'STEVEN     ' AS male_name,   2547241 AS male_freq, 'CAROL     ' AS female_name, 1845117 AS female_freq
        UNION ALL SELECT 'EDWARD     ' AS male_name,   2543975 AS male_freq, 'RUTH      ' AS female_name, 1835320 AS female_freq
        UNION ALL SELECT 'BRIAN      ' AS male_name,   2403550 AS male_freq, 'SHARON    ' AS female_name, 1704692 AS female_freq
        UNION ALL SELECT 'RONALD     ' AS male_name,   2367627 AS male_freq, 'MICHELLE  ' AS female_name, 1694895 AS female_freq
        UNION ALL SELECT 'ANTHONY    ' AS male_name,   2354565 AS male_freq, 'LAURA     ' AS female_name, 1665503 AS female_freq
        UNION ALL SELECT 'KEVIN      ' AS male_name,   2191280 AS male_freq, 'SARAH     ' AS female_name, 1658972 AS female_freq
        UNION ALL SELECT 'JASON      ' AS male_name,   2155357 AS male_freq, 'KIMBERLY  ' AS female_name, 1645909 AS female_freq
        UNION ALL SELECT 'MATTHEW    ' AS male_name,   2145560 AS male_freq, 'DEBORAH   ' AS female_name, 1613252 AS female_freq
        UNION ALL SELECT 'GARY       ' AS male_name,   2122701 AS male_freq, 'JESSICA   ' AS female_name, 1600190 AS female_freq
        UNION ALL SELECT 'TIMOTHY    ' AS male_name,   2090044 AS male_freq, 'SHIRLEY   ' AS female_name, 1574064 AS female_freq
        UNION ALL SELECT 'JOSE       ' AS male_name,   2001870 AS male_freq, 'CYNTHIA   ' AS female_name, 1531610 AS female_freq
        UNION ALL SELECT 'LARRY      ' AS male_name,   1952884 AS male_freq, 'ANGELA    ' AS female_name, 1528344 AS female_freq
        UNION ALL SELECT 'JEFFREY    ' AS male_name,   1930025 AS male_freq, 'MELISSA   ' AS female_name, 1508750 AS female_freq
        UNION ALL SELECT 'FRANK      ' AS male_name,   1897368 AS male_freq, 'BRENDA    ' AS female_name, 1485890 AS female_freq
        UNION ALL SELECT 'SCOTT      ' AS male_name,   1783068 AS male_freq, 'AMY       ' AS female_name, 1472828 AS female_freq
        UNION ALL SELECT 'ERIC       ' AS male_name,   1776537 AS male_freq, 'ANNA      ' AS female_name, 1436905 AS female_freq
        UNION ALL SELECT 'STEPHEN    ' AS male_name,   1763474 AS male_freq, 'REBECCA   ' AS female_name, 1404248 AS female_freq
        UNION ALL SELECT 'ANDREW     ' AS male_name,   1753677 AS male_freq, 'VIRGINIA  ' AS female_name, 1404248 AS female_freq
        UNION ALL SELECT 'RAYMOND    ' AS male_name,   1593658 AS male_freq, 'KATHLEEN  ' AS female_name, 1384654 AS female_freq
        UNION ALL SELECT 'GREGORY    ' AS male_name,   1440171 AS male_freq, 'PAMELA    ' AS female_name, 1358528 AS female_freq
        UNION ALL SELECT 'JOSHUA     ' AS male_name,   1420576 AS male_freq, 'MARTHA    ' AS female_name, 1345466 AS female_freq
        UNION ALL SELECT 'JERRY      ' AS male_name,   1410779 AS male_freq, 'DEBRA     ' AS female_name, 1332403 AS female_freq
        UNION ALL SELECT 'DENNIS     ' AS male_name,   1355263 AS male_freq, 'AMANDA    ' AS female_name, 1319340 AS female_freq
        UNION ALL SELECT 'WALTER     ' AS male_name,   1303012 AS male_freq, 'STEPHANIE ' AS female_name, 1306277 AS female_freq
        UNION ALL SELECT 'PATRICK    ' AS male_name,   1270355 AS male_freq, 'CAROLYN   ' AS female_name, 1257292 AS female_freq
        UNION ALL SELECT 'PETER      ' AS male_name,   1244229 AS male_freq, 'CHRISTINE ' AS female_name, 1247495 AS female_freq
        UNION ALL SELECT 'HAROLD     ' AS male_name,   1211572 AS male_freq, 'MARIE     ' AS female_name, 1237698 AS female_freq
        UNION ALL SELECT 'DOUGLAS    ' AS male_name,   1198509 AS male_freq, 'JANET     ' AS female_name, 1237698 AS female_freq
        UNION ALL SELECT 'HENRY      ' AS male_name,   1191978 AS male_freq, 'CATHERINE ' AS female_name, 1218104 AS female_freq
        UNION ALL SELECT 'CARL       ' AS male_name,   1129930 AS male_freq, 'FRANCES   ' AS female_name, 1208306 AS female_freq
        UNION ALL SELECT 'ARTHUR     ' AS male_name,   1094007 AS male_freq, 'ANN       ' AS female_name, 1188712 AS female_freq
        UNION ALL SELECT 'RYAN       ' AS male_name,   1071147 AS male_freq, 'JOYCE     ' AS female_name, 1188712 AS female_freq
        UNION ALL SELECT 'ROGER      ' AS male_name,   1051553 AS male_freq, 'DIANE     ' AS female_name, 1172384 AS female_freq
        UNION ALL SELECT 'JOE        ' AS male_name,   1048287 AS male_freq, 'ALICE     ' AS female_name, 1165852 AS female_freq
        UNION ALL SELECT 'JUAN       ' AS male_name,   1031959 AS male_freq, 'JULIE     ' AS female_name, 1136461 AS female_freq
        UNION ALL SELECT 'JACK       ' AS male_name,   1028693 AS male_freq, 'HEATHER   ' AS female_name, 1100539 AS female_freq
        UNION ALL SELECT 'ALBERT     ' AS male_name,   1025428 AS male_freq, 'TERESA    ' AS female_name, 1097273 AS female_freq
        UNION ALL SELECT 'JONATHAN   ' AS male_name,   1022162 AS male_freq, 'DORIS     ' AS female_name, 1094007 AS female_freq
        UNION ALL SELECT 'JUSTIN     ' AS male_name,   1015631 AS male_freq, 'GLORIA    ' AS female_name, 1094007 AS female_freq
        UNION ALL SELECT 'TERRY      ' AS male_name,   1015631 AS male_freq, 'EVELYN    ' AS female_name, 1051553 AS female_freq
        UNION ALL SELECT 'GERALD     ' AS male_name,   1009099 AS male_freq, 'JEAN      ' AS female_name, 1028693 AS female_freq
        UNION ALL SELECT 'KEITH      ' AS male_name,   1005833 AS male_freq, 'CHERYL    ' AS female_name, 1028693 AS female_freq
        UNION ALL SELECT 'SAMUEL     ' AS male_name,    999302 AS male_freq, 'MILDRED   ' AS female_name, 1022162 AS female_freq
        UNION ALL SELECT 'WILLIE     ' AS male_name,    986239 AS male_freq, 'KATHERINE ' AS female_name, 1022162 AS female_freq
        UNION ALL SELECT 'RALPH      ' AS male_name,    920925 AS male_freq, 'JOAN      ' AS female_name,  999302 AS female_freq
        UNION ALL SELECT 'LAWRENCE   ' AS male_name,    920925 AS male_freq, 'ASHLEY    ' AS female_name,  989505 AS female_freq
        UNION ALL SELECT 'NICHOLAS   ' AS male_name,    898066 AS male_freq, 'JUDITH    ' AS female_name,  969911 AS female_freq
        UNION ALL SELECT 'ROY        ' AS male_name,    891534 AS male_freq, 'ROSE      ' AS female_name,  966645 AS female_freq
        UNION ALL SELECT 'BENJAMIN   ' AS male_name,    881737 AS male_freq, 'JANICE    ' AS female_name,  930723 AS female_freq
        UNION ALL SELECT 'BRUCE      ' AS male_name,    858877 AS male_freq, 'KELLY     ' AS female_name,  924191 AS female_freq
        UNION ALL SELECT 'BRANDON    ' AS male_name,    849080 AS male_freq, 'NICOLE    ' AS female_name,  917660 AS female_freq
        UNION ALL SELECT 'ADAM       ' AS male_name,    845815 AS male_freq, 'JUDY      ' AS female_name,  901331 AS female_freq
        UNION ALL SELECT 'HARRY      ' AS male_name,    819689 AS male_freq, 'CHRISTINA ' AS female_name,  898066 AS female_freq
        UNION ALL SELECT 'FRED       ' AS male_name,    819689 AS male_freq, 'KATHY     ' AS female_name,  888269 AS female_freq
        UNION ALL SELECT 'WAYNE      ' AS male_name,    813158 AS male_freq, 'THERESA   ' AS female_name,  885003 AS female_freq
        UNION ALL SELECT 'BILLY      ' AS male_name,    809892 AS male_freq, 'BEVERLY   ' AS female_name,  871940 AS female_freq
        UNION ALL SELECT 'STEVE      ' AS male_name,    803360 AS male_freq, 'DENISE    ' AS female_name,  862143 AS female_freq
        UNION ALL SELECT 'LOUIS      ' AS male_name,    793563 AS male_freq, 'TAMMY     ' AS female_name,  845815 AS female_freq
        UNION ALL SELECT 'JEREMY     ' AS male_name,    790298 AS male_freq, 'IRENE     ' AS female_name,  822955 AS female_freq
        UNION ALL SELECT 'AARON      ' AS male_name,    783766 AS male_freq, 'JANE      ' AS female_name,  816423 AS female_freq
        UNION ALL SELECT 'RANDY      ' AS male_name,    757641 AS male_freq, 'LORI      ' AS female_name,  809892 AS female_freq
        UNION ALL SELECT 'HOWARD     ' AS male_name,    751109 AS male_freq, 'RACHEL    ' AS female_name,  790298 AS female_freq
        UNION ALL SELECT 'EUGENE     ' AS male_name,    751109 AS male_freq, 'MARILYN   ' AS female_name,  787032 AS female_freq
        UNION ALL SELECT 'CARLOS     ' AS male_name,    747844 AS male_freq, 'ANDREA    ' AS female_name,  770704 AS female_freq
        UNION ALL SELECT 'RUSSELL    ' AS male_name,    731515 AS male_freq, 'KATHRYN   ' AS female_name,  764172 AS female_freq
        UNION ALL SELECT 'BOBBY      ' AS male_name,    728250 AS male_freq, 'LOUISE    ' AS female_name,  747844 AS female_freq
        UNION ALL SELECT 'VICTOR     ' AS male_name,    724984 AS male_freq, 'SARA      ' AS female_name,  747844 AS female_freq
        UNION ALL SELECT 'MARTIN     ' AS male_name,    705390 AS male_freq, 'ANNE      ' AS female_name,  744578 AS female_freq
        UNION ALL SELECT 'ERNEST     ' AS male_name,    702124 AS male_freq, 'JACQUELINE' AS female_name,  744578 AS female_freq
        UNION ALL SELECT 'PHILLIP    ' AS male_name,    695593 AS male_freq, 'WANDA     ' AS female_name,  738047 AS female_freq
        UNION ALL SELECT 'TODD       ' AS male_name,    695593 AS male_freq, 'BONNIE    ' AS female_name,  728250 AS female_freq
        UNION ALL SELECT 'JESSE      ' AS male_name,    682530 AS male_freq, 'JULIA     ' AS female_name,  728250 AS female_freq
        UNION ALL SELECT 'CRAIG      ' AS male_name,    672733 AS male_freq, 'RUBY      ' AS female_name,  721718 AS female_freq
        UNION ALL SELECT 'ALAN       ' AS male_name,    666201 AS male_freq, 'LOIS      ' AS female_name,  718452 AS female_freq
        UNION ALL SELECT 'SHAWN      ' AS male_name,    653139 AS male_freq, 'TINA      ' AS female_name,  718452 AS female_freq
        UNION ALL SELECT 'CLARENCE   ' AS male_name,    643342 AS male_freq, 'PHYLLIS   ' AS female_name,  715187 AS female_freq
        UNION ALL SELECT 'SEAN       ' AS male_name,    643342 AS male_freq, 'NORMA     ' AS female_name,  711921 AS female_freq
        UNION ALL SELECT 'PHILIP     ' AS male_name,    643342 AS male_freq, 'PAULA     ' AS female_name,  708655 AS female_freq
        UNION ALL SELECT 'CHRIS      ' AS male_name,    643342 AS male_freq, 'DIANA     ' AS female_name,  705390 AS female_freq
        UNION ALL SELECT 'JOHNNY     ' AS male_name,    636810 AS male_freq, 'ANNIE     ' AS female_name,  705390 AS female_freq
        UNION ALL SELECT 'EARL       ' AS male_name,    630279 AS male_freq, 'LILLIAN   ' AS female_name,  689061 AS female_freq
        UNION ALL SELECT 'JIMMY      ' AS male_name,    623747 AS male_freq, 'EMILY     ' AS female_name,  679264 AS female_freq
        UNION ALL SELECT 'ANTONIO    ' AS male_name,    620482 AS male_freq, 'ROBIN     ' AS female_name,  679264 AS female_freq)
  SELECT *
    FROM top_100_first_names
