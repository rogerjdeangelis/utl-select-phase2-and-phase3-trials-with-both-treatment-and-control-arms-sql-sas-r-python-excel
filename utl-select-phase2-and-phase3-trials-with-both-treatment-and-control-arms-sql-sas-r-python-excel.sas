%let pgm=utl-select-phase2-and-phase3-trials-with-both-treatment-and-control-arms-sql-sas-r-python-excel;

%stop_submission;

Select phase2 and phase3 trials that have both treatment and control arms sql sas r python excel

github
https://tinyurl.com/nhkp4zvm
https://github.com/rogerjdeangelis/utl-select-phase2-and-phase3-trials-with-both-treatment-and-control-arms-sql-sas-r-python-excel

When you get the note below in SAS [tpc sql, you will need touse a subquery in sqlite.
NOTE: The query requires remerging summary statistics back with the original data.

   SOLUTIONS

     1 sas sql
     2 r sql
     3 python sql
     4 excel sql
     5 r dplyr language
       %>%,%in%, ,filter, all, .by, arrange, ::, many commas

     SOAPBOX ON
        By learning SQL, you enhance your data wrangling toolkit,
        enabling you to work more efficiently with various data sources
        and complement your skills in R, Python, and Excel.
        Spend the programming time you have saved to enhance you
        skills with r and python, stat, time series, optimization modules,
        symbolic math, AI, graphics, image, sound and iot modules.
     SOAPBOX OFF

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                         |                                            |                                                 */
/*                         |                                            |                                                 */
/*        INPUT            |        PROCESS                             |          OUPOUT                                 */
/*        =====            |  (self explantory sql)                     |          ======                                 */
/*                         |  =====================                     |                                                 */
/* options                 |                                            |                                                 */
/*  validvarname=upcase;   |                                            |   PHASE     ARM     SUBJ                        */
/* libname sd1 "d:/sd1";   |  1 SAS SQL                                 |                                                 */
/* data sd1.have;          |  =========                                 |     2      contl     X                          */
/*  input phase            |                                            |     2      treat     A                          */
/*        arm$             |  Select phase2 and phase3 trials           |     2      treat     B                          */
/*        subj$;           |  with both treatment and control           |     2      treat     C                          */
/* cards4;                 |  arms sql sas r python excel               |     2      treat     D                          */
/* 1 treat A               |                                            |     2      treat     E                          */
/* 1 treat B               |   select                                   |     2      treat     F                          */
/* 1 treat C               |      phase                                 |                                                 */
/* 1 treat D               |     ,arm                                   |     3      contl     X                          */
/* 2 treat A               |     ,subj                                  |     3      treat     A                          */
/* 2 treat B               |   from                                     |     3      treat     B                          */
/* 2 treat C               |      sd1.have                              |     3      treat     C                          */
/* 2 treat D               |   where                                    |     3      treat     D                          */
/* 2 treat E               |      phase in (2,3)                        |     3      treat     E                          */
/* 2 treat F               |   group                                    |                                                 */
/* 2 contl X  **           |      by phase                              |                                                 */
/* 3 treat A               |   having                                   |                                                 */
/* 3 treat B               |      max(arm = "treat") =1 and             |                                                 */
/* 3 treat C               |      max(arm = "contl") =1                 |                                                 */
/* 3 treat D               |   order                                    |                                                 */
/* 3 treat E               |      by phase, arm                         |                                                 */
/* 3 contl X  **           |                                            |                                                 */
/* 4 treat A               |                                            |                                                 */
/* 4 treat B               |  2-4 R PYTHON EXCEL (SAME CODE)            |                                                 */
/* 4 treat C               |  ==============================            |                                                 */
/* 4 treat D               |                                            |                                                 */
/* 4 treat E               |  sqllite does not do automatic             |                                                 */
/* 4 treat F               |  remeging so we need subquery              |                                                 */
/* ;;;;                    |                                            |                                                 */
/* run;quit;               |  with                                      |                                                 */
/*                         |     phases as                              |                                                 */
/*                         |  (select                                   |                                                 */
/*                         |     phase as phases                        |                                                 */
/*                         |  from                                      |                                                 */
/*                         |     have                                   |                                                 */
/*                         |  where                                     |                                                 */
/*                         |     phase in (2,3)                         |                                                 */
/*                         |  group                                     |                                                 */
/*                         |     by phase                               |                                                 */
/*                         |  having                                    |                                                 */
/*                         |     max(arm = "treat") =1 and              |                                                 */
/*                         |     max(arm = "contl") =1                  |                                                 */
/*                         |  )                                         |                                                 */
/*                         |  select                                    |                                                 */
/*                         |     phase                                  |                                                 */
/*                         |    ,arm                                    |                                                 */
/*                         |    ,subj                                   |                                                 */
/*                         |  from                                      |                                                 */
/*                         |    phases left join have                   |                                                 */
/*                         |  on                                        |                                                 */
/*                         |    phases = phase                          |                                                 */
/*                         |  order                                     |                                                 */
/*                         |    by phase, arm                           |                                                 */
/*                         |                                            |                                                 */
/*                         |                                            |                                                 */
/*                         | 5 R DPLYR LANGUAGE                         |                                                 */
/*                         | ===================                        |                                                 */
/*                         |                                            |                                                 */
/*                         | want<-have |>                              |                                                 */
/*                         |   dplyr::filter(PHASE==2 | PHASE==3) |>    |                                                 */
/*                         |   dplyr::filter(all(c("treat", "contl")    |                                                 */
/*                         |   %in% ARM),                               |                                                 */
/*                         |    .by = PHASE)  |>                        |                                                 */
/*                         |   dplyr::arrange(PHASE,ARM)                |                                                 */
/*                         |                                            |                                                 */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 input phase arm$ subj$;
cards4;
1 treat A
1 treat B
1 treat C
1 treat D
2 treat A
2 treat B
2 treat C
2 treat D
2 treat E
2 treat F
2 contl X
3 treat A
3 treat B
3 treat C
3 treat D
3 treat E
3 contl X
4 treat A
4 treat B
4 treat C
4 treat D
4 treat E
4 treat F
;;;;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  PHASE     ARM     SUBJ                                                                                                */
/*                                                                                                                        */
/*    1      treat     A                                                                                                  */
/*    1      treat     B                                                                                                  */
/*    1      treat     C                                                                                                  */
/*    1      treat     D                                                                                                  */
/*    2      treat     A                                                                                                  */
/*    2      treat     B                                                                                                  */
/*    2      treat     C                                                                                                  */
/*    2      treat     D                                                                                                  */
/*    2      treat     E                                                                                                  */
/*    2      treat     F                                                                                                  */
/*    2      contl     X                                                                                                  */
/*    3      treat     A                                                                                                  */
/*    3      treat     B                                                                                                  */
/*    3      treat     C                                                                                                  */
/*    3      treat     D                                                                                                  */
/*    3      treat     E                                                                                                  */
/*    3      contl     X                                                                                                  */
/*    4      treat     A                                                                                                  */
/*    4      treat     B                                                                                                  */
/*    4      treat     C                                                                                                  */
/*    4      treat     D                                                                                                  */
/*    4      treat     E                                                                                                  */
/*    4      treat     F                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc sql;
 create
    table want as
 select
    phase
   ,arm
   ,subj
 from
    sd1.have
 where
    phase in (2,3)
 group
    by phase
 having
    max(arm = "treat") =1 and
    max(arm = "contl") =1
 order
    by phase, arm, subj
;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* PHASE     ARM     SUBJ                                                                                                 */
/*                                                                                                                        */
/*   2      contl     X                                                                                                   */
/*   2      treat     A                                                                                                   */
/*   2      treat     B                                                                                                   */
/*   2      treat     C                                                                                                   */
/*   2      treat     D                                                                                                   */
/*   2      treat     E                                                                                                   */
/*   2      treat     F                                                                                                   */
/*   3      contl     X                                                                                                   */
/*   3      treat     A                                                                                                   */
/*   3      treat     B                                                                                                   */
/*   3      treat     C                                                                                                   */
/*   3      treat     D                                                                                                   */
/*   3      treat     E                                                                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                     _
|___ \   _ __   ___  __ _| |
  __) | | `__| / __|/ _` | |
 / __/  | |    \__ \ (_| | |
|_____| |_|    |___/\__, |_|
                       |_|
*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
print(have)
want<-sqldf('
 with
    phases as
 (select
    phase as phases
 from
    have
 where
    phase in (2,3)
 group
    by phase
 having
    max(arm = "treat") =1 and
    max(arm = "contl") =1
 )
 select
    phase
   ,arm
   ,subj
 from
   phases left join have
 on
   phases = phase
 order
   by phase, arm, subj
')
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*                       |                                                                                                */
/*  > want               |   SAS                                                                                          */
/*                       |                                                                                                */
/*     PHASE   ARM SUBJ  |   ROWNAMES    PHASE     ARM     SUBJ                                                           */
/*                       |                                                                                                */
/*  1      2 contl    X  |       1         2      contl     X                                                             */
/*  2      2 treat    A  |       2         2      treat     A                                                             */
/*  3      2 treat    B  |       3         2      treat     B                                                             */
/*  4      2 treat    C  |       4         2      treat     C                                                             */
/*  5      2 treat    D  |       5         2      treat     D                                                             */
/*  6      2 treat    E  |       6         2      treat     E                                                             */
/*  7      2 treat    F  |       7         2      treat     F                                                             */
/*  8      3 contl    X  |       8         3      contl     X                                                             */
/*  9      3 treat    A  |       9         3      treat     A                                                             */
/*  10     3 treat    B  |      10         3      treat     B                                                             */
/*  11     3 treat    C  |      11         3      treat     C                                                             */
/*  12     3 treat    D  |      12         3      treat     D                                                             */
/*  13     3 treat    E  |      13         3      treat     E                                                             */
/*                       |                                                                                                */
/***********************|**************************************************************************************************/

/*____               _   _                             _
|___ /   _ __  _   _| |_| |__   ___  _ __    ___  __ _| |
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \  / __|/ _` | |
 ___) | | |_) | |_| | |_| | | | (_) | | | | \__ \ (_| | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_| |___/\__, |_|
        |_|    |___/                                |_|
*/

proc datasets lib=sd1 nolist nodetails;
 delete pywant;
run;quit;

%utl_pybeginx;
parmcards4;
exec(open('c:/oto/fn_python.py').read());
have,meta = ps.read_sas7bdat('d:/sd1/have.sas7bdat');
want=pdsql('''
 with                               \
    phases as                       \
 (select                            \
    phase as phases                 \
 from                               \
    have                            \
 where                              \
    phase in (2,3)                  \
 group                              \
    by phase                        \
 having                             \
    max(arm = "treat") =1 and       \
    max(arm = "contl") =1           \
 )                                  \
 select                             \
    phase                           \
   ,arm                             \
   ,subj                            \
 from                               \
   phases left join have            \
 on                                 \
   phases = phase                   \
 order                              \
   by phase, arm                    \
   ''');
print(want);
fn_tosas9x(want,outlib='d:/sd1/',outdsn='pywant',timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;

/*  _                      _             _
| || |    _____  _____ ___| |  ___  __ _| |
| || |_  / _ \ \/ / __/ _ \ | / __|/ _` | |
|__   _||  __/>  < (_|  __/ | \__ \ (_| | |
   |_|   \___/_/\_\___\___|_| |___/\__, |_|
                              |_|
*/

%utlfkil(d:/xls/wantxl.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
library(haven)
have<-read_sas("d:/sd1/have.sas7bdat")
wb <- createWorkbook()
addWorksheet(wb, "have")
writeData(wb, sheet = "have", x = have)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/*                                                                                                                       */
/*             INPUT                                                                                                     */
/*                                                                                                                       */
/*  -----------------------+                                                                                             */
/*  | A1| fx    PHASE      |                                                                                             */
/*  ------------------------------------                                                                                 */
/*  [_] |    A     |    B    |    C    |                                                                                 */
/*  ------------------------------------                                                                                 */
/*   1  | PHASE    |  ARM    |  TYPE   |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   2  |1         treat     A         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   3  |1         treat     B         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   4  |1         treat     C         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   5  |1         treat     D         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   6  |2         treat     E         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   7  |2         treat     F         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   8  |2         treat     G         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*   9  |2         treat     H         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  10  |2         treat     I         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  11  |2         treat     J         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  12  |2         contl     X         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  13  |3         treat     A         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  14  |3         treat     B         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  15  |3         treat     C         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  16  |3         treat     D         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  17  |3         treat     E         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  18  |3         contl     F         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  19  |4         treat     A         |                                                                                 */
/*   -- |----------+---------+---------+                                                                                 */
/*  20  |4         treat     B         |                                                                                 */
/*   ----------------------------------+                                                                                 */
/*  [HAVE]                                                                                                               */
/*                                                                                                                       */
/**************************************************************************************************************************/

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
 wb<-loadWorkbook("d:/xls/wantxl.xlsx")
 have<-read.xlsx(wb,"have")
 addWorksheet(wb, "want")
 want<-sqldf('
 with
    phases as
 (select
    phase as phases
 from
    have
 where
    phase in (2,3)
 group
    by phase
 having
    max(arm = "treat") =1 and
    max(arm = "contl") =1
 )
 select
    phase
   ,arm
   ,subj
 from
   phases left join have
 on
   phases = phase
 order
   by phase, arm
  ')
 print(want)
 writeData(wb,sheet="want",x=want)
 saveWorkbook(
     wb
    ,"d:/xls/wantxl.xlsx"
    ,overwrite=TRUE)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*                                          |                                                                             */
/*  -----------------------+                |                                                                             */
/*  | A1| fx    PHASE      |                |  SAS                                                                        */
/*  ------------------------------------    |                                                                             */
/*  [_] |    A     |    B    |    C    |    |  ROWNAMES    PHASE     ARM     SUBJ                                         */
/*  ------------------------------------    |                                                                             */
/*   1  | PHASE    |  ARM    |  TYPE   |    |      1         2      contl     X                                           */
/*   -- |----------+---------+---------+    |      2         2      treat     A                                           */
/*   2  |2         contl     X         |    |      3         2      treat     B                                           */
/*   -- |----------+---------+---------+    |      4         2      treat     C                                           */
/*   3  |2         treat     E         |    |      5         2      treat     D                                           */
/*   -- |----------+---------+---------+    |      6         2      treat     E                                           */
/*   4  |2         treat     F         |    |      7         2      treat     F                                           */
/*   -- |----------+---------+---------+    |      8         3      contl     X                                           */
/*   5  |2         treat     G         |    |      9         3      treat     A                                           */
/*   -- |----------+---------+---------+    |     10         3      treat     B                                           */
/*   6  |2         treat     H         |    |     11         3      treat     C                                           */
/*   -- |----------+---------+---------+    |     12         3      treat     D                                           */
/*   7  |2         treat     I         |    |     13         3      treat     E                                           */
/*   -- |----------+---------+---------+    |                                                                             */
/*   8  |2         treat     J         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*   9  |3         contl     F         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  10  |3         treat     A         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  11  |3         treat     B         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  12  |3         treat     C         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  13  |3         treat     D         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  14  |3         treat     E         |    |                                                                             */
/*   -- |----------+---------+---------+    |                                                                             */
/*  [WANT]                                  |                                                                             */
/*                                          |                                                                             */
/**************************************************************************************************************************/

/*___               _       _             _
| ___|   _ __    __| |_ __ | |_   _ _ __ | | __ _ _ __   __ _ _   _  __ _  __ _  ___
|___ \  | `__|  / _` | `_ \| | | | | `__|| |/ _` | `_ \ / _` | | | |/ _` |/ _` |/ _ \
 ___) | | |    | (_| | |_) | | |_| | |   | | (_| | | | | (_| | |_| | (_| | (_| |  __/
|____/  |_|     \__,_| .__/|_|\__, |_|   |_|\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
                     |_|      |___/                     |___/             |___/
*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
print(have)
want<-have |>
  dplyr::filter(PHASE==2 | PHASE==3) |>
  dplyr::filter(all(c("treat", "contl")
  %in% ARM), .by = PHASE)  |>
  dplyr::arrange(PHASE,ARM)
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*                        |                                                                                               */
/*  > want                | SAS                                                                                           */
/*                        |                                                                                               */
/*     PHASE ARM   SUBJ   | ROWNAMES    PHASE     ARM     SUBJ                                                            */
/*     <dbl> <chr> <chr>  |                                                                                               */
/*   1     2 contl X      |     1         2      contl     X                                                              */
/*   2     2 treat A      |     2         2      treat     A                                                              */
/*   3     2 treat B      |     3         2      treat     B                                                              */
/*   4     2 treat C      |     4         2      treat     C                                                              */
/*   5     2 treat D      |     5         2      treat     D                                                              */
/*   6     2 treat E      |     6         2      treat     E                                                              */
/*   7     2 treat F      |     7         2      treat     F                                                              */
/*   8     3 contl X      |     8         3      contl     X                                                              */
/*   9     3 treat A      |     9         3      treat     A                                                              */
/*  10     3 treat B      |    10         3      treat     B                                                              */
/*  11     3 treat C      |    11         3      treat     C                                                              */
/*  12     3 treat D      |    12         3      treat     D                                                              */
/*  13     3 treat E      |    13         3      treat     E                                                              */
/*                        |                                                                                               */
/**************************************************************************************************************************/
/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
