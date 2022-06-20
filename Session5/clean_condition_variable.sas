LIBNAME lion "Z:\IntroSAS\data";

PROC FREQ DATA = lion.classds;
table condition;
RUN;

DATA work.classds;
SET lion.classds;
clean_cond = lowcase(condition);
IF clean_cond = "unk" then clean_cond = "unknown";
clean_cond = tranwrd(clean_cond, "athsma", "asthma");
clean_cond = tranwrd(clean_cond, "asth.", "asthma");
IF clean_cond = "diab" then clean_cond = "diabetes";
RUN;

PROC FREQ DATA = classds;
table clean_cond;
RUN;
