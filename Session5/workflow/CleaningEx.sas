libname dats "/folders/myshortcuts/IntroSAS/datasets";

DATA work.tempcars; 
  SET SASHELP.CARS;
RUN;

/* DATA dats.tempcars;  */
/*   SET SASHELP.CARS; */
/*   WHERE cylinders in (4, 6, 8); */
/* RUN; */


PROC PRINT DATA = tempcars (obs = 10); 
RUN;

PROC CONTENTS data = tempcars; 
RUN;

PROC FREQ DATA = tempcars; 
table cylinders; 
RUN; 

DATA cars; 
SET tempcars;
WHERE cylinders in (4, 6, 8);
RUN; 

DATA dats.cars;
  SET WORK.cars;
RUN;








