libname duck "S:\github\IntroSAS\datasets";
run;

data newdata;
set duck.classds;
length sexchar $5;
if gender=1 then sexchar='male';
else if gender=2 then sexchar='female';
label sexchar='Sex';
run;

proc print data = newdata; run; 

/*Add arbitrary dataset using datalines*/
data person;
   input name $ dept $;
   datalines;
John Sales
Mary Acctng
Jane Sales
;

/*Add example mice dataset*/
data mice; 
  input bwt gestation parity;
  label bwt = "bodyweight";
  datalines; 
120 284 0.42
113 282 0.43
128 279 0.44
;

/*Set a label for the bwt variable*/
data mice; 
set mice; 
label bwt = "mice bodyweight in grams";
run; 

/*Print with a custom label*/
proc print data = mice label;
var parity;
label parity = "number of mice"; 
run; 

proc contents data = mice; run; 

/*rename the bwt variable to bodyweight*/
data mice (rename=(bwt = bodyweight));
set mice;
run; 


/*modify the parity variable in a new one*/
data mice;
set mice;
nparity = parity+1; 
run; 

proc print data = mice (OBS = 10); run; 

proc print data=newdata (OBS = 10);
var sexchar;
run;

proc contents data = newdata; 
run; 

title1 'Mice dataset SAS example'; 
title2 'Summer 2018'; 
footnote 'Total N = 3'; 
proc print data = mice noobs n; 
run; 

title2;

/*set multiple attributes at once*/
data mice; 
set mice; 
attrib parity label = "n mice"
bodyweight label = "mice bodyweight in grams";
run; 

proc print data = mice; run; 

title1; 
proc print data = mice noobs double; run; 

proc print data=newdata noobs label;
var uniqueid surveydate;
label surveydate='DateofSurvey(char)';
run;

proc contents data=newdata;
run;

data newdata2 (rename=(gender=newgender));
* renaming a variable from another dataset;
set duck.classds;
run;

proc contents data=newdata2;
run;

data newdata2;
set duck.classds (rename=(gender=oldgender)); *renaming a variable;
run;

proc print data=newdata2 noobs double label n;
id uniqueid;
run;

*don't forget to put data in your proc statements!;

/*make a temporary dataset*/

title1 'IntroductiontoSAS';*globalstatementsremainineffectuntilyouchangeitorclosesas;
title2 'selectvariablesfromclassdataset';
Footnote1 'Draftfordistribution';
Footnote2 'Copyrightnotreserved';
proc print data=newdata2 (obs=20) label double n;
	var fakedob oldgender race;
	id uniqueid;
run;

/*Note that using obs together with noobs*/
/* options will give you an error*/
proc print data=newdata2 noobs (obs=20) label double n;
	var fakedob oldgender race;
	id uniqueid;
run;
/*Also, note that using n with obs*/
/*will limit n to the number of obs*/


title1 'InputStatementinDATAstep';
title2 'Aworkingexample';
data total_sales;
input Date mmddyy10.+2 Amount comma5.;
cards;
09/05/2000  1,382
10/19/2000  1,235
11/30/2000  2,391
12/19/2011  3,321
;

/*Here we set a blank title*/

title1;

proc contents data=total_sales; run;

proc print data=total_sales; run;

