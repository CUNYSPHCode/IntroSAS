libname lion 'E:\GitHub\IntroSAS\datasets'; 

proc freq data = lion.classds; 
table gender; 
run; 

data mydata; 
set lion.classds; 
if gender = 99 then gender = .;
run; 

proc freq data = mydata; 
table gender; 
run; 

proc freq data = mydata; 
table gender /missing; 
run; 

proc contents data = mydata; run; 

proc freq data = mydata; 
table gender*race; 
run; 

proc freq data = mydata; 
table gender*race /missing; 
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
table age; run; 

proc format ;
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

PROC FREQ data = mydata;
tables gender*age; 
format  gender formatgender. age fage.;

run;

data lion.mydata2; 
set mydata; 
format gender fgender.; 
run; 

proc contents data = lion.mydata2; run; 

proc freq data = lion.mydata2;
table gender; run; 

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



/*ods html path = "E:\GitHub\IntroSAS\datasets\";*/
ODS HTML FILE='C:\Users\AV\Downloads\test.xls';

proc freq data = lion.classds; 
table gender*race /missing; 
run; 

ods html close; 

ods html;
