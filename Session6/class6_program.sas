libname lion 'E:\GitHub\IntroSAS\datasets'; 
run; 

/* read a CSV file in */
proc import datafile = 'E:\GitHub\IntroSAS\datasets\femaleMiceWeights.csv'
out = work.miceweights
DBMS = CSV replace; run; 

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
data exampleData; 
infile datalines; 
input diet $ bodyweight;  
datalines; 
chow 3.2
cHOw 3.3
hf   3.4
hF   3.8
; run; 

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
proc import datafile = "E:\GitHub\IntroSAS\datasets\SampleData.xlsx"
out = work.sampledata
DBMS = xlsx replace; 
sheet = "Partners"; run; 

proc contents data = sampledata; run; 

proc print data = sampledata; run; 

/* read data without formats */
option nofmterr; 

/* read in chs data */
data temp; 
set lion.chs2011_public; 
run; 

proc contents data = temp; run; 

proc tabulate data = temp; 
class agegroup sex; 
var bmi; 
table agegroup, bmi*sex*mean; run;  

