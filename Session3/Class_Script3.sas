libname duck "E:\GitHub\IntroSAS\datasets";
run;

data newdata;
set duck.classds;
length genderword $6;
if gender=1 then genderword='male';
else if gender=2 then genderword='female';
label genderword='Gender';
run;

proc print data=newdata;
var genderword;
run;

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
input Datemmddyy10.+2 Amount comma5.;
cards;
09/05/2000  1,382
10/19/2000  1,235
11/30/2000  2,391
12/19/2011  3,321
;

/*Here were set the title*/

title1;
proc contents data=total_sales; run;

proc print data=total_sales; run;

