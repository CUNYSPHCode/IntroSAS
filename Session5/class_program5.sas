libname lion 'S:\github\IntroSAS\datasets'; 

proc sort data = lion.classds; 
by fakedob; run; 

proc print data = lion.classds; 
var fakedob; run; 

proc means data = lion.classds; 
var age; run ;

proc means data = lion.classds range N mean max min mode maxdec=3; 
var age; run ;

proc freq data = lion.classds; table borough; run; 

data tempdata; 
set lion.classds; 
if borough = 99 then borough = .;
if gender = 99 then gender = .; run; 

proc freq data = tempdata; table borough; run; 

proc sort data = tempdata; 
by borough descending gender; run; 

proc means data = tempdata; 
var age; 
by borough; run; 

proc contents data = tempdata; run; 

proc freq data = tempdata; table gender; run ;

proc sort data = tempdata; 
by gender; run; 

proc means data = tempdata; 
var age; 
by gender; run ;

data newdata; 
set tempdata; 
avg_age = mean(age); 
day_var = day(fakedob); 
run; 

proc print data = newdata (obs = 20); run;

proc print data = newdata (obs = 20);
var age avg_age; run;  

data todaydata; 
today = today(); 
yesterday = today() - 1; run; 

PROC PRINT data = todaydata;
RUN;

proc print data = todaydata; 
var today yesterday; 
format today yesterday date10.; 
run; 

PROC PRINT DATA = todaydata; 
var today yesterday; 
format today yesterday DDMMYY.; 
RUN;


data intck_practice;
days_since = intck('days', '01jan07'd, '31jan07'd);
months_since = intck('month', '01jan07'd, '02feb07'd);
run;

proc print data = intck_practice noobs; 
run ;

Data newdata;
set tempdata;
age_calc = int(intck('month', fakedob, '06aug13'd)/12); 
age_year = intck("year", fakedob, '06Aug19'd); 
age_today = intck("year", fakedob, today());
run;

proc print data = newdata (obs = 10);
  var age_calc age_year age_today fakedob; 
run; 


DATA WORK.practice;
A = 'goldfish';
B = 'iguana';
pets= CAT(A, B);
pets2 = CATX(" & ", A, B);
pets3 = compress(pets2);  
run;

PROC PRINT data = practice; 
RUN; 


/*Example dataset using generated data*/

data chefnames;
infile datalines; 
input first $ last $20.; 
datalines; 
Alex Guarnaschelli
Marcus Samuelsson
Eric Ripert
Giada De Laurentis
;

proc contents data = chefnames; run; 

proc print data = chefnames; run;

/*combine names into a particular layout (last, first)*/
data chefnames; 
set chefnames; 
lastfirst = catx(", ", last, first); 
complastfirst = compress(lastfirst, ", ");
RUN; 

proc print data = chefnames; 
run; 

/* converting type */
DATA classtemp; 
SET lion.CLASSDS;
newboro = INPUT(boro_char, 5.);
zip_char = PUT(zip, 8.);
RUN; 

PROC CONTENTS data = classtemp; 
RUN; 

PROC PRINT DATA = classtemp (obs = 10); 
VAR boro_char newboro; 
RUN;

PROC PRINT DATA = classtemp (obs = 10); 
VAR zip zip_char; 
RUN;







