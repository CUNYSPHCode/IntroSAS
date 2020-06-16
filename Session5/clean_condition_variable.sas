LIBNAME dats "/folders/myshortcuts/IntroSAS/datasets";

DATA work.classds;
SET DATS.classds; 
RUN;

PROC FREQ DATA = classds; 
table condition; 
RUN;

DATA classds; 
SET classds;
clean_cond = lowcase(condition);
RUN;

PROC FREQ DATA = classds; 
table clean_cond; 
RUN;

DATA classds; 
SET classds;
clean_cond = lowcase(condition);
IF clean_cond = "unk" then clean_cond = "unknown";
clean_cond = tranwrd(clean_cond, "athsma", "asthma");
clean_cond = tranwrd(clean_cond, "asth.", "asthma");
IF clean_cond = "diab" then clean_cond = "diabetes";                                                                                                    
RUN;

PROC FREQ DATA = classds; 
table clean_cond; 
RUN;