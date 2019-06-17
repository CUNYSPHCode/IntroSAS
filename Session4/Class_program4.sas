libname lion 'S:\github\IntroSAS\datasets'; 

proc freq data = lion.classds; 
table gender race; 
run; 

data mydata; 
set lion.classds; 
if gender = 99 then gender = .;
if race = 99 then race = .; 
run; 

proc contents data = mydata; run; 

proc freq data = mydata; 
table gender race; 
run; 

proc freq data = mydata; 
table gender location / missing; 
run; 

proc contents data = mydata; run; 

proc freq data = mydata; 
table gender*race; 
run; 

proc freq data = mydata; 
table gender*race /missing; 
run; 

proc freq data = mydata; 
table gender*race /missing nopct nocol norow; 
run; 


proc freq data = mydata; 
table gender*race /missing list; 
run; 

proc freq data = mydata; 
table borough*gender*race /missing; 
run; 

proc freq data = mydata; 
table gender*age /missing; 
run; 

proc freq data = mydata; 
tables borough*gender*location /missing; 
run; 

proc freq data = mydata; 
tables gender*location /missing; 
where borough = 1; 
run; 

proc freq data = mydata; 
tables gender*(location borough) /missing; 
run; 

proc freq data = mydata; 
tables (location borough)*gender /missing; 
run; 


proc freq data = mydata; 
table age; run; 

proc means data = mydata; 
var age; 
run;


proc format; 
value $borofmt
 '1' = 'Bronx'
 '2' = 'Brooklyn'
 '3' = 'Manhattan'
 '4' = 'Queens'
 '5' = 'Staten Island'
;
value boroughf
 1 = "Bronx"
 2 = "Brooklyn"
 3 = "Manhattan"
 4 = "Queens"
 5 = "Staten Island"
 ; 
run;

proc freq data = mydata; 
  table boro_char; 
run; 

proc contents data = mydata; 
run;

proc freq data = mydata; 
  table boro_char; 
  format boro_char $borofmt.; 
run; 



proc format ;
value fgender
1= '1 - male'
2 = '2 - female'
99 = '99 - missing';

value formatgender
low - 1 = "male"
2 = "female";

value fage
low - 25 = '0-25'
26 - high = '26 +';

run;

PROC FREQ data = mydata;
tables gender*age; 
format  gender formatgender. age fage.;
run;

data work.mydata2; 
set mydata; 
format gender fgender.; 
run; 

proc contents data = mydata2; run; 

proc freq data = work.mydata2;
table gender;
run; 

/*force load the data by stripping the formats*/
option nofmterr; 

proc format library = lion.classformats;
value fgender
1= '1 = male'
2 = '2 = female'
99 = '99 = missing';

value formatgender
low - 1 = "male"
2 = "female";

value fage
low - 25 = '0-25'
26 - high = '26 +';

run;

options fmtsearch = (lion.classformats work); 

%include "C:\Users\mramos\Downloads\Final_Formats_NYCHANES-2013-14_AnalyticDB_042618.sas";

proc contents data = mydata2; run; 

/*ods html path = "E:\GitHub\IntroSAS\datasets\";*/
ODS HTML PATH='C:\Users\mramos\Downloads\'
	FILE = 'test.xls';

proc freq data = mydata2; 
table gender*race /missing; 
run; 

ods html close; 

/*save directly to an excel file*/
ODS HTML FILE='C:\Users\mramos\Downloads\test1.xls';

proc freq data = mydata2; 
table gender*race / list; 
run; 

ODS HTML close; 

/*Save file to rich text format*/
ODS RTF FILE = 'C:\Users\mramos\Downloads\myFile.rtf';

proc contents data = mydata2; 
run;

ODS RTF close; 

/*Note: This will not be output*/
proc print data = mydata (obs = 20); 
run; 

/*Re-enable the ODS*/
ods html;
proc print data = mydata (obs = 20); 
run; 
