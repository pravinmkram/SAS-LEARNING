/*PROC REPORT */
/*The REPORT procedure (PROC REPORT) combines features of the PRINT,*/
/*TABULATE, and MEANS procedures, along with features of the DATA */
/*step, in a single report-writing tool that can be to produce a*/
/*variety of reports.*/
/**/
/*It is useful to print all or selected variables, Find outs*/
/*descriptive statistics and computes new variables.*/


PROC REPORT <OPTIONS>;
COLUMN VARIABLE-LIST;
DEFINE REPORT-ITEM / <USAGE> <OPTION(S)>; 
BREAK LOCATION BREAK-VARIABLE </OPTION(S)>;
RBREAK LOCATION / <OPTIONS>;
COMPUTE VARIABLE/<OPTIONS>;
RUN;

/*COLUMN :Select the variable which you want to prints in the report.*/
/*Default it selects all variables. */

/*DEFINE :It is useful to define variables.*/
/*Like applying attributes, alignment of columns and data, applying */
/*styles etc…*/
/*Define statement usually one for each column in the report,*/
/*Controls the appearance of the column,*/
/*Specifies how a variable is used in the report   */

/*BREAK AFTER statement*/
/*It is useful to print statistical calculations on each group or*/
/*order variable wise for analysis variables. Or produces a default */
/*summary at a break (a change in the value of a GROUP or ORDER variable).*/
/*Location controls the placement of the break lines, where location*/
/*is */
/*AFTER places the break lines immediately after the last row of*/
/*each set(group) of rowsthat have the same value for the break*/
/*variable.*/
/*BEFORE places the break lines immediately before the first row of */
/*each set(group) of rows that have the same value for the break variable.*/

/*BREAK AFTER statement options*/
/*OL inserts a line of hyphens (-) above each value that appears */
/*in the summary line.*/
/*UL inserts a line of hyphens (-) under each value that appears*/
/*in the summary line.*/
/*DOL inserts double line of hyphens (-) above each value that */
/*appears in the summary line.*/
/*DUL inserts double line of hyphens (-) under each value that */
/*appears in the summary line.*/
/*SKIP writes a blank line for the last break line.*/
/*SUMMARIZE writes a summary line in each group of break lines. */


/*RBREAK AFTER statement*/
/*produces a default summary at the beginning or end of a report.*/
/*Syntax:- RBREAK location </option(s)>;*/
/*Location controls the placement of the break lines and is either */
/*AFTER places the break lines at the end of the report.*/
/*BEFORE places the break lines at the beginning of the report*/


data raw; 
   input region $ state $ month date7. 
         headcnt expenses revenue; 
   format month date7.; 
   cards; 
Eastern  VA 01FEB78  10  7800 15500 
Southern FL 01MAR78   9  9800 13500 
Southern GA 01JAN78   5  2000  8000 
Southern FL 01FEB78  10  8500 11000 
Northern NY 01MAR78   5  6000  5000 
Eastern  VA 01MAR78  11  8200 16600 
Plains   NM 01MAR78   2  1350   500 
Southern FL 01JAN78  10  8000 10000 
Northern NY 01FEB78   4  3000  4000 
Southern GA 01FEB78   7  1200  6000 
; 
run; 



/*DATA=Dataset: Specify the input data set*/

/*Default proc report prints latest created dataset   */
proc report ;
run;

/*IT will print the all the variables in output window*/
proc report data=raw;
run;

/*OUT=Dataset: Specify the output data set*/
Proc report data= raw out=ds2;
Run;

/*BOX: Report the data within box in output window, default print
without box.*/
Proc report data= raw out=ds2 box;
Run;

/*nowd/nowindows*/
/*Suppress to printing of proc report window and prints report in*/
/*output or result viewer window.*/
/*Select the interactive report window or the non windowing environment*/
/*Default proc report prints data in Proc report window   */

proc report data=raw nowd;
/*columns region month expenses;*/
columns region state month expenses;
format expenses dollar10.2;
run;

/*BYPAGENO=number:*/
/*If a BY statement is present, specifies the listing page number
at the start of each BY group.*/

Proc sort data=raw;
by region;
Run;

Proc report data=raw nowd box bypageno=5;
By region;
Run;

/*CENTER | NOCENTER: Specifies alignment of report.*/
/*Default is center, when we specify nocenter it prints left aligned.*/
Proc report data=raw nowd box bypageno=4  nocenter ;
By region;
Run;

/*HEAD SKIP: Insert space b/w column name and data in output
window.*/
Proc report data= raw nowd headskip;
Run;

/*HEAD LINE: Insert line b/w column names and data in o/p window.*/
Proc report data= raw nowd headskip headline;
Run;

/*LIST: Writes proc report code in sas log.*/
Proc report data=raw nowd list   ;
columns region state expenses revenue;
Run;

/*Named: writes name= in front of each value in the report,
where name is the column heading for the value.*/
Proc report data=raw nowd named;
columns region state expenses revenue;
Run;

/*NOHEADER: suppresses column headings, including headings that span
multiple columns.*/
Proc report data=raw nowd noheader;
columns region state expenses revenue;
Run;

