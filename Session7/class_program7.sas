libname lion "S:\github\IntroSAS\datasets"; 

/* load formats by running formats_chs2011_public.sas*/
%include "S:\github\IntroSAS\datasets\formats_chs2011_public.sas";

data chs;
set lion.chs2011_public; 
/* apply formats with formatstatements_chs2011_public.sas*/
%include "S:\github\IntroSAS\datasets\formatstatements_chs2011_public.sas";
run;

/*use formats catalog with options fmtsearch*/
options fmtsearch = (work lion.classfmts); 

options fmtsearch = (lion.classfmts work); 

/*Session 7*/
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

proc print data = dataset1; run;
proc print data = dataset2; run;

data newdataset; 
  set dataset1 dataset2;
run; 

proc print data = newdataset; run;

data dataset3;
input id var2 $ var3;
datalines; 
2 C 98
3 Y 62
;
run; 

data newdata2; 
set dataset1 dataset3; 
run; 

proc print data = newdata2; run; 

proc sort data = dataset1; 
by id; 
run;
proc sort data = dataset3; 
by id; 
run;

data newdata3; 
 merge dataset1 dataset3;
 by id; 
run; 

proc print data = newdata3; run;

proc print data = dataset1; run;
proc print data = dataset2; run;
proc print data = dataset3; run;

proc sort data = dataset2; 
  by id; 
run; 

data newdata4; 
 merge dataset1 dataset2 dataset3;
 by id; 
run; 

proc print data = newdata4; run; 


data newdata5; 
set dataset1 dataset2 dataset3;
run; 

proc print data = newdata5; run;

proc sort data = newdata5 nodupkey dupout = new_dups; 
by id; 
run; 

data newdata6; 
set dataset1 dataset2 dataset3;
run; 

proc sort data = newdata6 nodup dupout = new_dups; 
by id; 
run; 

proc print data = new_dups; run; 

proc print data = newdata5; run; 

proc print data = newdata6; run; 


data dataset4;
input id var2 var3;
datalines; 
2 77 98
3 77 62
;
run; 

proc print data = dataset1;  run; 
proc print data = dataset4;  run; 

proc sort data = dataset4; by id; run;

data dataset5; 
  merge dataset1 dataset4; 
  by id; 
run;

data dataset52; 
  merge dataset1 dataset4 (rename = (var2 = numvar2)); 
  by id; 
run;

proc print data= dataset52; run;

data dataset5; 
set dataset1 dataset4; 
run; 

data example1; 
set lion.classds; 
run; 

proc contents data = example1; run;

data example1; 
set example1; 
zip_char = put(zip, 8.); 
run; 

proc freq data = example1; 
table zip_char; run; 

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

proc print data = tastetest; run;

proc transpose data = tastetest out = coffeeratings; 
run; 

proc print data = coffeeratings; run;

libname datafold 'S:\github\IntroSAS\datasets';

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
Eagle Lake  2JUN95 32 .35 32 .25 33 .30
Cole Pond   4AUG95 29 .23 30 .25 34 .47 32 .3
Eagle Lake  3JUL95 30 .20 36 .45
Cole Pond   3JUL95 33 .32 34 .41 37 .48 32 .28
Eagle Lake  4AUG95 33 .30 33 .28 34 .42
;
run; 

proc print data = fishdata; run; 

proc sort data = fishdata; 
  by location date; 
run;

proc transpose data=fishdata out=fishlength(rename=(col1=Measurement));
   var length1-length4;
   by location date;
run;

proc print data = fishlength; run;

proc print data=fishlength noobs;
   title 'Fish Length Data for Each Location and Date';
run;


data zip;
input State $ City $ ZipCode Street $20-29;
datalines;
FL Miami     33133 Rice St	
FL Miami     33133 Thomas Ave
FL Miami     33133 Surrey Dr
FL Miami     33133 Trade Ave
FL Miami     33146 Nervia St
FL Miami     33146 Corsica St
FL Lakeland  33801 French Ave
FL Lakeland  33809 Egret Dr
AZ Tucson    85730 Domenic Ln
AZ Tucson    85730 Gleeson Pl
;

proc sort data=zip;
by State City ZipCode;
run;


data zip2;
   set zip;
   by State City ZipCode;
   put _n_= City State ZipCode 
   first.city= last.city= 
   first.state= last.state= 
   first.ZipCode= last.ZipCode= ;
run; 

