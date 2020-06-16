LIBNAME dats "/folders/myshortcuts/IntroSAS/datasets";

%include "/folders/myshortcuts/IntroSAS/Session5/CylFMT.sas"; 

DATA newcars;
  SET dats.cars; 
FORMAT cylinders cylf.; 
RUN; 

PROC SORT DATA = newcars; 
BY cylinders; 
RUN; 

PROC PRINT DATA = newcars (obs = 10); 
RUN; 

PROC MEANS DATA = newcars; 
VAR HORSEPOWER; 
BY cylinders;
RUN; 


