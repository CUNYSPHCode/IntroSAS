libname lion 'F:\datasets'; 
run; 

proc import datafile = 'F:\datasets\femaleMiceWeights.csv'
out = work.miceweights
DBMS = CSV replace; run; 

proc contents data = miceweights; run; 

proc print data = miceweights (obs = 20); run; 

proc import datafile = "F:\datasets\SampleData.xlsx"
out = work.sampledata
DBMS = xlsx replace; 
sheet = "Partners"; run; 

proc contents data = sampledata; run; 

proc print data = sampledata; run; 
