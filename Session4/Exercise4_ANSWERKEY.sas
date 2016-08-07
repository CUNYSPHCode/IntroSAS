*Code for Exercise 4;

*make a new temporary data set that is limited to males;
data males;
set ref.classds;
where gender =1;
run;

*check contents of new data set;
proc contents data = males;
run;

Title1 "Results Table Marcel Ramos";

*create formats for race and borough;
proc format;

value frace
1= '1 = Hispanic'
2= '2 = white'
3= '3 = black'
4= '4 = Asian'
5= '5 = other'
99= '99 = unknown';

value fborough
1 = '1 = Bronx'
2= '2 = Brooklyn'
3= '3 = Manhattan'
4= '4 = Queens'
5= '5 = Staten Island'
99= '99 = unknown'
;
run;

*Send output to Excel via ODS;
ods html file= 'C:\Users\User\Desktop\SAS\Exercises\mytable.xls'; *change path to be where you want Excel file to show up;

ods no results; *suppress "results" text in Excel;

proc freq data = males;
tables race * borough;
format race frace. borough fborough.;
run;

ods html close;

*Reopen SAS ODS; 
ods HTML; 

ods html;  * reopen the ODS HTML window;

