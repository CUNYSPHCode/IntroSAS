/*********************************CHS  2010 **********/

proc format;

/* YES/NO */
	value yesno
		1 = 'Yes'
		2 = 'No';

/* ADMINISTRATIVE */
	value strataf 
	    1 = '101 Kingsbridge'
	    2 = '102 NE Bronx'		      
		3 = '103 Fordham-Bronx Pk'		  
		4 = '104 Pelham-Throgs Neck'		  
		5 = '105/106/107 South Bronx'		  
		6 = '201 Greenpoint'		  
		7 = '202 Downtown-Heights-Slope'		  
		8 = '203 Bed Stuy-Crown Heights'		  
		9 = '204 East New York'		  
	   10 = '205 Sunset Park'		  
	   11 = '206 Borough Park'		  
	   12 = '207 Flatbush'   		  
	   13 = '208 Canarsie' 		  
	   14 = '209 Bensonhurst' 		  
	   15 = '210 Coney Island'
	   16 = '211 Williamsburg-Bushwk'
	   17 = '301 Washington Heights'
	   18 = '302 Central Harlem'  	
	   19 = '303 East Harlem' 
       20 = '304 Upper West Side'
	   21 = '305/307 Upper East Side-Gramercy'
       22 = '306/308 Chelsea-Village'
	   23 = '309/310 Union Square-Lower Manhattan'
	   24 = '401 LIC, Astoria'
	   25 = '402 West Queens'
	   26 = '403 Flushing'
	   27 = '404/406 Bayside Little Neck-Fresh Meadows'
	   28 = '405 Ridgewood'
	   29 = '407 SouthWest Queens' 
	   30 = '408 Jamaica'  
	   31 = '409 SouthEast Queens'
	   32 = '410 Rockaway'
	   33 = '501/502 Northern SI'
	   34 = '503/504 Southern SI'
	   35 = 'Cell sample';

/* HEALTH STATUS */
	value health 
		1 = 'Excellent'
		2 = 'Very Good'
		3 = 'Good'
		4 = 'Fair'
		5 = 'Poor';

/* ACCESS */
	value acs07f  
		1 = 'Employer (yours or someone elses)'
		2 = 'A plan that you or someone else buys on your own'
		3 = 'Medicare'
		4 = 'Family Health Plus or Medicaid'
		5 = 'The military, CHAMPUS, Tricare, or VA'
		6 = 'Some other source or COBRA'
		7 = 'Uninsured';
	value physical
		1 = '<6 months'
		2 = '6 - <12 months'
		3 = '12 months - <2 years'
		4 = '2 - <5 years'
		5 = '>= 5 years'
		6 = 'Never';
	value rsoc11f		
		1 = 'Private Doctor'
		2 = 'Community Health Center'
		3 = 'A hospital outpatient clininc'
		4 = 'A hospital ED/Urg center'
		5 = 'Alternative health care provider'
        6=  'Family/friend/self/resources'
		7=  'Non-hospital clinic'
        8 = 'Other'
		9 = 'No ususal place/does not go';
	value apptwait
		1 = 'Same day'
		2 = 'Next day'
		3 = 'In 2-3 days'
		4 = 'In 4-5 days'
		5 = 'More than 5 days'
		6 = 'Didnt call doctors office';
	value ins05f
		1 = 'Private'
		2 = 'Medicare'
		3 = 'Medicaid'
		4 = 'Other'
		5 = 'Uninsured';

/* DIABETES */
	value agediab 
		1 = '<18 years'
		2 = '18 - 40 years'
		3 = '>40yrs';

