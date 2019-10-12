/*DATA Types*/
character: character variable contain letters, numbers
and special chars. char data will read both charcters
and numbers.

Note: Character data is left aligned.
numeric: variable value contain numbers and dates.
Note: numeric data is right aligned.


/*Terminalogy*/
Tables are called as datasets.
Rows or records are called as observations.
columns are calles as variables.

/*Missing data*/
character data represented by BLANKS.
Numeric data represented by PERIOD(.).


/*Datastep*/
Data step always start with key word of data. A datastep
consist group of stmts in SAS. That can read the rawdata
and creates a file called as SAS dataset.

/*Purpose*/
1. Checking for erros, validatin and correcting.
2. Calculate values for new variables using programing
steps.
3. Creates new dataset from existing dataset.
4. Manipulation and reshaping the data.
5. Generating and printing reports.


/*RULES OF SASNAMES*/
1.Name must be less than or equal 32 chars.
2.Must start with alphabets or underscore
3.Sasname should contain alphabets, numeric and 
underscore(_). but not allow special characters.

/*datasetname allow*/
1. test 2._test 3.test_ 4. test_9 5. upto32chars

/*datasetname not allow*/
1.9test 2. test$ 3.morethan 32 chars


Input Statement:
The order which data values are entered the name of the sas variable
and their type.

We should use the input statement only for data values stored in
external files or for data immediately following a cards or
datalines statement.

datalines:
It means go and read the data. Use the datalines stmt with an i/p
stmt to read the data that you enter directly inb the program.


/*DATA STEP PROCESS*/
	When data step is executed it first undergoes a 
syntax check by the SAS system. If no errors are found
the datastep is then compiled and executed. When executing
the datastep for instream data. The SAS system creates
the following step.

1. INPUT BUFFER:
Each raw records of data is read into an area of memory
when an i/p stmt is executed.

2. PDV: The SAS system builds the dataset one observatin
at a time in this area of memory as the program is 
executed, values are read from the input buffer and assign
to corresponding variable in the PDV(PROGRAM DATA VECTOR)

Note:And also create the two automatic variables
_N_ and _ERROR_

_N_:  Indicated no.of times the datastep has been
	executed. Default values is 1
 
_ERROR_:Default value is 0 when error encounter it gives
_ERROR=1.

Descriptor Information(D.I):
----------------------------
The D.I for a sas dataset makes the file self documenting.
IT includes the no.of observation, the observation length
the date and that the dataset was last modified. D.I
for individuals variables includes attributes sucs as
name, type, length, format, label and whether the
variable is indexed.






















