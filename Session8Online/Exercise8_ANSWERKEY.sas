/* Exercise 8 */

libname ref "E:\Windows\Documents\GitHub\IntroSAS\datasets";  
filename formatin "E:\Windows\Documents\GitHub\IntroSAS\datasets\formatstatements_chs2011_public.sas";
%include          "E:\Windows\Documents\GitHub\IntroSAS\datasets\formats_chs2011_public.sas";
run;

data chs11;
set ref.chs2011_public;
run;

proc freq data= chs11; 
table mhincontactfriends11 /missing; 
run; 

data new; 
set chs11; 
array mhfriends (3) mhincontactfriends11 mhtalktofriends11 mhhelpfromfriends11; 
array newmhfriends (3) newcontactfriends11 newtalkfriends11 newhelpfriends11; 

do i = 1 to 3; 
	if 0 <= mhfriends(i) <= 2 then newmhfriends(i) = 1; 
	if mhfriends(i) >= 3 then newmhfriends(i) = 2; 
	if mhfriends(i) = .d then newmhfriends(i) = 3;
	if mhfriends(i) = .r then newmhfriends(i) = 4; 
end; 
run;


proc format;
value ffriends
1 = 'Less than 3'
2 = 'Three or More'
3 = 'Dont Know'
4 = 'Refused' ; 

proc freq data = new ; 
table newcontactfriends11 newtalkfriends11 newhelpfriends11; 
format newcontactfriends11 newtalkfriends11 newhelpfriends11 ffriends.;
run; 

%macro frequencies (var = ); 

proc freq data = new; 
tables &var*(agegroup sex borough newrace);
run; 

%mend frequencies; 

%frequencies(var = generalhealth); 
%frequencies(var = smoker); 
%frequencies(var = drinker); 