/*MENTAL HEALTH */
	value mhworkimp
		1 = 'Yes'
		2 = 'No'
		3 = 'Did not work/study';
	value timingmh
		1 = 'In the last month'
		2 = 'In the last 6 months'
		3 = 'In the last year'
		4 = 'Over a year ago'
		5 = 'Never';
	value timesmh
	    1 = 'Never'
	    2 = 'Once'
		3 = 'Two or more times';
	value timesmove
		1 = 'None'
		2 = 'One'
		3 = 'Two or more';
	value numfrnd
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three or four'
		5 = 'Five to eight'
		6 = 'Nine or more';
	value isolate
		1 = 'At risk for social isolation'
		2 = 'Not at risk';
	value mood
		1 = 'All of the time'  
        2 = 'Most of the time'  
        3 = 'Some of the time'  
        4 = 'A little of the time'  
        5 = 'None of the time';
	value mhtxpyf 
		1 = 'No mental health treatment in past year'
		2 = 'Counseling only'
		3 = 'Medication only'
		4 = 'Both counseling and medication';

/* NUTRITION */
	value fruitveg
		1 = 'None'
		2 = '1 - 4'
		3 = '5+';
	value ndrinks
		1 = 'None'
		2 = '<1 12 oz'
		3 = '1 12 oz'
		4 = '>1 12 oz';
	value ndrnkcat
		1 = '>=2 sodas per day'
		2 = '<2 sodas per day';
	value freqsbuy	
		1 = 'Frequently'
		2 = 'Sometimes'
		3 = 'Hardly ever'
		4 = 'Never'
		5 = '[VOL] Never buy canned/packaged';
	value freqs07f	
		1 = 'Frequently'
		2 = 'Sometimes'
		3 = 'Hardly ever'
		4 = 'Never';
	value redsaltf
		1 = 'Yes'
		2 = 'No'
		3 = 'Do not use salt';
	value wlkprdc10f
		1='5 min or less'
		2='More than 5, less than 10 min'
		3='10 min or more'
		4='[VOL] Phys unable to walk';

/* PHYSICAL ACTIVITY */
	value bicycle9f
		1 = 'Several times a month'
		2 = 'At least once a month'
		3 = 'A few times a year'
		4 = '[Vol] Unable to ride bike'
		5 = 'Never';
	value stairs
		1='Yes'
		2='No'
		3='Unable to climb stairs';
	value howmanystairs
		1 = '0 floors/weekday'
		2 = '1-2 floors/weekday'
		3 = '3-5 floors/weekday'
		4 = '6+ floors/weekday';

