data b8;
input id name $ sal loc $ age gender $ dob :anydtdte. doj datetime.;
/*format doj datetime.;*/
datalines;
100 jagan 40000 hyd 34 m 30mar83 30mar83:10:40:50
200 surya 50000 bang 30 m 30mar1989 30mar89:12:40:50
300 vijaya 43000 che 23 f 04/30/1983 30Apr83:22:40:50
400 kumari 43000 che 26 f 30-06-93 30jun93:22:40:50
500 raghu 35000 delhi 26 m 30/12/93 30dec1993:23:40:50
;
run;
/*ATTRIBUTES OF VARIABLES*/

/*1.Datatype 2.Length 3. Lable 4. Informat 5. Format*/

/*1.Datatype:*/

/*Indicate variable values are char or numeric data type.*/

/*Note: In dataset char data is left aligned and numeric data*/
/*is right aligned*/

/*ex: input id name $ sal loc $ age gender $*/

data a;
input id name $ sal loc $ age gender $;
datalines;
100 jagan 40000 hyd 34 m
200 surya 50000 bang 30 f
300 vijaya 43000 che 30 f
;
run;


/*2. LENGTH*/
/*specifies the  no.of bytes for storing vairable values. we*/
/*can assign length for variables.*/
/**/
/*syntax: Length variable name $length(width)*/

/*Excute this program and check the dataset*/
data new;
set sashelp.class;
if sex = 'M' then sex = 'Male';
run;

/*Excute this program and check the dataset*/
data new_1;
length sex $8.;
set sashelp.class;
if sex = 'M' then sex = 'Male';
run;

/*Excute this program and check the dataset*/
data new_2;
set sashelp.class;
length sex $8.;
if sex = 'M' then sex = 'Male';
run;


data a;
input id name $ sal loc $ age gender $;
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumaris 43000 che 30 f
;
run;


data a1;
input id name $ sal loc $ age gender $;
length name $15.;
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumar 43000 che 30 f
;
run;


data a2;
length name $15.;
input id name $ sal loc $ age gender $;
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumar 43000 che 30 f
;
run;

/*Just execute this and see the output dataset*/


data c;
set a a2;
run;

data c1;
length name $15.;
set a a2;
run;


data d;
set a2 a;
run;

/*Note: Length stmt always should write before i/p or before*/
/*set stmt or before variable. Otherwise when i/p executes*/
/*whatever the length is there(default 8) that will come into*/
/*output dataset.*/

/*3. LABEL*/

/*Assign descriptive labels to variables. It gives alias names*/
/*to variables.*/

/*Note: Label can't change the variable name permanently like*/
/*rename*/

/*Syntax: Label varname=newvarname varname2= newvarname2*/
/*-------varnamen=newvarnamen;*/

data a;
input id name $ sal loc $ age gender $;
datalines;
100 jagan 40000 hyd 34 m
200 surya 50000 bang 30 f
300 vijaya 43000 che 30 f
;
run;


data a1;
label name = empname loc =location sal=salary;
input id name $ sal loc $ age gender $;
datalines;
100 jagan 40000 hyd 34 m
200 surya 50000 bang 30 f
300 vijaya 43000 che 30 f
;
run;


data a2;
input id name $ sal loc $ age gender $;
label name = empname loc =location sal=salary;
datalines;
100 jagan 40000 hyd 34 m
200 surya 50000 bang 30 f
300 vijaya 43000 che 30 f
;
run;

/*Rename after excuting this please open the dataset and
see the data*/
data a3(rename=(name = empname
		loc =location sal=salary));
input id name $ sal loc $ age gender $;
datalines;
100 jagan 40000 hyd 34 m
200 surya 50000 bang 30 f
300 vijaya 43000 che 30 f
;
run;

/*Note: If we write lable stmt after i/p stmt, output dset*/
/*will be in i/p order. But if we write before i/p, output*/
/*dset order should be in label order then whatever variables*/
/*are note there in label stmt those will come in i/p order.*/


proc print data=a label;
label name = empname loc =location sal=salary;
run;


proc print data=a1 label;
run;


/*DATE formats*/

/*REads date values into variables representing time, dates and datetimes.*/

/*syntax: informatw.*/

