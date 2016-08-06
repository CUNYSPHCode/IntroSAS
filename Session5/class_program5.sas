libname lion 'E:\GitHub\IntroSAS\datasets'; 

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
run; 

proc print data = newdata (obs = 20); run;

proc print data = newdata (obs = 20);
var age avg_age; run;  

data todaydata; 
today = today(); 
yesterday = today() - 1; run; 

proc print data = todaydata; 
var today yesterday; 
format today yesterday date10.; 
run; 

data intck_practice;
days_since = intck('days', '01jan07'd, '31jan07'd);
months_since = intck('month', '01jan07'd, '02feb07'd);
run;

proc print data = intck_practice noobs; 
run ;

Data newdata;
set tempdata;
age_calc = int(intck('month', fakedob, '06aug13'd)/12); 
run;

proc print data = newdata (obs = 20); 
var age_calc; run; 

data practice;
A = 'goldfish';
B = 'iguana';
pets= CAT(A, B);
pets2 = CATX(' ', A, B);
pets3 = compress(pets2);  
run;

proc print data = practice; 
var A B pets pets2 pets3; run; 
