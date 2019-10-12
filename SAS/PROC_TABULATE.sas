/*PROC TABULATE*/

/*This procedure print out descrptive simple statistics for numeric*/
/*varaibles in a table,each table value displayed in cell cotrolled*/
/*by rows & columns*/
/**/
/*Note: this procedure havinng combined features of proc print, */
/*means, freq and report.*/

/*Syntax:*/

PROC TABULATE options;
class variables;
var analysis variables;
by variables;
table page dimenstion, row dimension, column dimenstions;
keylabel keyword=descrpition;
run;

/*Class : identifies class var for the table. class variables */
/*determine the categories that proc tab uses to calcilate the */
/*statistics*/
/**/
/*var : identifies analysis variable for the tables, analysis*/
/*variable contain values for which you want to compute statistics.*/
/**/
/*by : identies by variables for the table. proc tabulate uses to */
/*calculate statistics on each group into separate output.*/
/**/
/*table: each table statement can specify upto 3 dimensions.*/
/*uses comma to separate dimensions.*/
/**/
/*Noseps: eliminate horizontal separator lines from row titles and*/
/*body  of the printable table*/
/**/
/*missing missing values will be considered as valid levels for the*/
/*class vars*/


data raw; 
   input region $ state $ month monyy5. 
         sales expenses revenue; 
   format month monyy5.; 
   cards; 
Eastern  VA FEB78  10  7800 15500 
Southern FL MAR78   9  9800 13500 
Southern GA JAN78   5  2000  8000 
Northern MA MAR78   3  1500  1000 
Southern FL FEB78  10  8500 11000 
Northern NY MAR78   5  6000  5000 
Eastern  VA MAR78  11  8200 16600 
Plains   NM MAR78   2  1350   500 
Southern FL JAN78  10  8000 10000 
Northern NY FEB78   4  3000  4000 
Southern GA FEB78   7  1200  6000 
; 
run; 

/*Options:-*/
/*Data= Dataset*/
/*Specify the input data set, Otherwise system consider recent*/
/*created dataset.*/

/*Out= Dataset*/
/*Specify the output data set*/

/*Calculate the sum for expenses & Revenue*/
Proc Tabulate; 
Var expenses revenue sales; 
Table sum*expenses sum*revenue sum*sales; 
Title 'Summary of expenses & revenue'; 
Run;

/*Calculate the mean for expenses & sum for Revenue*/
/*IT will be print with the alias name*/
Proc Tabulate; 
Var expenses revenue; 
/*Table mean*expenses sum*revenue; */
Table mean='Expensemean'*expenses sum='revenuesum'*revenue; 
Title 'Summary of Hours'; 
Run;

/*Calculate the frequency for each region wise*/
proc tabulate data=raw out=new;
class region;
table region; 
run;
/*It will be print the count for region only*/
proc tabulate data=raw;
class region state month;
table region; 
run;

/*It will be print the count for region,state & month wise*/
proc tabulate data=raw;
class region state month;
table region state month; 
run;

/*Calculate the frequency for each reqion&state combination.*/
proc tabulate data=raw;
class region state month;
/*var expenses;*/
table region*state;
run;

/*Calculate the frequency for each reqion&state combination. 
And sum for expenses*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*state expenses;/*Column dimensions*/
run;

/*First you can comment the class statement and execute the program and check the log*/
/*Region*state is row dimension*/
/*month is column dimension*/
proc tabulate data=raw;
class region state month;
table region*state, month; 
run;

/*Calculate the frequency total for region*state combination*/
proc tabulate data=raw;
class region state month;
table region*state all, month all; 
run;

/*First you can comment the var statement and execute the program
and check the log*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*state, month*expenses; 
run;

/*Values will be print in dollar or comma format*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*state, month*expenses*(f=comma10.2); 
/*table region*state, month*expenses*(f=dollar10.2); */
run;

