libname classone "/home/u39524524/sasuser.v94/Data";

DATA work.males;
  SET classone.classds;
  where gender = 1; 
RUN;

/* Distinguish between all the data movements */
/* work to perm, perm to work, work to work, and  */
/* perm to perm */

/* create newmales permanent dataset */
DATA classone.newmales;
  SET work.males; 
RUN;

/* typical import procedure */
DATA work.classds;
  SET classone.classds; 
RUN;

/* copy and rename temporary dataset */
DATA work.newmales;
  SET work.males; 
RUN;

/* copy and rename permanent dataset */
DATA classone.newclassds;
  SET classone.classds; 
RUN;


/* ERRORS */

/* No SET statement */
DATA work.newmales;
RUN;

/* Race variable is not initalized */
DATA distance;
  miles = 22.06;
  if race = 1 then ethnicity = "Hispanic"; 
RUN;





/* Create an arbitrary dataset using datalines*/
DATA work.person;
   input name $ dept $;
   datalines;
John Sales
Mary Acctng
Jane Sales
;
PROC CONTENTS DATA = person;
RUN;

/*Add example mice dataset*/
DATA work.mice;
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

DATA work.mice; 
SET work.mice;
/* rename bwt to bodyweight */
bodyweight = bwt; 
RUN;



/*modify the parity variable in a new one*/
DATA mice;
SET mice;
  nparity = parity + 1;
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
PROC PRINT DATA = mice noobs n;
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

PROC PRINT DATA=newDATA noobs label;
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
PROC PRINT DATA=newdata2 (obs=20) label double n;
    var fakedob oldgender race;
    id uniqueid;
RUN;

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
DATA total_sales;
input Date mmddyy10.+2 Amount comma5.;
cards;
09/05/2000  1,382
10/19/2000  1,235
11/30/2000  2,391
12/19/2011  3,321
;

/*Here we set a blank title*/

title1;

PROC CONTENTS data=total_sales; RUN;

PROC PRINT DATA=total_sales; RUN;

Title1 "Example data air";
PROC PRINT DATA = sashelp.air (obs = 10); RUN;

Title1;
PROC PRINT DATA = sashelp.baseball (obs= 10); RUN;

Title1 "Jane's great output";
Title2 'Proc Print';
Title3 'Run';
PROC PRINT DATA = sashelp.baseball (obs= 10); RUN;


Title1 "Jane's great output";
Title2;
/*Title2 'Proc Print'; */
/*Title3 'Run';*/
PROC PRINT DATA = sashelp.baseball (obs= 10); RUN;

LIBNAME lion "S:\github\IntroSAS\datasets";

/*Creating an empty dataset (use set statement)*/
DATA work.mytemp;
RUN;

DATA work.mytemp;
    SET lion.classds;
RUN;

/*Run data steps keeping intermediate datasets*/
DATA work.males;
    SET lion.classds;
    WHERE gender = 1;
RUN;

DATA work.males1 (rename= (gender = sex));
    SET work.males;
RUN;

DATA males2;
SET males1;
RUN;

/*alternatively combine steps into one data step*/
DATA work.males (rename = (gender = sex));
    SET lion.classds;
    WHERE gender = 1;
RUN;

/*ERROR below*/
DATA work.males ;
/*  rename occurs before processing*/
    SET lion.classds (rename = (gender = sex));
    WHERE gender = 1;
/*  ERROR: Variable gender is not on file LION.CLASSDS.*/
RUN;

/*  rename occurs after processing*/
DATA work.males (rename = (gender = sex));
    SET lion.classds ;
    WHERE gender = 1;
RUN;

PROC CONTENTS DATA = males; RUN;


/* Check the length of the variable in characters */
PROC CONTENTS DATA = work.males;
RUN;

/* Rename occurs towards the end of all operations */
DATA work.males (rename = (race = newrace));
  SET lion.classds;
/*   Should we also keep ethnicity? Yes */
  KEEP gender race age borough;
  WHERE gender = 1;
  LENGTH ethnicity VARCHAR(12);
  
  IF race = 1 then ethnicity = "Hispanic";
  ELSE IF race = 2 then ethnicity = "White";
  ELSE IF race = 3 then ethnicity = "Black";
/*   Is sex included in the final dataset? */
  sex = gender; 
RUN; 







