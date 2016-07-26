libname duck "E:/SAS"; 
run;

data newdata; 
set duck.classds; 
length genderword $6; 
if gender =1 then genderword = 'male'; 
else if gender = 2 then genderword = 'female';
label genderword = 'Gender'; 
run; 

proc print data = newdata noobs; 
var genderword; 
run;

proc print data = newdata noobs label;
var uniqueid surveydate; 
label surveydate = 'Date of Survey (char)';
run;

data newdata2 rename=(gender=newgender)); *renaming a variable from another dataset;
set duck.classds;
run;

proc contents data = newdata2; 
run;

data newdata2; 
set duck.classds (rename=(gender = oldgender)); *renaming a variable;
run;

proc print data = newdata2 noobs double label n;
id uniqueid; 
run;

*don't forget to put data in your proc statements! ; 

/*make a temporary dataset*/

title1 'Introduction to SAS'; *global statements remain in effect until you change it or close sas;
title2 'select variables from class data set';
Footnote1 'Draft not for distribution';
proc print data = newdata2 noobs label double n;
	var fakedob oldgender race;
	id uniqueid;
run;

title1 'New title'; 

