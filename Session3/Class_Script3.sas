libnameduck"E:\GitHub\IntroSAS\datasets";
run;

datanewdata;
setduck.classds;
lengthgenderword$6;
ifgender=1thengenderword='male';
elseifgender=2thengenderword='female';
labelgenderword='Gender';
run;

procprintdata=newdata;
vargenderword;
run;

procprintdata=newdatanoobslabel;
varuniqueidsurveydate;
labelsurveydate='DateofSurvey(char)';
run;

proccontentsdata=newdata;
run;

datanewdata2(rename=(gender=newgender));*renamingavariablefromanotherdataset;
setduck.classds;
run;

proccontentsdata=newdata2;
run;

datanewdata2;
setduck.classds(rename=(gender=oldgender));*renamingavariable;
run;

procprintdata=newdata2noobsdoublelabeln;
iduniqueid;
run;

*don'tforgettoputdatainyourprocstatements!;

/*makeatemporarydataset*/

title1'IntroductiontoSAS';*globalstatementsremainineffectuntilyouchangeitorclosesas;
title2'selectvariablesfromclassdataset';
Footnote1'Draftfordistribution';
Footnote2'Copyrightnotreserved';
procprintdata=newdata2(obs=20)labeldoublen;
	varfakedoboldgenderrace;
	iduniqueid;
run;

/*Notethatusingobstogetherwithnoobs*/
/*optionswillgiveyouanerror*/
procprintdata=newdata2noobs(obs=20)labeldoublen;
	varfakedoboldgenderrace;
	iduniqueid;
run;
/*Also,notethatusingnwithobs*/
/*willlimitntothenumberofobs*/


title1'InputStatementinDATAstep';
title2'Aworkingexample';
datatotal_sales;
inputDatemmddyy10.+2Amountcomma5.;
cards;
09/05/20001,382
10/19/20001,235
11/30/20002,391
12/19/20113,321
;

/*Hereweresetthetitle*/

title1;
proccontentsdata=total_sales;run;

procprintdata=total_sales;run;