/*IT will give the subtotal each region wise*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*(state all='subtotal'), month*expenses; 
run;

/*IT will give the subtotal each region wise & total for all
regions*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*(state all='subtotal') 
		all='total cnt for all regions',
month*expenses; 
run;

/*Format=*/
/*Specify a format for each cell in the table*/

/*The below example it will display the dollar format only total
only*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*(state all='subtotal')
	all='total cnt for all regions'*f=dollar10.2, 
		month*expenses;
run;

/*The below example it will display the dollar format only
subtotal & total only*/
proc tabulate data=raw;
class region state month;
var expenses;
table region*(state all='subtotal'*f=dollar10.2)
			all='total cnt for all regions'*f=dollar10.2, 
	month*expenses; 
run;

proc tabulate data=raw /*format=dollar10.2*/;
class region state month;
var expenses;
table region*(state*f=dollar10.2 all='subtotal'*f=dollar10.2)
			all='total cnt for all regions'*f=dollar10.2, 
	month*expenses; 
run;

proc tabulate data=raw format=dollar10.2;
class region state month;
var expenses;
table region*(state all='subtotal')
			all='total cnt for all regions', 
	month*expenses; 
run;


/*It will calculate the statistics*/
/*inthis example pagedimension,row dimension & column dimension*/
/*region is page dime, state is row dimension, expenses is column
dimension*/
Proc Tabulate Data= raw Format=8.1; 
class region state month;
var expenses;
Table region, state all, sum*expenses='sumexp'*(month all); 
Table region, state all, pctsum*expenses=' '*(month all); 
Table region, state all, n*expenses=' '*(month all); 
Table region, state all, nmiss*expenses=' '*(month all); 
Table region, state all, range*expenses=' '*(month all); 
Table region, state all, stddev*expenses=' '*(month all); 
Table region, state all, css*expenses=' '*(month all); 
Table region, state all, skewness*expenses=' '*(month all); 
Table region, state all, max*expenses=' '*(month all); 
Table region, state all, min*expenses=' '*(month all); 
run;

/*IT will print the sum for expenses & revenue*/
Proc Tabulate Data= raw Format=8.1; 
class region state month;
var expenses revenue;
Table region, state all,
		sum*expenses*(month all) sum*revenue*(month all); 
run;

/*The below example it will display simple statistics 
for state*Revenue combination*/
proc tabulate data=raw;
class region state month;
var revenue;
table region*state, month*revenue*(n mean min max sum);
/*table region*month, state*revenue*(min max sum range);*/
run;

/*In var stmt we are using revenue & expenses*/
proc tabulate data=raw format=dollar10.1;
class region state month;
var revenue expenses;
/*table region*state, month*revenue*(n mean min max sum);*/
table region*month, state*revenue*(min max sum range)
		state*expenses*(min max sum range) ;
run;

proc tabulate data=raw;
class region state month;
var sales;
/*table region*state, (sum min max)*sales;*/
table region*state, month*sales*(sum min max);
run;

proc tabulate data=raw;
class region state month;
var sales;
table region*(state all='subtotal') all='total', 
		month*(sum n mean min max)*sales;
run;

/*IT will dsiplay the subtotals in dollar format*/
proc tabulate data=raw;
class region state month;
var sales;
table region*(state all='subtotal'*f=dollar10.2) all='total',
			month*(sum n mean min max)*sales;
run;

proc tabulate data=raw noseps;
class region state month;
var sales;
table region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' min='minimum sales' max='max sales')*sales;
	label sales='REGIONS SALES';
run;

/*Applying styles(colors) using define statement*/
/*Style={background=color} - Applying back ground color for 
column name and data.*/
/*Style={foreground=color} - Applying foreground color for column 
name and data.*/
/*Style={font_weight=bold} – Make font as bold. */
/*Style={font_face=font name} – Change font type*/
/*Style={font_size=size of font} – Increase/decrease font_size.*/

/*Printmiss:IT is specifies that all possible combination level*/
/*	of the class variables. */

