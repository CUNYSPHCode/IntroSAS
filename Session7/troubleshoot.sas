* start with a libref;
LIBNAME mylibref "/home/u39524524/sasuser.v94/Data";

/* create a temporary dataset */
DATA mylibref.mynewdata;
  SET mylibref.cassds;
RUN;

/* list all variables */
PROC CONTENTS data = mynewdata;
TABLE race;
RUN;

/* create a table of race */
PROC FREQ data = mynewdata;
VAR race;
RUN;

/* format for boroughs */
PROC FORMAT
VALUE borof
 1 = "1: Bronx"
 2 = "2: Brooklyn"
 3 = "3: Manhattan"
 4 = "5: Queens"
 5 = "4: Staten Island"
 ;
RUN;

/* apply format to boroughs */
DATA work.mynewdata;
  SET work.mynewdata;

FORMAT boro borof;
RUN;

/* get a table for boroughs */
PROC FREQ data = mynewdata;
VAR borof;
RUN;