/*NOEXEC: Suppresses the building of the report */
Proc report data=raw noexec;
columns region state expenses revenue;
Run;

/*COLUMN statement*/
/*Select the variable which you want to prints in the report.*/
/*Default it selects all variables. */

/*_CHAR_  prints only Character variables.*/
/*_NUMERIC_  prints only numeric variables totals.*/
/*_ALL_  prints both char and numeric variables.*/
Proc report data= raw nowd;
Column _char_; 
Run;	


Proc report data= raw nowd;
Column _numeric_; 
Run;

Proc report data= raw nowd;
Column _all_; 
Run;

/*It will print only column stmt variables*/
proc report data=raw nowd;
columns region state month expenses;
format expenses dollar10.2;
run;

/*Applying styles(colors) using define statement*/
/*Style={background=color} - Applying back ground color for column name and data.*/
/*Style={foreground=color} - Applying foreground color for column name and data.*/
/*Style={font_weight=bold} – Make font as bold. */
/*Style={font_face=font name} – Change font type*/
/*Style={font_size=size of font} – Increase/decrease font_size.*/

/*Applying alignment for variables and data.*/
/*Center – Center align for data values*/
/*Left – Left align for data values, default character variables*/
/*values are left aligned.*/
/*Right – Right align for data values, default numeric variables */
/*values are left aligned.*/
/*style(column)={just=center | left | right} – Alignment for data*/
/*values*/
/*style(header)={just=center | left | right} – Alignment for column*/
/*headers, default is center*/

Proc report data= raw nowd ;
columns region state month expenses;
Define region /'Region Name' center ;
Define state/ 'State Name' right;
Define month/  width=6 right;
Define expenses/ 'Emp expenses' format=comma12. left;
Title  'Emp Demographic Info ';
Title2 'Stansys Software Solutions';
Footnote 'This is a system generated mail please dont respond to this ';
Run;

Proc report data= raw nowd ;
columns region state month expenses;
Define region / 'Region Name' 
		style(column)={just=center} style(header)={just=right};
Define state/ 'State Name'
style(column)={just=left} style(header)={just=center};
Define month/  width=6 right
style(column)={just=center} style(header)={just=left};
Define expenses/ 'Emp expenses'
style(column)={just=right} style(header)={just=right} format=comma12.;
Title  'Emp Demographic Info ';
Title2 'Stansys Software Solutions';
Footnote 'This is a system generated mail please dont respond to this ';
Run;

proc report data=raw nowd;
columns region state expenses;
rbreak after/summarize ;
format expenses dollar10.2;
run;


proc report data=raw nowd;
columns region state expenses revenue;
rbreak before/summarize ;
format expenses dollar10.2 revenue dollar10.2;
run;

/*DATA orders values according to their order in the input data set.*/
/*FORMATTED orders values by their formatted (external) values. By default, the order*/
/*is ascending.*/
/*FREQ orders values by ascending frequency count.*/
/*INTERNAL orders values by their unformatted values, which yields the same order that*/
/*PROC SORT would yield. This order is operating environment dependent. This sort sequence*/
/*is particularly useful for displaying dates chronologically.*/



/*ORDER – Sort the rows and prints on each group wise.*/
/*GROUP – Consolidate observations into groups and removes if entire observation is*/
/*duplicates.*/
/*ANALYSIS – Calculate a statistics, default for numeric variables.*/
/*COMPUTED – Computed by PROC REPORT*/
/*ACROSS – Class variables in the column dimension*/


proc report data=raw out=ni nowd;
columns region state month expenses;
define region/order order=data;
define state/order order=data;
define expenses/analysis sum format=dollar10.2;
run;

proc report data=raw out=ni nowd;
columns region state month expenses;
define region/order order=freq;
/*define region/order order=freq descending order;*/
define state/order order=data;
define expenses/analysis sum format=dollar10.2;
run;

proc report data=raw nowd;
columns region state month expenses;
define region/order order=data;
define state/order order=formatted;
define expenses/analysis sum format=dollar10.2;
break after region/summarize  ;
run;


proc format;
	value $reg
		'Eastern' = 'West'
		'Southern' = 'East'
		'Northern' = 'South'
		'Plains' = 'North';
		run;


proc report data=raw nowd;
columns region state month expenses revenue;
/*define region/order order=formatted;*/
define region/order order=formatted format=$reg.;
define state/order order=internal;
define expenses/analysis sum format=dollar10.2;
define revenue/analysis sum format=dollar10.2;
break after region/summarize  ol ul;
run;
/*Note: If we use order=formatted with format, then the data will be*/
/*display in ascending order based on the format(new) values*/

proc report data=raw nowd ;
columns region state month expenses revenue;
define region/order order=formatted;
define state/order order=internal;
/*define state/order order=internal descending order;*/
define expenses/analysis sum format=dollar10.2;
define revenue/analysis sum format=dollar10.2;
break after region/summarize  dol dul;
run;

