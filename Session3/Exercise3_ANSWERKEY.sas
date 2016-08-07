libname duck "E:/SAS/"; 
run;

data mydata; 
set duck.classds; 
run; 

title1 "SAS Exercise 3 Marcel Ramos";
title2 "Introduction to SAS"
footnote1 "Used with permission"; 

proc print data = mydata label noobs n;
var age fakedob race gender condition; 
id uniqueid; 
run; 

title2 ; 
footnote1 ;

