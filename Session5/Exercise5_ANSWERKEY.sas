libname duck "E:/SAS/"; 
run; 

data females; 
set duck.classds; 
where gender = 2; 
newID = catx ('.', pob, uniqueid);
newID2 = compress(newID); 
run; 

proc print data = females (obs = 10); 
var newID; 
run; 

proc sort data = females; 
by condition; 
run; 

proc means data = females n min max range mean stddev missing maxdec=3; 
var age; 
by condition; 
run; 

