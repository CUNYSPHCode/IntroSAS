/* CHS 2011 PUBLIC USE DATASET FORMAT STATEMENTS     */

format	insuredgateway11 insured pcp11 didntgetcare11  
		toldhighbp11 toldprescription11 takingmeds11 takingbpmedsall11 toldhighcholesterol11 
 		toldcholprescription takingcholmeds11 toldtakecholmeds 
		diabetes11
		everasthma currentasthma11
		nspd12m mhimpair_social mhimpair_home mhhomeless mharrested mhjail mhsocservices
		ssb 
		exercise11 stairsup11
		triedtoquit smokelastyr11 smokelt12m effectsmokeless11 usenicotineaid11 userxaid11 asksmoke advisequitsmoke 
		fluvaccineshot fluvaccineshot1011 
		evercolon11 
		earsring hearingloss hearingaid everloudnoisework currentloudnoisework 
		usefirearm keepfirearm lockfirearm
		bedbugs exterminatebedbugs
		hiv12months11 everhivtest11 recommendedhivtest11
		condom11 wsw wswexclusive msm msmexclusive sexuallyactive11 condomusetrend analsex internetsex pcpsexhistory
		drinker heavydrink11 binge11 bingenew pcptalkalcohol11 smipy
		yesno. 

/* Administrative */
        strata strataf.

/* Health Status */
		generalhealth health.

/*Access */
		insure11 acs07f.
		physical physical.
		sickadvice11 rsoc11f.
		appointmentwait apptwait.
        insure5 ins05f.

/* Diabetes */
	   ageatdiabetes agediab.

/* Mental Health    */
	   mhimpair_work mhworkimp.
	   counselingmh medsmh timingmh.
       mhedvisit mhinpatient timesmh.
       mhnummove timesmove.
	   mhincontactfriends11 mhtalktofriends11 mhhelpfromfriends11 numfrnd.
	   mhsocisolation isolate.
       mood27 mood28 mood29 mood30 mood31 mood32 mood.
	   pastyrmht mhtxpyf.

/* Nutrition */
		fruitveg fruitveg.
		avgsodaperday11 avgsugarperday11 avgsodasugarperday11  ndrinks.  
		twoplussoda ndrnkcat.
		lowsodfoodall freqsbuy.
		lowsodiumfood11 freqs07f.
		reducesalt redsaltf.

/* Physical Activity */
		cycling11 bicycle9f.
   		howmanystairsup11 howmanystairsupall11 howmanystairs.
		stairsupall11 stairs.
	
/* Demographics */
	   agegroup agegrp.
	   agegroup5 agegrp5f.
	   age25up age25up.
	   age40new age40new.
	   age45up age45up.
	   age50up age50up.
	   age18_64 age.
   	   age20up3 age20up3f.
	   demog25 dem25f.
	   demog128 dem128f.
	   sex sex.
	   demog55 dem55f.
	   newrace newrace.
	   countrybirth11 bthregion11 cntryNEW. 
	   usborn born.
	   howlonginus howlong.
	   athomelanguage11 athome.
	   maritalstatus11 marital.
	   sexualid sexual.
	   education educat.
	   demog17 dem17f.
	   children11 child.
	   employment11 employ07f. 
	   povertygroup poverty.
	   pov200 pov200f.
	   povgroup3 povgrp3f.
       newpovgrps newpovft.
	   weight11in5 weight5f.
	   weight11in4 weight.
	   weightall wt.
	   uhf34 uhf34f.
	   borough boro.
	   dphonew06 dpho.
	   neighpovgroup4_0711 neighpov4f.
	   
/* Tobacco, Smoking, Second Hand Smoke */
   	   smoker smoker. 
	   everyday some.
  	   cpd11a everydaycpda cpdcat. 
	   heavysmoker11a heavysmokerf.
	   smoke5 smoke5f.
	   recentquit recent.
	   successfulquit1 success.
	   homesmokerule hmsmkrul.

/* Cancer screening */
	   colonoscopy10yr11 colon.
	   wherecolonoscopy wherecolon.

/* Noise */
       heardifficult scaletime.
	   hearingtest heartest.
	   hearinglossall hearloss.
	   hearprotect earprotection.
	   trafficnoisedays trafficd.
	   trafficnoisehrs headphonehrs noisehrs.
       trafficnoisehrs_all headphonehrs_all noisehrsall.
	   headphonedays hpdays.

/* Sexual Behavior  */
	   sexpartner malesexpartner femalesexpartner partner.
	   sexbehav_active11 behave.
	   analsexcondomuse analsex.

/* Alcohol */
	   maxdrinkscat maxdrinkscat.
	   alcoholtype alctype.
;
run;
