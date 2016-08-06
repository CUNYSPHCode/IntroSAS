libname duck 'E:/SAS'; 
run;

proc print data = duck.classds (obs = 10); 
var race gender age borough;
run;

data males; 
set duck.classds (keep = gender race age borough); 
where gender = 1; 	
if race eq 1 then ethnicity = 'hispanic';
else if race eq 2 then ethnicity = 'white' ;
else if race eq 3 then ethnicity = 'black' ; 
else if race eq 4 then ethnicity = 'asian'; 
else if race eq 5 then ethnicity = 'other';
else if race eq 99 then ethnicity = 'unknown'; 
run; 

proc contents data = males;
run; 

data refs.males; 
set work.males; 
run; 