/*Misstext:Instead of missing values it will be print the defined*/
/*	values. But default values is missing.*/

proc tabulate data=raw 
	Style={ background=lightgreen foreground=red};
class region state month;
var sales;
table region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' 
			min='minimum sales' max='max sales')*sales/misstext='000' printmiss box='STANSYS SAS REPORT';
	label sales='REGIONS SALES';
	title 'This is sales';
	title2 "This report generated by FEB month";
	footnote 'This is monthly report';
	footnote2 'This report for ANS team';
run;

/*In this example we are using pagedimension, row dimension and column dimension*/
proc tabulate data=raw;
class region state month;
var sales;
table month, region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' 
			min='minimum sales' max='max sales')*sales/misstext='0000' box='SalesREPORT';
	label sales='REGIONS SALES';
	title 'This is sales';
	title2 "This report generated by FEB month";
	footnote 'This is monthly report';
run;


proc tabulate data=raw 
	Style={background=blue foreground=brown font_weight=bold font_face=Algerian};
class region state month/Style={background=lightgreen foreground=red font_weight=bold};
var sales;
table month, region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' 
			min='minimum sales' max='max sales')*sales/misstext='0000' box='SalesREPORT/two';
	label sales='REGIONS SALES';
	title 'This is sales';
	title2 "This report generated by FEB month";
	footnote 'This is monthly report';
run;


proc tabulate data=raw 	out=test2
	Style={background=blue foreground=brown font_weight=bold font_face=Algerian};
class region/Style={background=lightgreen foreground=red font_weight=bold font_size=2 font_face=Arial};
class state/Style={background=yellow foreground=blue font_weight=bold font_size=5 font_face=Batang};
class month/Style={background=green foreground=black font_weight=bold font_size=5 font_face=calibri};
var sales;
table month,
	region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' 
			min='minimum sales' max='max sales')*sales/misstext='0000' box='SalesREPORT/two';
	label sales='REGIONS SALES' region='REGION_NAME';
	title 'This is sales';
	title2 "This report generated by FEB month";
	footnote 'This is monthly report';
	footnote2 "Genarated by Collection team on &sysdate.";
run;

ods pdf file="F:\JAGAN Sas_class\bhartath\tabulate.pdf";
proc tabulate data=raw 	out=test2
	Style={background=blue foreground=brown font_weight=bold font_face=Algerian};
class region/Style={background=lightgreen foreground=red font_weight=bold font_size=2 font_face=Arial};
class state/Style={background=yellow foreground=blue font_weight=bold font_size=5 font_face=Batang};
class month/Style={background=green foreground=black font_weight=bold font_size=5 font_face=calibri};
var sales;
table month,
	region*(state all='subtotal'*f=dollar10.2) all='total',
	month*(sum='total sales' n='no of records' mean='avg' 
			min='minimum sales' max='max sales')*sales/misstext='0000' box='SalesREPORT/two';
	label sales='REGIONS SALES' region='REGION_NAME';
	title 'This is sales';
	title2 "This report generated by FEB month";
	footnote 'This is monthly report';
	footnote2 "Genarated by Collection team on &sysdate.";
run;
ods pdf close;


proc format;
	value color
		0 - 5000 = 'red'
		5001 - 8000 = 'yellow'
		8001 - high = 'green';
		run;

proc tabulate data=raw
	Style={background=color. foreground=brown font_weight=bold 
	font_face=calibri};
class region state month;
var expenses;
table region*state, month*expenses; 
/*table region*state, month*expenses*(f=dollar10.2); */
run;

proc format;
	value $st
		'VA' = 'Verginia'
		'FL' = 'Florida'
		'MA' = 'Mart'
		'NM' = 'NEW MAR'
		'NY' = 'NEW YORK'
		'GA' = 'GANGTAK';
		run;

proc tabulate data=raw
	Style={background=color. foreground=brown font_weight=bold 
	font_face=calibri};
class region state month;
var expenses;
table region*state, month*expenses; 
format state $st.;
run;