/*date7.  29Jan18*/
/*date9.  29Jan2018*/
/*ddmmyy8. 29/01/10 or 29-01-10 or 29:01:10*/
/*ddmmyy10. 29/01/2010 or 29-01-2010 or 29:01:2010*/
/*anydtdte. if you doesn't know about date informat then we can use this*/
/*time   10:20:30(hrs:ms:seconds)*/
/*datetime. 30may2018:20:30:40*/


data a;
input id name $ sal loc $ age gender $ dob;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar89
300 vijaya 43000 che 23 f 30apr83
300 kumari 43000 che 26 f 30jun93
;
run;

/*DATE7. INFORMAT*/
data b;
input id name $ sal loc $ age gender $ dob date7.;
/*informat dob date7.;*/
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar89
300 vijaya 43000 che 23 f 30apr83
300 kumari 43000 che 26 f 30jun93
;
run;

/*data9. informat*/
data b2;
input id name $ sal loc $ age gender $ dob;
informat dob date9.;
datalines;
100 jagan 40000 hyd 34 m 30mar1983
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30apr1983
300 kumari 43000 che 26 f 30jun1993
;
run;


/*ddmmyy10. informat*/
data b3;
input id name $ sal loc $ age gender $ dob ddmmyy10.;
datalines;
100 jagan 40000 hyd 34 m 30/03/1983
200 surya 50000 bang 30 m 30/03/1989
300 vijaya 43000 che 23 f 30/04/1983
300 kumari 43000 che 26 f 30/06/1993
;
run;

/*ddmmyy8. informat*/
data b4;
input id name $ sal loc $ age gender $ dob ddmmyy8.;
/*format dob date9.;*/
datalines;
100 jagan 40000 hyd 34 m 30/03/83
200 surya 50000 bang 30 m 30/03/89
300 vijaya 43000 che 23 f 30:04:83
300 kumari 43000 che 26 f 30-06-93
;
run;

/*The below example having multiple date formats*/
/*Execute this check the log & dataset*/
data b5;
input id name $ sal loc $ age gender $ dob ddmmyy8.;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30:04:83
400 kumari 43000 che 26 f 30-06-93
500 raghu 35000 delhi 26 m 30/12/93
;
run;

/*It will read all the date formats*/
data b6;
input id name $ sal loc $ age gender $ dob :anydtdte.;
format dob date9.;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30:04:1983
400 kumari 43000 che 26 f 30-06-93
500 raghu 35000 delhi 26 m 30/12/93
;
run;

/*300 vijaya 43000 che 23 f 30:04:1983*/

/*data b8;*/
/*input id name $ sal loc $ age gender $ dob :anydtdte10.;*/
/*format dob date9.;*/
/*datalines;*/
/*100 jagan 40000 hyd 34 m 30mar83*/
/*200 surya 50000 bang 30 m 30mar1989*/
/*300 vijaya 43000 che 23 f 30:04:1983*/
/*400 kumari 43000 che 26 f 30-06-93*/
/*500 raghu 35000 delhi 26 m 30/12/93*/
/*;*/
/*run;*/


/*DATETIME INFOMART*/
data b8;
input id name $ sal loc $ age gender $ dob :anydtdte. doj datetime.;
/*format doj datetime.;*/
datalines;
100 jagan 40000 hyd 34 m 30mar83 30mar83:10:40:50
200 surya 50000 bang 30 m 30mar1989 30mar89:12:40:50
300 vijaya 43000 che 23 f 04/30/1983 30Apr83:22:40:50
400 kumari 43000 che 26 f 30-06-93 30jun93:22:40:50
500 raghu 35000 delhi 26 m 30/12/93 30dec1993:23:40:50
;
run;

data b9;
input id name $ sal loc $ age gender $ dob time8. doj datetime.;
/*input id name $ sal loc $ age gender $ dob time8. doj datetime20.;*/
/*format doj datetime.;*/
datalines;
100 jagan 40000 hyd 34 m 10:40:50 30mar83:10:40:50
200 surya 50000 bang 30 m 12:40:50 30mar89:12:40:50
300 vijaya 43000 che 23 f 22:40:50 30Apr83:22:40:50
400 kumari 43000 che 26 f 18:40:50 30jun93:22:40:50
500 raghu 35000 delhi 26 m 14:40:50 30dec1993:23:40:50
;
run;



/**/
/*USER DEFINED INFORMATS:*/

/*create by using proc format*/
/**/
/*user can create his own informats to read the data using PROC format*/

/*Syntax:*/

/*PROC FORMAT;*/
/*invalue informatname values;*/
/*run;*/


