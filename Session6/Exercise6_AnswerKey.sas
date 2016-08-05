libname ref 'E:/SAS/';  
filename formatin 'E:/SAS/formatstatements_chs2011_public.sas';
%include          'E:/SAS/formats_chs2011_public.sas';

data chs11;
set ref.chs2011_public;
run;

proc contents data = chs11; 
run; 

ODS HTML PATH="E:\SAS\"
FILE = "Exercise6Table.xls";

PROC TABULATE DATA = chs11 format=8.1; 
class usborn agegroup sex; 
var bmi; 
tables usborn='Nativity - ', agegroup='', bmi*(sex='' all='Overall')*mean='' /box = 'Agegroup' ; 
run; 

ODS HTML CLOSE; 


