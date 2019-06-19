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
table diet diet2; run; 


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
out = work.sales
DBMS = xlsx replace; 
Range = "SalesOrders$A1:F15"; run; 

proc contents data = sampledata; run; 
proc contents data = sales; run; 

proc print data = sampledata; run; 
proc print data = sales;
format OrderDate date7.; 
run; 

PROC CONTENTS data = sashelp.class; run; 

proc freq data = sashelp.class; 
table sex; run; 

proc export data = sashelp.class (where = (sex = "F"))
  outfile = "S:\github\IntroSAS\datasets\FemaleList.csv"
  DBMS = csv REPLACE; 
run; 

/* From https://www.popcenter.umd.edu/resources/research-tools/stats-support/sas-frequently-used-code-revised/to-convert-sas-xport-file-to-sas-data-file */
/********************************************************************
* to convert SAS XPORT file to SAS data file.sas
********************************************************************/

*Proc copy only can read a SAS XPORT file that made with Proc copy and can't read files that made with Proc cport;
*Proc cimport only can read a SAS XPORT file that made with Proc cport and can't read files that made with Proc copy;

* create sample data;
libname sasfile "c:\Users\mramos\Downloads";
data sasfile.test;
input a b c;
datalines;
1 26 31
1 28 28
1 30 31
2 32 31
2 34 29
;

/***********************************************************************************************
Proc Copy / Proc Copy;
***********************************************************************************************/
* create a XPORT file from a SAS dataset using Proc Copy;

libname sasfile "c:\Users\mramos\Downloads";  *this is where the SAS data set reside;
libname xptfile xport "c:\Users\mramos\Downloads\test.xpt";  *this is where the XPORT file will be created;
proc copy in=sasfile out=xptfile memtype=data;
	select test;
run;

*convert the XPORT file back to a SAS dataset using proc step;
libname xptfile xport "c:\Users\mramos\Downloads\test.xpt";
libname sasfile2 "c:\Users\mramos\Downloads\";
proc copy in=xptfile out=sasfile2 memtype=data;
run;

*convert the XPORT file back to a sas dataset using data step;
 libname in xport "c:\Users\mramos\Downloads\test.xpt" /*directory path where file is located/SAS export file nam*/;
data wave1;
set in.test;
run;

/******/


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