proc format;
invalue sant 
	'ECE'=1
	'IT'=2
	'COMP'=3;
	run;

data b6;
input id name $ sal loc $ age gender $ dept sant.;
datalines;
100 jagan 40000 hyd 34 m ECE
200 surya 50000 bang 30 m IT
300 vijaya 43000 che 23 f ECE 
400 kumari 43000 che 26 f COMP
500 raghu 35000 delhi 26 m IT
600 kumar 43000 che 26 m COMP
;
run;

proc format;
invalue mar 
		'A'= 80
		'B'= 70
		'C'= 60
		'F'= 50;
		run;


data stu;
input id name $ m1 m2 m3;
informat m1 mar. m2 mar. m3 mar.;
datalines;
100 jaga 50 60 70
200 surya 60 B 80
300 vijaya A B 60
400 kumari 80 70 60
500 raghu 80 B F
600 kumar 80 B C
;
run;


/*FORMAT  STATEMENT*/
/*Format is an instruction thas sas uses to write data values.*/
/**/
/*The format is exactly the same as that for informat.*/
/**/
/*Note: Anydtdte. format is not working in format statement*/

/*Syntax:*/

/*format var-1 format. var-2 format. ----- var-n format.;*/

/*1. Character Formats*/
/*2. Numeric Formats*/
/*3. Date, time & DAtetime formats*/
/*4. Column binary Formats*/
/*5. User defined Formats.*/

/*1. Character format: writes character data values from character */
/*variables.*/

/*Char informats & char formats both are same.*/

/*Syntax: $formatw.*/

/*ex: $ or $10. or :$10.*/


data b8;
input id name $ sal loc $ age gender $ ;
datalines;
100 jagan 40000 hyd 34 m 
200 surya 50000 bang 30 m
300 vijaya 43000 che 23 f
400 kumari 43000 che 26 f
500 raghu 35000 delhi 26 m
;
run;

data b9;
input id name $10. sal loc $ age gender $ ;
datalines;
100 jaganmohan 40000 hyd 34 m 
200 suryakiran 50000 bang 30 m
300 vijayasrim 43000 che 23 f
400 kumarisrin 43000 che 26 f
500 raghureddy 35000 delhi 26 m
;
run;

/*NUMERIC FORMATS:*/
/*WRites nueric data values from numeric variables.*/

/*Syntax: formatw. or formatw.d*/


data b2;
input id name $10. loc $ age gender $ sal;
informat sal comma8.;
format sal comma8.;
datalines;
100 jaganmohan hyd 34 m 20,000
200 suryakiran bang 30 m 30,000
300 vijayasrim che 23 f 40,000
400 kumarisrin che 26 f 50,000
500 raghureddy delhi 26 m 60,000
;
run;


/*The below example read the data with decimals*/
data b3;
input id name $10. loc $ age gender $ sal;
informat sal comma10.2;
format sal comma10.2;
datalines;
100 jaganmohan hyd 34 m 20,000.50
200 suryakiran bang 30 m 30,000.60
300 vijayasrim che 23 f 40,000.00
400 kumarisrin che 26 f 50,000.85
500 raghureddy delhi 26 m 60,000.98
;
run;


/*the below example after decimalo it wll read 4 digits*/
data b4;
input id name $10. loc $ age gender $ sal;
informat sal comma11.4;
format sal comma11.4;
datalines;
100 jaganmohan hyd 34 m 20,000.5056
200 suryakiran bang 30 m 30,000.6050
300 vijayasrim che 23 f 40,000.0025
400 kumarisrin che 26 f 50,000.8555
500 raghureddy delhi 26 m 60,000.9825
;
run;


/*DOLLAR FORMATS*/

/*The below example read the in dollar format and write the comma format*/

data b5;
input id name $10. loc $ age gender $ sal;
informat sal dollar8.;
format sal comma10.;
datalines;
100 jaganmohan hyd 34 m $20,000
200 suryakiran bang 30 m $30,000
300 vijayasrim che 23 f $40,000
400 kumarisrin che 26 f $50,000
500 raghureddy delhi 26 m $60,000
;
run;


data b6;
input id name $10. loc $ age gender $ sal;
informat sal dollar8.;
format sal dollar10.;
datalines;
100 jaganmohan hyd 34 m $20,000
200 suryakiran bang 30 m $30,000
300 vijayasrim che 23 f $40,000
400 kumarisrin che 26 f $50,000
500 raghureddy delhi 26 m $60,000
;
run;