/* DEMOGRAPHICS */
	value agegrp
		1 = '18 - 24'
		2 = '25 - 44'
		3 = '45 - 64'
		4 = '65+';
	value agegrp5f
		1 = '18 - 24'
		2 = '25 - 29'
		3 = '30 - 44'
		4 = '45 - 64'
		5 = '65+';
	value age25up
		1 = '25 - 44'
		2 = '45 - 64'
		3 = '65+';
	value age40new
		1 = '40-44'
		2 = '45-64'
		3 = '65+';
	value age45up
		1 = '45 - 64'
		2 = '65+';
	value age50up
		1 = '50 - 64'
		2 = '65+';
	value age
		1 = '18 - 24'
		2 = '25 - 44'
		3 = '45 - 64';
	value age20up3f
		1 = '20-39'
		2 = '40-59'
		3 = '60+';
	value dem25f
	    1 = '65 or older'  
        2 = '45-64'  
        3 = '25-44, or'  
        4 = '18-24'; 
  value dem128f
        1 = '65 or older'  
        2 = '45-64'  
        3 = '30-44'  
        4 = '25-29'
        5 = '18-24';
	value sex
		1 = 'Male'
		2 = 'Female';
	value dem55f
	    1 = 'Puerto Rican'  
        2 = 'Cuban/Cuban American'  
        3 = 'Dominican'  
        4 = 'Mexican/Mexican-American'  
        5 = 'Central or South American'  
        6 = 'Other Latin American, or'  
        7 = 'Other Hispanic/Latino'  
        9 = 'Spanish';
	value newrace
		1 = 'White'
		2 = 'Black'
		3 = 'Hispanic'
		4 = 'Asian/Pacific Islander'
		5 = 'Other';/*includes multi-race, Native American, other*/
	value cntryNEW
  	    1 = 'Argentina'						
	    2 = 'Australia'
	    3 = 'Bangladesh'
	    4 = 'Barbados'
	    5 = 'Belarus'
	    6 = 'Bolivia'
        7 = 'Brazil'
	    8 = 'Canada'
	    9 = 'Caribbean'
	   10 = 'Chile'
	   11 = 'China'
	   12 = 'Colombia'
	   13 = 'Costa Rica'
	   14 = 'Cuba'
	   15 = 'Dominican Republic'
	   16 = 'Ecuador'
	   17 = 'Egypt'
	   18 = 'El Salvador'
	   19 = 'France'
	   20 = 'Germany'
	   21 = 'Ghana'
	   22 = 'Greece'
	   23 = 'Guatamala'
	   24 = 'Guyana'
	   25 = 'Haiti'
	   26 = 'Honduras'
	   27 = 'Hong Kong'
	   28 = 'Hungary'
	   29 = 'India'
	   30 = 'Ireland'
	   31 = 'Israel'
	   32 = 'Italy'
	   33 = 'Jamaica'
	   34 = 'Japan'
	   35 = 'Korea'
	   36 = 'Mexico'
	   37 = 'Nicaragua'
	   38 = 'Nigeria'
	   39 = 'Pakistan'
	   40 = 'Panama'
	   41 = 'Peru'
	   42 = 'Philippines'
	   43 = 'Poland'
	   44 = 'Puerto Rico'
	   45 = 'Romania'
	   46 = 'Russia'
	   47 = 'Sierra Leone'
	   48 = 'South American'
	   49 = 'Spain'
	   50 = 'Taiwan'
	   51 = 'Trinidad and Tobago'
	   52 = 'Turkey'
	   53 = 'Ukraine'
	   54 = 'United Kingdom'
	   55 = 'Venezuela'
	   56 = 'Vietnam'
	   57 = 'West Indian'
	   58 = 'Yugoslovia'
       59 = 'Afghanistan'
	   60 = 'Africa'
	   61 = 'Albania'
	   62 = 'Antigua'
	   63 = 'Armenia'
	   64 = 'Austria'
	   65 = 'Bahrain'
	   67 = 'Belgium'
	   68 = 'Belize'
	   69 = 'Bulgaria'
	   70 = 'Cambodia'
	   71 = 'Central Asia'
	   72 = 'Cyprus'
	   73 = 'Czchoslovakia'
	   74 = 'England'
	   75 = 'Europe'		 
	   76 = 'Georgia'
