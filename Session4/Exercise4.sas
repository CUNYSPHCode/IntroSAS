***
Exercise 4
Session 4

1.	Create a libref to your data folder, if you haven't already (use a libname
statement).

2.	Make a new temporary data set named 'males' from the classds data set.
Limit the new data set to just males (1).

3.	Create a title or footnote that includes your name.

4.	Create a format for race and a format for borough.  
(Hint:  both race and borough are numeric.)  

Make the values of the formats look like the following text:

(race variable)
1			Hispanic
2			white
3			black
4			Asian
5			other
99			unknown

(borough variable)
1			Bronx
2			Brooklyn
3			Manhattan
4			Queens
5			Staten Island
99			unknown

Write a PROC FREQ to cross-tabulate (2 x 2) race by borough in the 'males' data
set.  Include a format statement with your new race and borough formats.

Use ODS to create an Excel spreadsheet containing the results of your proc freq.

Submit the code for your assignment via Blackboard
;