data b8;
input id name $10. loc $ age gender $ sal;
informat sal dollar10.2;
format sal dollar10.;
datalines;
100 jaganmohan hyd 34 m $20,000.50
200 suryakiran bang 30 m $30,000.55
300 vijayasrim che 23 f $40,000.75
400 kumarisrin che 26 f $50,000.88
500 raghureddy delhi 26 m $60,000.53
;
run;


data b9;
input id name $10. loc $ age gender $ sal;
informat sal dollar10.2;
format sal dollar10.2;
datalines;
100 jaganmohan hyd 34 m $20,000.50
200 suryakiran bang 30 m $30,000.55
300 vijayasrim che 23 f $40,000.75
400 kumarisrin che 26 f $50,000.88
500 raghureddy delhi 26 m $60,000.53
;
run;



data b10;
input id name $10. loc $ age gender $ sal;
informat sal dollar10.2;
format sal euro10.2;
datalines;
100 jaganmohan hyd 34 m $20,000.50
200 suryakiran bang 30 m $30,000.55
300 vijayasrim che 23 f $40,000.75
400 kumarisrin che 26 f $50,000.88
500 raghureddy delhi 26 m $60,000.53
;
run;


/*DATE FORMATS*/
/*WRITE DATA VALUES FROM VARIABLE REPRESENTING DATE, TIME & DATA TIME*/
/*VARIABLES.*/

/*SYNTAX: FORMATW.*/

/*DATE7. 29JAN10     DATE9. 23JAN2010*/
/*DDMMYY8. 29/01/10  DDMMYY10. 29/01/2010  */
/*TIME5. 10:30       TIME8. 10:30:50*/
/*DATETIME. 29JAN2010:10:30:20 OR DATETIME20. 29JAN2010:10:30:20*/
/*WORDDATE20. JANUARY 29, 2010 */
/*WEEKDATE. FRIDAY, JANUARY 29, 2010 */
/*YYMMDDN8. 20100129*/
/*YYMMDDD8. 10-01-29 		YYMMDDD10. 2010-01-29*/
/*YYMMDDS8. 10/01/29      YYMMDDS10. 2010/01/29*/
/*YYMMDDC8. 10:01:29      YYMMDDC10. 2010:01:29*/

/*ANYDTDTE IS NOT WORKING IN FORMAT STATEMENT*/

data a;
input id name $ sal loc $ age gender $ dob DATE7.;
FORMAT DOB DATE7.;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar89
300 vijaya 43000 che 23 f 30apr83
300 kumari 43000 che 26 f 30jun93
;
run;


data B;
input id name $ sal loc $ age gender $ dob;
INFORMAT DOB DATE9.;
FORMAT DOB DATE9.;
datalines;
100 jagan 40000 hyd 34 m 30mar1983
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30apr1983
300 kumari 43000 che 26 f 30jun1993
;
run;


data b5;
input id name $ sal loc $ age gender $ dob :anydtdte.;
format dob DATE9.;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30/04/1983
400 kumari 43000 che 26 f 30-06-93
500 raghu 35000 delhi 26 m 30/12/93
;
run;


data b6;
input id name $ sal loc $ age gender $ dob DATETIME.;
format dob DATETIME.;
datalines;
100 jagan 40000 hyd 34 m 30mar83:10:20:40
200 surya 50000 bang 30 m 30mar1989:10:20:40
300 vijaya 43000 che 23 f 30mar1989:12:20:40
400 kumari 43000 che 26 f 30mar1999:13:20:40
500 raghu 35000 delhi 26 m 30mar2009:15:20:40
;
run;

data b8;
input id name $ sal loc $ age gender $ dob :anydtdte. doj datetime.;
format DOB DATE9. doj datetime. ;
datalines;
100 jagan 40000 hyd 34 m 30mar83 30mar83:10:40:50
200 surya 50000 bang 30 m 30mar1989 30mar89:12:40:50
300 vijaya 43000 che 23 f 04/30/1983 30Apr83:22:40:50
400 kumari 43000 che 26 f 30-06-93 30jun93:22:40:50
500 raghu 35000 delhi 26 m 30/12/93 30dec1993:23:40:50
;
run;


