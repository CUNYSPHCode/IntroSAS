data dataset1;
input id var1 $ var2 $;
datalines; 
1 A B
2 W X
;
run; 

data dataset2;
input id var2 $ var3;
datalines; 
3 C 98
4 Y 62
;
run; 


data newdataset; 
set dataset1 dataset2; run; 

proc print data = newdataset; run;



data tastetest; 
input Tester1    @12 Tester2    @22 Tester3  @32 Tester4;
datalines; 
22         25         21         21  
15         19         18         17  
17         19         19         19  
20         19         16         19  
14         15         13         13  
15         17         18         19  
10         11          9         10  
22         24         23         21  
;
run; 

proc transpose data = tastetest out = coffeeratings; 
run; 

proc print data = coffeeratings; run;

libname datafold 'F:\GitHub\IntroSAS\datasets';

data baseball; 
set datafold.transposedata; 
run; 

proc print data = baseball; run; 

proc sort data = baseball;
by team player; run; 


proc transpose data = baseball out = flipped; 
by team player; 
id type; 
var Entry; 
run; 

proc print data = flipped; run;

proc print data = tastetest; run;  

/*Complicated Example*/
data fishdata;
   infile datalines missover;
   input Location & $10. Date date7.
         Length1 Weight1 Length2 Weight2 Length3 Weight3
         Length4 Weight4;
   format date date7.;
   datalines;
Cole Pond   2JUN95 31 .25 32 .3  32 .25 33 .3
Cole Pond   3JUL95 33 .32 34 .41 37 .48 32 .28
Cole Pond   4AUG95 29 .23 30 .25 34 .47 32 .3
Eagle Lake  2JUN95 32 .35 32 .25 33 .30
Eagle Lake  3JUL95 30 .20 36 .45
Eagle Lake  4AUG95 33 .30 33 .28 34 .42
;
proc transpose data=fishdata
     out=fishlength(rename=(col1=Measurement));
   var length1-length4;
   by location date;
run;
proc print data=fishlength noobs;
   title 'Fish Length Data for Each Location and Date';
run;
