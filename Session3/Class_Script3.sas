/* libname duck "S:\github\IntroSAS\datasets"; */
libname duck "/folders/myshortcuts/SASUniversityEdition/IntroSAS/datasets";

DATA work.newdata;
  SET duck.classds;
RUN;

/* writing a permanent dataset */
/* Your WANT will change to a permanent location */

DATA duck.newMales;
  SET work.newdata;
  WHERE males = 1; 
RUN;

PROC PRINT data = newdata (obs = 10);
RUN;

/*Add arbitrary dataset using datalines*/
DATA person;
   input name $ dept $;
   datalines;
John Sales
Mary Acctng
Jane Sales
;
PROC CONTENTS DATA = person;
RUN;

/*Add example mice dataset*/
DATA mice;
  input bwt gestation parity;
  label bwt = "bodyweight";
  datalines;
120 284 0.42
113 282 0.43
128 279 0.44
;
PROC CONTENTS DATA = mice;
RUN;

/*Set a label for the bwt variable*/
DATA mice;
SET mice;
label bwt = "mice bodyweight in grams";
RUN;

/*Print with a custom label*/
PROC PRINT Data = mice label;
var parity;
label parity = "number of mice";
RUN;

PROC CONTENTS DATA = mice; RUN;

/*rename the bwt variable to bodyweight*/
DATA mice (rename=(bwt = bodyweight));
SET mice;
RUN;


/*modify the parity variable in a new one*/
DATA mice;
SET mice;
nparity = parity+1;
RUN;

PROC PRINT DATA = mice (OBS = 10);
RUN;

PROC PRINT DATA=newdata (OBS = 10);
var sexchar;
RUN;

PROC CONTENTS DATA = newdata;
RUN;

title1 'Mice dataset SAS example';
title2 'Summer 2018';
footnote 'Total N = 3';
PROC PRINT data = mice noobs n;
RUN;

title2;

/*set multiple attributes at once*/
DATA mice;
SET mice;
attrib parity label = "n mice"
bodyweight label = "mice bodyweight in grams";
RUN;

PROC PRINT DATA = mice label;
RUN;

title1;
PROC PRINT DATA = mice noobs double;
RUN;

PROC PRINT DATA=newdata noobs label;
var uniqueid surveydate;
label surveydate='DateofSurvey(char)';
RUN;

PROC CONTENTS DATA=newdata;
RUN;

DATA newdata2 (rename=(gender=newgender));
* renaming a variable from another dataset;
SET duck.classds;
RUN;

PROC CONTENTS DATA=newdata2;
RUN;

DATA newdata2;
SET duck.classds (rename=(gender=oldgender)); *renaming a variable;
RUN;

PROC PRINT DATA=newdata2 noobs double label n;
id uniqueid;
RUN;

*don't forget to put data in your proc statements!;

/*make a temporary dataset*/

title1 'Introduction to SAS';*globalstatementsremainineffectuntilyouchangeitorclosesas;
title2 'select variables from class dataset';
Footnote1 'Draft for distribution';
Footnote2 'Copyright not reserved';
proc print data=newdata2 (obs=20) label double n;
	var fakedob oldgender race;
	id uniqueid;
run;

/*Note that using obs together with noobs*/
/* options will give you an error*/
PROC PRINT data=newdata2 noobs (obs=20) label double n;
	var fakedob oldgender race;
	id uniqueid;
RUN;
/*Also, note that using n with obs*/
/*will limit n to the number of obs*/


title1 'Input Statement in DATA step';
title2 'A working example';
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

Title1 "Example data air";
proc print data = sashelp.air (obs = 10); run;

Title1;
proc print data = sashelp.baseball (obs= 10); run;

Title1 "Jane's great output";
Title2 'Proc Print';
Title3 'Run';
proc print data = sashelp.baseball (obs= 10); run;


Title1 "Jane's great output";
Title2;
/*Title2 'Proc Print'; */
/*Title3 'Run';*/
proc print data = sashelp.baseball (obs= 10); run;

LIBNAME lion "S:\github\IntroSAS\datasets";

/*Creating an empty dataset (use set statement)*/
data work.mytemp;
run;

data work.mytemp;
	set lion.classds;
run;

/*Run data steps keeping intermediate datasets*/
data work.males;
	set lion.classds;
	where gender = 1;
run;

data work.males1 (rename= (gender = sex));
	set work.males;
run;

data males2;
set males1;
run;

/*alternatively combine steps into one data step*/
data work.males (rename = (gender = sex));
	set lion.classds;
	where gender = 1;
run;

/*ERROR below*/
data work.males ;
/*	rename occurs before processing*/
	set lion.classds (rename = (gender = sex));
	where gender = 1;
/*	ERROR: Variable gender is not on file LION.CLASSDS.*/
run;

/*	rename occurs after processing*/
data work.males (rename = (gender = sex));
	set lion.classds ;
	where gender = 1;
run;

proc contents data = males; run;