data b5;
input id name $ sal loc $ age gender $ dob :anydtdte.;
/*format dob DATE9.;*/
/*format dob DATE7.;*/
/*format dob DDMMYY8.;*/
/*format dob DDMMYY10.;*/
/*format dob YYMMDDN.;*/
/*format dob YYMMDDD8.;*/
/*format dob YYMMDDD10.;*/
/*format dob YYMMDDS8.;*/
/*format dob YYMMDDS10.;*/
/*format dob YYMMDDC8.;*/
/*format dob YYMMDDC10.;*/
/*format dob WEEKDATE.;*/
format dob WORDDATE.;
datalines;
100 jagan 40000 hyd 34 m 30mar83
200 surya 50000 bang 30 m 30mar1989
300 vijaya 43000 che 23 f 30/04/1983
400 kumari 43000 che 26 f 30-06-93
500 raghu 35000 delhi 26 m 30/12/93
;
run;

/*user defined formats*/
/*CREATED BY USER */

data raw;
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
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
RUN; 


PROC FORMAT;
VALUE $new
	'Eastern'='EAST'
	'Southern'='SOUTH'
	'Northern'='NORTH'
	'Plains'='WEST';
	run;


data raw1;
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month monyy5. region new.; 
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
RUN; 


PROC FORMAT;
VALUE $RE
	'Eastern'='1'
	'Southern'='2'
	'Northern'='3'
	'Plains'='4';
	run;



	data raw2;
		set raw;
		format region RE.;
	run;

	data raw2;
		set raw1;
		format region RE.;
	run;


data a;
set sashelp.class;
run;

/*CREATING THE FORMATS FOR NUMERIC VALUES*/
/*NO NEED tO GIVE THE DOLLAR symbol*/
proc format;
value ag
	0 - 12 = 'Minor'
	13 - 14 = 'Major'
	15 - 16 = 'Senior';
	run;


	data b;
	set a;
/*	set sashelp.class*/
	new_age=age;
	format age ag.;
	run;


/*PROC FORMAT;*/
/*VALUE $ST*/
/*	'EAST'='1'*/
/*	'SOUTH'='2'*/
/*	'NORTH'='3'*/
/*	'WEST'='4';*/
/*	run;*/


/*ATTRIB STATEMENT*/

/*Associates a format, informat, lable and length with one or more*/
/*variables.*/

/*Syntax: ATTRIB Varname attrib-list ---- varname-n attriblist;*/

/*Generaly using the attrib statement we can change length, format,*/
/*informat and label*/


/*without Attrib statement*/
data a2;
length name $15.;
input id name $ sal loc $ age gender $;
label name = 'emp_name';
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumar 43000 che 30 f
;
run;


data a3;
attrib name length = $15.;
input id name $ sal loc $ age gender $;
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumar 43000 che 30 f
;
run;

data a4;
attrib name length = $15. label='emp_name';
input id name $ sal loc $ age gender $;
datalines;
100 jaganmohanreddy 40000 hyd 34 m
200 suryakirankumar 50000 bang 30 f
300 vijayakumar 43000 che 30 f
;
run;

data a5;
attrib name length = $15. label='emp_name'
		sal informat=comma6. format=comma6. label='salary';
input id name $ sal loc $ age gender $;
datalines;
100 jaganmohanreddy 40,000 hyd 34 m
200 suryakirankumar 50,000 bang 30 f
300 vijayakumar 43,000 che 30 f
;
run;


data a6;
attrib name length = $15. label='emp_name'
		sal informat=comma6. format=comma6. label='salary'
		dob informat=date9. format=date7. label='date_of_Birth'
		doj informat=date9. format=ddmmyy8. label='date_of_joining';
input id name $ sal loc $ age gender $ dob doj;
datalines;
100 jaganmohanreddy 40,000 hyd 34 m 30may1989 30may2018
200 suryakirankumar 50,000 bang 30 f 30jun1990 30jun2015
300 vijayakumar 43,000 che 30 f 25dec1998 25dec2017
;
run;

/*Note: When we specify length as an attribut with attrib stmt, must*/
/*wrire with befor i/p or before set stmt otherwise when i/p stmt or set*/
/*stmt execute whatever the length is there for variable that will come*/
/*into o/p. and the o/pt dataset variable order also change accordingly*/
/*attrib stmt variables order that we cn change again into required*/
/*order in proc print.*/
/**/
/*but if we specify attrib stmt after i/p or set stmt dataset order is */
/*i/p stmt order(we can specify like this when we are not using length*/
/*in attrib stmt)*/










