77,99,999 = 'Unknown'
	   78 = 'Grenada'
	   79 = 'Guinea'		
	   80 = 'Indonesia'
	   81 = 'Iran'
	   82 = "Cote D'Ivoire"
	   83 = 'Jordan'	
	   84 = 'Latin American country'
	   85 = 'Latvia'
	   86 = 'Lebanon'
	   87 = 'Malaysia'
	   88 = 'Malta'
	   89 = 'Middle Eastern'
	   90 = 'Montenegro'
	   91 = 'Morocco'
	   92 = 'Netherlands'
	   93 = 'Norway'
	   94 = 'Portugal'
	   95 = 'Democratic Republic of the Congo (former: Zaire)'
	   96 = 'Scotland' 
	   97 = 'Senegal'
	   98 = 'Singapore'		
	  100 = 'South Korea'
	  101 = 'Sri Lanka'
	  102 = 'St. Lucia'
	  103 = 'St. Vincent'
	  104 = 'Suriname'
	  105 = 'Sweden'
	  106 = 'Switzerland'
	  107 = 'Thailand'		
	  108 = 'Uruguay'
	  109 = 'Uzbekistan'
	  110 = 'Virgin Islands'
	  111 = 'West Africa'
	  112 = 'Zambia'
	  113 = 'Dominica'
      114 = 'Kenya'
	  116 = 'Algeria'
	  117 = 'Aruba'
	  118 = 'Asia'
	  119 = 'Bahamas'
	  120 = 'Tibet'
	  121 = 'Bermuda' 
	  122 = 'Burma' 
	  123 = 'British Virgin Islands' 
	  124 = 'Cameroon'
	  125 = 'Central America'
	  126 = 'Croatia'
	  127 = 'East Africa'
	  128 = 'Estonia' 
	  129 = 'Ethiopia'
	  130 = 'Finland'
	  131 = 'French Guiana'
	  133 = 'Iraq'
	  134 = 'Serbia'
	  135 = 'Liberia'
	  136 = 'Lithuania'
	  137 = 'Mali'
	  138 = 'Mauritius'
	  139 = 'Mauritania'
	  140 = 'Moldova'
	  141 = 'Montserrat '
	  142 = 'Nepal'
	  143 = 'New Zealand'
	  144 = 'Niger'
	  145 = 'Libya'
	  146 = 'Martinique'
	  147 = 'Paraguay'
	  148 = 'Saudi Arabia'
	  149 = 'South Africa'
	  150 = 'Southeast Asia'
	  151 = 'Slovenia'
	  152 = 'St. Croix'
	  153 = 'St. Thomas' 
	  155 = 'Sudan'
	  156 = 'Syria'
	  157 = 'Tajikistan'
	  158 = 'Uganda'
	  159 = 'United Arab Emirates'
	  160 = 'Yemen'
	  161 = 'Zimbabwe'
	  162 = 'Angola'
	  163 = 'Anguilla' 
 	  164 = 'Tanzania'
	  165 = 'Azerbaijan'
 	  166 = 'Slovakia'
	  167 = 'Bosnia'
      168 = 'Somalia'
	  169 = 'Brunei'
	  170 = 'Cayman Islands'
	  171 = 'Curacao'
	  172 = 'Denmark'
	  173 = 'Gambia'
	  174 = 'Iceland'
	  175 = 'Kuwait'
	  176 = 'Macauo'
	  178 = 'Palestine'
	  179 = 'Papua, New Guinea.'
	  180 = 'Rwanda'
	  181 = 'Scandinavia'
	  184 = 'St. Martin'
	  186 = 'Togo'	
  	  188 = 'St. Maarten' 
	  189 = 'US Virgin Islands'
	  190 = 'Republic of Macedonia'
	  191 = 'Kazakhstan'
	  192 = 'Kyrgyzstan'
	  193 = 'Gabon'
	  194 = 'Tunisia'
	  195 = 'Turkmenistan'
	  196 = 'Guam'
	  197 = 'Eritrea'  
	  198 = 'Fiji'
	  200 = 'Samoa'
	  202 = 'Turks and Caicos Island'
	  203 = 'Wales (UK)' 
	  204 = 'Djibouti (East Africa)'
	  206 = "St. John's" 
	  207 = 'Cape Verde'
	  209 = 'Bhutan'
	  210 = 'Luxembourg'
	  213 = 'Federation of St Kitts and Nevis'
	  214 = 'Burkina Faso'  
	  215 = 'Burundi'
	  216 = 'Kosovo' 
	  217 = 'Guadeloupe'
	  218 = 'Namibia'
	  219 = 'Former USSR, not specified'
	  220 = 'Benin'
	  221 = 'Madagascar'
	  222 = 'St. Barts'
	  223 = 'British Isles'
	 1000 = 'USA';
	value born
		1 = 'US born'
		2 = 'Foreign born';
	value howlong
		1 = '<5 yrs'
		2 = '5 - 9 yrs'
		3 = '10+ yrs';
	value athome
		1 = 'English'
		2 = 'Spanish'
		3 = 'Russian'	
		4 = 'Chinese'	
		5 = 'Indian'	
		6 = 'Other';
	value marital 
		1 = 'Married'
		2 = 'Divorced'
		3 = 'Widowed'
		4 = 'Separated'
		5 = 'Never married'
		6 = 'A member of unmarried couple';
	value sexual
		1 = 'Heterosexual'
		2 = 'Gay/Lesbian'
		3 = 'Bisexual';
 	value educat
		1 = 'Less than high school'
		2 = 'High school graduate'
		3 = 'Some college/technical school'
		4 = 'College graduate';
	value dem17f
	    1 = 'Never attended school or only attended kindergarten'  
        2 = 'Grades 1 through 8 (Elementary)'  
        3 = 'Grades 9 through 11 (Some high school)'  
        4 = 'Grade 12 or GED (High school graduate)'  
        5 = 'College 1 year to 3 years (Some college or technical school)'  
        6 = 'College 4 years or more (College graduate)';
	value child
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three'
		5 = 'More than three';
	value employ07f
 		1 = 'Employed for wages or salary'
        2 = 'Self-employed'
        3 = 'Unemployed for 1 year or more'
        4 = 'Unemployed for less than 1 year'
        5 = 'A homemaker'
        6 = 'A student'
        7 = 'Retired'
        8 = 'Unable to work';
 	value educat
		1 = 'Less than high school'
		2 = 'High school graduate'
		3 = 'Some college/technical school'
		4 = 'College graduate';
	value dem17f
	    1 = 'Never attended school or only attended kindergarten'  
        2 = 'Grades 1 through 8 (Elementary)'  
        3 = 'Grades 9 through 11 (Some high school)'  
        4 = 'Grade 12 or GED (High school graduate)'  
        5 = 'College 1 year to 3 years (Some college or technical school)'  
        6 = 'College 4 years or more (College graduate)';
	value child
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three'
		5 = 'More than three';
	value poverty 
		1 = '<100% poverty'
		2 = '100% - <200% poverty'
		3 = '200% - < 400% poverty'
		4 = '400% - < 600% poverty'
		5 = '> 600% poverty'
		6 = 'Dont know';
	value pov200f
		1 = '<200% poverty'
		2 = '>=200% poverty'
		3 = 'Dont know';
  	value povgrp3f
  		1 = '<200%'
  		2 = '200-399%'
  		3 = '400+%'
  		4 = 'Dont know';
	value newpovft
	 	1 = '<100%'
	 	2 = '100-199%'
     	3 = '200-399%'
	 	4 = '400-599%'
	 	5 = '600%+';
	value weight5f
		1 = 'Under weight'
		2 = 'Normal weight'
		3 = 'Over weight'
		4 = 'Obese'
		5 = 'Very obese';
	value weight
		1 = 'Under weight'
		2 = 'Normal weight'
		3 = 'Overweight'
		4 = 'Obese';
	value wt
		1 = 'Under/normal weight'
		2 = 'Overweight'
		3 = 'Obese';
	value uhf34f 
	    1 = '101 Kingsbridge'
	    2 = '102 NE Bronx'		      
		3 = '103 Fordham-Bronx Pk'		  
		4 = '104 Pelham-Throgs Neck'		  
		5 = '105/106/107 South Bronx'		  
		6 = '201 Greenpoint'		  
		7 = '202 Downtown-Heights-Slope'		  
		8 = '203 Bed Stuy-Crown Heights'		  
		9 = '204 East New York'		  
	   10 = '205 Sunset Park'		  
	   11 = '206 Borough Park'		  
	   12 = '207 Flatbush'   		  
	   13 = '208 Canarsie' 		  
	   14 = '209 Bensonhurst' 		  
	   15 = '210 Coney Island'
	   16 = '211 Williamsburg-Bushwk'
	   17 = '301 Washington Heights'
	   18 = '302 Central Harlem'  	
	   19 = '303 East Harlem' 
       20 = '304 Upper West Side'
	   21 = '305/307 Upper East Side-Gramercy'
       22 = '306/308 Chelsea-Village'
	   23 = '309/310 Union Square-Lower Manhattan'
	   24 = '401 LIC, Astoria'
	   25 = '402 West Queens'
	   26 = '403 Flushing'
	   27 = '404/406 Bayside Little Neck-Fresh Meadows'
	   28 = '405 Ridgewood'
	   29 = '407 SouthWest Queens' 
	   30 = '408 Jamaica'  
	   31 = '409 SouthEast Queens'
	   32 = '410 Rockaway'
	   33 = '501/502 Northern SI'
	   34 = '503/504 Southern SI';
	value boro
		1 = 'Bronx'
		2 = 'Brooklyn'
		3 = 'Manhattan'
		4 = 'Queens'
		5 = 'Staten Island';
	value dpho
		1 = 'South Bronx'
		2 = 'East and Central Harlem'
		3 = 'North and Central Brooklyn'
		4 = 'All Other Neighborhoods';
	value neighpov4f
  		1 = '0  - <10% (low pov)'
  		2 = '10 - <20%'
  		3 = '20 - <30%'
  		4 = '30 - 100% (very high pov)';

