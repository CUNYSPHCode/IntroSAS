LIBNAME dats "/folders/myshortcuts/IntroSAS/datasets";

PROC FORMAT library = dats.carformats;
VALUE cylf
 4 = "4 Cylinders"
 6 = "6 Cylinders"
 8 = "8 Cylinders"
 ;
RUN; 