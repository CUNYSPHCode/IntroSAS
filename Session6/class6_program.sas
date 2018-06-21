libname lion 'S:\github\IntroSAS\datasets'; 
run; 

/* read a CSV file in */
proc import datafile = "S:\github\IntroSAS\datasets\femaleMiceWeights.csv"
   out = work.miceweights 
   DBMS = CSV replace;
run;

proc contents data = miceweights; run; 

proc print data = miceweights (obs = 20); run; 

/* Sort data by a character variable (default alphabetical ordering) */
proc sort data = miceweights; 
by diet; run; 

proc print data = miceweights (obs = 20); run; 

/* means by character variable */
proc means data = miceweights ;
var bodyweight; 
by diet; run; 

/* Example dataset with character variable with typos and different case */
DATA exampleData; 
infile datalines; 
input diet $ bodyweight;  
datalines; 
chow 3.2
cHOw 3.3
hf   3.4
hF   3.8
;
run; 

data exampledata; 
set exampledata; 
diet2 = lowcase(diet); 
run; 

proc freq data = exampleData; 
table diet2; run; 


proc contents data = exampledata; run; 

proc sort data = exampledata; 
by diet; run; 

/* means by this character variable will yield 4 different categories instead of 2 */
proc means data = exampledata; 
var bodyweight; 
by diet; run; 

/* Standardize case of character variable */
data example2; 
set exampledata; 
diet2 = lowcase(diet); run; 

proc print data = example2; run; 

proc freq data = example2; 
table diet2; run; 


/* Example Import of excel file */
proc import datafile = "S:\github\IntroSAS\datasets\SampleData.xlsx"
out = work.sampledata
DBMS = xlsx replace; 
sheet = "Partners"; run; 

proc import datafile = "S:\github\IntroSAS\datasets\SampleData.xlsx"
out = work.sampledata
DBMS = xlsx replace; 
Range = "SalesOrders$A1:F15"; run; 

proc contents data = sampledata; run; 

proc print data = sampledata; run; 

PROC CONTENTS data = sashelp.class; run; 

proc freq data = sashelp.class; 
table sex; run; 

proc export data = sashelp.class (where = (sex = "F"))
  outfile = "S:\github\IntroSAS\datasets\FemaleList.csv"
  DBMS = csv REPLACE; 
run; 

/* read data without formats */
option nofmterr;

/* read in chs data */
data temp; 
  set lion.chs2011_public; 
run; 

proc contents data = temp; run; 

proc tabulate data = temp; 
var bmi;
table bmi; 
run; 

proc freq data = temp; 
  table agegroup borough;
run; 

proc tabulate data = temp;
class agegroup;
var bmi;
table agegroup, bmi*mean; 
run;


proc tabulate data = temp;
class agegroup borough;
var bmi;
table borough, agegroup, bmi*mean; 
run;

proc tabulate data = temp format = 8.2;
class agegroup borough;
var bmi;
table borough* agegroup, bmi*mean; 
run;


proc tabulate data = temp; 
class agegroup sex; 
var bmi; 
table agegroup, bmi*sex*mean;
run;
