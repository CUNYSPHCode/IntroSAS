LIBNAME lion 'S:\github\IntroSAS\datasets'; 

PROC FREQ DATA = lion.classds; 
TABLE gender race; 
RUN; 

DATA mydata; 
SET lion.classds; 
IF gender = 99 THEN gender = .;
IF race = 99 THEN race = .; 
RUN; 

PROC CONTENTS DATA = mydata; RUN; 

PROC FREQ DATA = mydata; 
TABLE gender race; 
RUN; 

PROC FREQ DATA = mydata; 
TABLE gender location / missing; 
RUN; 

PROC CONTENTS DATA = mydata; RUN; 

PROC FREQ DATA = mydata; 
TABLE gender*race; 
RUN; 

PROC FREQ DATA = mydata; 
TABLE gender*race /missing; 
RUN; 

PROC FREQ DATA = mydata; 
TABLE gender*race /missing nopct nocol norow; 
RUN; 


PROC FREQ DATA = mydata; 
TABLE gender*race /missing list; 
RUN; 

PROC FREQ DATA = mydata; 
TABLE borough*gender*race /missing; 
RUN; 

PROC FREQ DATA = mydata; 
TABLE gender*age /missing; 
RUN; 

PROC FREQ DATA = mydata; 
TABLES borough*gender*location /missing; 
RUN; 

PROC FREQ DATA = mydata; 
TABLES gender*location /missing; 
where borough = 1; 
RUN; 

PROC FREQ DATA = mydata; 
TABLES gender*(location borough) /missing; 
RUN; 

PROC FREQ DATA = mydata; 
TABLES (location borough)*gender /missing; 
RUN; 


PROC FREQ DATA = mydata; 
TABLE age; RUN; 

PROC means DATA = mydata; 
var age; 
RUN;


PROC FORMAT; 
* bad practice; 
VALUE $borofmt
 '1' = 'Bronx'
 '2' = 'Brooklyn'
 '3' = 'Manhattan'
 '4' = 'Queens'
 '5' = 'Staten Island'
;
* good practice; 
VALUE boroughf
 1 = "Bronx"
 2 = "Brooklyn"
 3 = "Manhattan"
 4 = "Queens"
 5 = "Staten Island"
 ; 
RUN;

PROC FREQ DATA = mydata; 
  TABLE boro_char; 
RUN; 

PROC CONTENTS DATA = mydata; 
RUN;

PROC FREQ DATA = mydata; 
  TABLE boro_char; 
  FORMAT boro_char $borofmt.; 
RUN; 



PROC FORMAT ;
VALUE fgender
1= '1 - male'
2 = '2 - female'
99 = '99 - missing';

VALUE formatgender
low - 1 = "male"
2 = "female";

VALUE fage
low - 25 = '0-25'
26 - high = '26 +';

RUN;

PROC FREQ DATA = mydata;
TABLES gender*age; 
FORMAT  gender formatgender. age fage.;
RUN;

DATA work.mydata2; 
SET mydata; 
FORMAT gender fgender.; 
RUN; 

PROC CONTENTS DATA = mydata2; RUN; 

PROC FREQ DATA = work.mydata2;
TABLE gender;
RUN; 

/*force load the data by stripping the formats*/
OPTION nofmterr; 

PROC FORMAT library = lion.classformats;
VALUE fgender
1= '1 = male'
2 = '2 = female'
99 = '99 = missing';

VALUE formatgender
low - 1 = "male"
2 = "female";

VALUE fage
low - 25 = '0-25'
26 - high = '26 +';

RUN;

OPTIONS fmtsearch = (lion.classformats work); 

%include "C:\Users\mramos\Downloads\Final_Formats_NYCHANES-2013-14_AnalyticDB_042618.sas";

PROC CONTENTS DATA = mydata2; RUN; 

/*ods html path = "E:\GitHub\IntroSAS\datasets\";*/
ODS HTML PATH='C:\Users\mramos\Downloads\'
	FILE = 'test.xls';

PROC FREQ DATA = mydata2; 
TABLE gender*race /missing; 
RUN; 

ODS HTML close; 

/*save directly to an excel file*/
ODS HTML FILE='C:\Users\mramos\Downloads\test1.xls';

PROC FREQ DATA = mydata2; 
TABLE gender*race / list; 
RUN; 

ODS HTML close; 

/*Save file to rich text format*/
ODS RTF FILE = 'C:\Users\mramos\Downloads\myFile.rtf';

PROC CONTENTS DATA = mydata2; 
RUN;

ODS RTF close; 

/*Note: This will not be output*/
PROC print DATA = mydata (obs = 20); 
RUN; 

/*Re-enable the ODS*/
ODS HTML;
PROC print DATA = mydata (obs = 20); 
RUN; 
