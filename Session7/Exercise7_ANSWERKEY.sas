libname ref "E:\Windows\Documents\GitHub\IntroSAS\datasets"; run; 

proc contents data = ref.classds; 
run; 

data new1;
set ref.classds (keep = uniqueid age borough location pob 
uhf zip boro_char); 
run; 

proc contents data = new1; 
run; 

data new2; 
set ref.classds (keep = uniqueid condition dob_char fakedob 
gender race surveydate);
run; 

proc sort data = new1 nodups; 
by uniqueid; 
run;

proc sort data = new2 nodup; 
by uniqueid; 
run; 

data mynewdata; 
merge new1 new2; 
by uniqueid; 
run;

proc print data = mynewdata (obs = 10); 
run; 

proc contents data = mynewdata; 
run; 
