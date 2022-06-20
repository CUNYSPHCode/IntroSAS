LIBNAME lion 'S:\github\IntroSAS\datasets';

PROC SORT DATA = lion.classds;
by fakedob; run;

PROC PRINT DATA= lion.classds;
var fakedob; run;

PROC MEANS DATA = lion.classds;
var age; run ;

PROC MEANS DATA = lion.classds range N mean max min mode maxdec=3;
var age; run ;

PROC freq DATA = lion.classds; table borough; run;

DATA tempdata;
set lion.classds;
if borough = 99 then borough = .;
if gender = 99 then gender = .; run;

PROC freq DATA = tempdata; table borough; run;

PROC SORT DATA = tempdata;
by borough descending gender; run;

PROC MEANS DATA = tempdata;
var age;
by borough; run;

PROC CONTENTS DATA = tempdata; run;

PROC freq DATA = tempdata; table gender; run ;

PROC SORT DATA = tempdata;
by gender; run;

PROC MEANS DATA = tempdata;
var age;
by gender; run ;

DATA newdata;
set tempdata;
avg_age = mean(age);
day_var = day(fakedob);
run;

PROC PRINT DATA = newdata (obs = 20); run;

PROC PRINT DATA = newdata (obs = 20);
var age avg_age; run;

DATA todaydata;
today = today();
yesterday = today() - 1; run;

PROC PRINT DATA = todaydata;
RUN;

PROC PRINT DATA = todaydata;
var today yesterday;
format today yesterday date10.;
run;

PROC PRINT DATA = todaydata;
var today yesterday;
format today yesterday DDMMYY.;
RUN;


DATA intck_practice;
days_since = intck('days', '01jan07'd, '31jan07'd);
months_since = intck('month', '01jan07'd, '02feb07'd);
run;

PROC PRINT DATA = intck_practice noobs;
run ;

Data newdata;
set tempdata;
age_calc = int(intck('month', fakedob, '06aug13'd)/12);
age_year = intck("year", fakedob, '06Aug19'd);
age_today = intck("year", fakedob, today());
run;

PROC PRINT DATA = newdata (obs = 10);
  var age_calc age_year age_today fakedob;
run;


DATA WORK.practice;
A = 'goldfish';
B = 'iguana';
pets= CAT(A, B);
pets2 = CATX(" & ", A, B);
pets3 = compress(pets2);
run;

PROC PRINT DATA = practice;
RUN;


/*Example dataset using generated data*/

DATA chefnames;
infile datalines;
input first $ last $20.;
datalines;
Alex Guarnaschelli
Marcus Samuelsson
Eric Ripert
Giada De Laurentis
;

PROC CONTENTS DATA = chefnames; run;

PROC PRINT DATA = chefnames; run;

/*combine names into a particular layout (last, first)*/
DATA chefnames;
set chefnames;
lastfirst = catx(", ", last, first);
complastfirst = compress(lastfirst, ", ");
RUN;

PROC PRINT DATA = chefnames;
run;

/* converting type */
DATA classtemp;
SET lion.CLASSDS;
newboro = INPUT(boro_char, 5.);
zip_char = PUT(zip, 8.);
RUN;

PROC CONTENTS DATA = classtemp;
RUN;

PROC PRINT DATA = classtemp (obs = 10);
VAR boro_char newboro;
RUN;

PROC PRINT DATA = classtemp (obs = 10);
VAR zip zip_char;
RUN;







