** Introduction to SAS **;
* Session 2 Exercise

- Create a libref for your folder or network drive using a LIBNAME statement

- Create a new, temporary data set in the 'work' library called 'males'
  from 'classone.classds'

- Filter the data set to include only males (males have a value of 1 for gender)

- Select _only_ the variables gender, race, age, and borough

- Create a new variable called "ethnicity" which has the following values:

when race is: 		ethnicity is:
1			Hispanic
2			white
3			black
4			Asian
5			other
99			unknown

- The dataset you create (called 'males') should have 1350 observations and 5
variables

- When your code looks good, create a permanent dataset using a DATA step

- Have both the permanent 'classds' and 'males' datasets ready for future
classes

** Submit the assignment code as a WORD document on BlackBoard

;