proc report data=raw nowd box;
columns region state month expenses revenue;
define region/order order=formatted;
define state/order order=internal;
define expenses/analysis sum format=dollar10.2;
define revenue/analysis sum  format=dollar10.2;
break before region/summarize  dol dul;
rbreak after/summarize  dol dul;
run;

proc report data=raw nowd box;
columns region state month expenses;
define region/order order=formatted;
define state/order order=internal;
define expenses/analysis sum format=dollar10.2;
break after region/summarize ol ;
compute after;
	line ' '/*it will enter the blank line*/;
	line 'the total sales is ' expenses.sum dollar10.2;
	line 'stansys team want print the results';
	line 'this genarated by system';
	endcomp;
/*title 'Venu wants output';*/
title ' ';/*It will not print the title*/
footnote 'prasad genarated the report';
run;

proc report data=raw nowd;
columns region state month expenses expenses=smax expenses=smin;
define region/ORDER 'region';
define state/order;
define expenses/analysis sum format=dollar10.2;
define smin/'salesmin' analysis min ;
define smax/analysis max ;
/*define smax/'exp2' analysis max ;*/
compute after;
	line ' ';
	line ' ';
	line ' ';
	line @30 60*'*';
	line @30 'the total expenses from:'
	smin dollar10.2 'to' smax dollar10.2 '****.';
	line @30 60*'*';
/*	line @30 60*'-';*/
	endcomp;
run;

/*proc sort data=raw out=raw2;*/
/*by region month;*/
/*run;*/


proc report data=raw out=nn nowd;
columns region  expenses;
define region/group;
define month/group;
define expenses/analysis sum format=dollar10.2 ;
break after region/summarize ol skip;
rbreak after/summarize dol dul ;
compute after;
	line ' ';
	line ' ';
	line ' ';
	line 'the total sales is'
	expenses.sum;
	line @3 60*'-';
	endcomp;
run;

proc report data=raw nowd;
columns region month expenses;
define region/group ;
define month/across;
define expenses/analysis sum format=dollar10.2 ;
break after region/summarize ol skip;
rbreak after/summarize dol ;
	/*	compute after;	*/
	/*	line 'the total sales is'	*/
	/*	expenses.sum;	*/
	/*	endcomp;	*/
run;

proc report data=raw nowd;
columns region month expenses;
define region/group;
define month/group;
define expenses/analysis sum format=dollar10.2;
break after region/summarize ol skip;
rbreak after/summarize dol;
/*compute after;*/
/*	line 'the total sales is'*/
/*	expenses.sum;*/
/*	endcomp;*/
run;

/*It will print simple statistics */
proc report data=raw nowd;
columns region state expenses,(sum min max);
define region/group ;
define state/group;
define expenses/format=dollar10.2;
break after region/summarize ol skip;
run;

/*options ls=120;*/
proc report data=raw nowd;
columns region state expenses,(sum n min max) revenue,(sum n min max);
define region/group ;
/*define state/group;*/
define expenses/format=dollar10.2;
break after region/summarize ol skip;
rbreak after /summarize ;
run;


proc report data=raw box nowd;
columns region state n expenses;
define region/group ;
define state/group;
define expenses/format=dollar10.2;
rbreak after /summarize ;
run;


proc report data=raw box nowd;
columns region month expenses;
define region/group ;
define month/across;
define expenses/analysis sum width=13 format=dollar10.2;
rbreak after /summarize  ;
run;


proc report data=raw  nowd;
columns region state month expenses;
define region/style(column)={just=right} style(header)={just=center} 
					style={background=lightgreen foreground=Brown font_weight=bold
		font_size=3} ;
define month/across style={background=orange foreground=Brown font_weight=bold
		font_size=3 font_face=Arial};
define expenses/analysis sum width=13 format=dollar10.2
		style={background=pink foreground=Brown font_weight=bold
		font_size=3 font_face=Arial};
label Region='Region_Name' month='Month Name' state='State Name';
rbreak after /summarize  ;
/*rbreak before /summarize  ;*/
run;

proc report data=raw box nowd;
columns region state month expenses bonus diff;
define bonus/computed;
define diff/computed;
/*define expenses/analysis sum;*/
compute bonus;
	bonus = expenses.sum*.50;
	endcomp;

compute diff;
	diff = bonus-expenses.sum;
	endcomp;

run;

proc report data=sashelp.class box nowd;
columns name sex age height new_age;
define new_age/computed;
compute new_Age;
	if age.sum in (11,12) then new_age= height.sum+10;
		else new_age= height.sum+20;
	endcomp;

run;

proc report data=sashelp.class box nowd;
columns name sex age height weight new_ht new_wt diff;
define new_ht/computed;
define new_wt/computed;
define diff/computed;

compute new_ht;
	if age.sum not in (11,12) then new_ht=height.sum+10;
	else
		new_ht= height.sum+20;
	endcomp;

compute new_wt;
	if age.sum in (11,12) then new_wt=weight.sum+10;
	else
		new_wt= weight.sum+20;
	endcomp;

compute diff;
	diff = weight.sum-height.sum;
	endcomp;

run;


/*proc transpose data=raw out=listtran; */
/*   by region state month; */
/*   id month; */
/*   var expenses;*/
/*run;*/