/* TOBACCO, SMOKING (INCLUDING SECOND HAND SMOKE) */
	value smoker
		1 = 'Never'
		2 = 'Current'
		3 = 'Former';
	value some
		1 = 'Yes, everyday'
		2 = 'No, somedays';
	value cpdcat
		1 = '<10'
		2 = '10-<21'
		3 = '21+';
	value heavysmokerf
		1 = 'Yes (>=11 cig/day)'
		2 = 'No (<11 cig/day)';
	value smoke5f /*UPDATED;*/
		1 = 'Within the past month'
		2 = 'More than 1 - 3 months'
		3 = 'More than 3 to 6 months'
		4 = 'More than 6 to 12 months'
		5 = 'More than 1 to 5 yrs'
		6 = 'More 5 to 10 yrs'
		7 = 'More than 10 yrs';
	value recent
		1 = '0 - 12 months'
		2 = '>12 months';
	value success
		1 = 'Quit for >3 months'
		2 = 'Quit for <=3 months';
	value hmsmkrul
		1='Smoking not allowed anywhere'
		2='Smoking allowed some places, some times'
		3='Smoking allowed anywhere'
		4='No smoking rules in home';

/* CANCER SCREENING */
	value colon
		1 = '<=10 years'
		2 = '>10 years OR never';
    value wherecolon
		1 = 'Hospital'
		2 = 'Amb surg center'
		3 = 'Private doctor office'
		4 = '[VOL] other place';

/* NOISE */
	value scaletime
		1 = 'Always'
		2 = 'Usually'
		3 = 'About half the time'
		4 = 'Seldom'
		5 = 'Never';
	value heartest
		1 = 'Less than 1 year'
		2 = '1 to 4 years'
		3 = '5 to 9 years'
		4 = '10+ years'
		5 = 'Never';
	value hearloss
		1 = 'Yes'
		2 = 'No'
		3 = 'Never had hearing checked';
	value earprotection
		1 = 'Most of the time'
		2 = 'Sometimes'
		3 = 'Rarely/seldom'
		4 = 'Never';
	value trafficd
		1 = '0 days'
		2 = '1 to 6 days'
		3 = '7 days';
   value noisehrs
	   1 = '1 hr or less'
	   2 = 'More than 1 hr, less than 4hrs'
	   3 = '4 or more hours';
   value noisehrsall
	   1 = 'None'
	   2 = '1 hr or less'
	   3 = 'More than 1 hr, less than 4hrs'
	   4 = '4 or more hours';
   value hpdays
	   1 = 'None/do not own'
	   2 = '1 to 6 days'
	   3 = '7 days';

/* SEXUAL BEHAVIOR */
	value partner 
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three or more';
	value behave
		1 = 'Homosexual'
		2 = 'Bisexual'
		3 = 'Heterosexual'
		4 = 'Sexually active with incomplete info';
	value partner 
		1 = 'None'
		2 = 'One'
		3 = 'Two'
		4 = 'Three or more';
	value analsex
		1 = 'Every time'
		2 = 'Some of the time'
		3 = 'Never';

/* ALCOHOL */
	value maxdrinkscat
		1 = 'None'
		2 = 'Less than five'
		3 = 'Five to nine'
		4 = 'Ten or more';
	value alctype
		1 = 'Wine'
		2 = 'Beer'
		3 = 'Liquor'
		4 = 'Wine coolers'
		5 = 'No one type [VOL]'

;
run; 
