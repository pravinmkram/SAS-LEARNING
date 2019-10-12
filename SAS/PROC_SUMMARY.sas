/*PROC SUMMARY*/

/*The SUMMARY procedure provides data summarization tools to*/
/*calculate descriptive statistics for variables across all*/
/*observation and within group of observation.*/

/*Syntax;*/
Proc summary data=datasetname options;
by var-1 var-2--- var-n;
class variable;
id variable;
var var-1 var-2--- var-n;
output out=;
ways *;
run;

/*By: Calculate the separate statics for each by group*/
/*Class: identify variables whose values define subgroup for the*/
/*analysis*/
/*Var:Identify the analysis variable and their order in the results*/
/*Id: includes additional identification variables in the o/p dataset*/
/*Output: it will create the another daset with analysis of data*/
/*ways: specify the no.of ways to make unique comnination of class*/
/*variables*/

data gains; 
   input name $  team $  age ; 
   cards; 
   Alfred  blue    6 
   Alicia  red     5 
   Barbara  .      5 
   Bennett red     . 
   Carol   blue    5 
   Carlos  blue    6 
   Carol1  .       5 
   Carlos2  red    6 
   ; 
 run;

/* It will print only no.of observations*/
proc summary data=gains print;
run; 

proc summary data=gains print ;
var age;
run; 

/*In proc summary we need to write vat stmt otherwise it will give any statistics*/
/*and create the new dataset as t with n mean max mis std*/
proc summary data=gains print ;
var age;
output out=tt;
run; 

/*RANGE: MAXImUM- MINiMUM VALUE*/
proc summary data=gains n mean range print;
var age;
run; 

/*It will print the count by teamwise without missing values*/
proc summary data=gains print;
class team;
run; 

/*It will print the statistice by teamwise without missing values*/
proc summary data=gains print;
class team;
var age;
run; 

/*It will print the count by teamwise and includes missing values*/
proc summary data=gains missing print;
class team;
run; 

/*example 2*/
data gains; 
    input name $ sex $ height  weight  school $  time; 
cards; 
Alfred  M 69.0 122.5 AJH  1 
Alfred  M 71.0 130.5 AJH  2 
Alicia  F 56.5  84.0 BJH  1 
Alicia  F 60.5  86.9 BJH  2 
Benicia F 65.3  98.0 BJH  1 
Benicia F 69.3  99.1 BJH  2 
Bennett F 63.2  76.2 AJH  1 
Bennett F 69.2  98.2 AJH  2 
Carol   F 62.8 102.5 BJH  1 
Carol   F 65.3 105.4 BJH  2 
Carlos  M 63.7 102.9 AJH  1 
Carlos  M 70.3 106.9 AJH  2 
Henry   M 63.5 102.5 AJH  1 
Henry   M 68.9 108.6 AJH  2 
Jaime   M 57.3  86.0 BJH  1 
Jaime   M 62.9  90.0 BJH  2 
Janet   F 59.8  84.5 AJH  1 
Janet   F 62.5  86.5 AJH  2 
Jean    M 68.2 113.4 AJH  1 
Jean    M 70.3 116.0 AJH  2 
Joyce   M 51.3  50.5 BJH  1 
Joyce   M 55.5  53.5 BJH  2 
Luc     M 66.3  77.0 AJH  1 
Luc     M 69.3  82.9 AJH  2 
Marie   F 66.5 112.0 BJH  1 
Marie   F 69.5 114.9 BJH  2 
Medford M 64.9 114.0 AJH  1 
Medford M  .     .    .   . 
Philip  M 69.0 115.0 AJH  1 
Philip  M 70.0 118.0 AJH  2 
Robert  M 64.8 128.0 BJH  1 
Robert  M 68.3   .   BJH  2 
Thomas  M 57.5  85.0 AJH  1 
Thomas  M 59.1  92.3 AJH  2 
Wakana  F 61.3  99.0 AJH  1 
Wakana  F 63.8 102.9 AJH  2 
William M 66.5 112.0 BJH  1 
William M 68.3 118.2 BJH  2 
; 
run;

proc summary data=gains print;
var height weight;
run;

/*calculate the statistics for height by sex wise*/
proc summary data=gains print;
var height;
class sex;
run;

/*calculate the statistics for height & weight by sex wise*/
proc summary data=gains print;
var height weight;
class sex;
output out=new;
run;

/*calculate the statics for height & weight and create the new dataset with max & min values*/
/*separate the statics based on sex variable*/
proc summary data=gains print;
var height weight;
class sex;
output out=new max=maxheight maxwieght min=minht minwt;
run;

/*calculate the statics for height & weight and create the new dataset with max & min values*/
/*separate the statistics based on sex variable*/
/*in output dataset gives maxheight maxweight and min and*/
proc summary data=gains print;
var height weight;
class sex;
output out=new2 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest;
run;

proc summary data=gains print;
var height weight;
class sex;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

proc summary data=gains print;
var height weight;
class sex school time;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

/*BY STATEMENT*/
proc sort data=gains out=gains2;
by school time;
run;


proc summary data=gains2 print;
by school time;
var height weight;
class sex;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

proc summary data=gains print;
var height weight;
class sex school;
ways 1 2;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

/*IT will calculate the one-way,two-way & three ways combinations*/
proc summary data=gains print;
var height weight;
class sex school time;
ways 1 2 3;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
run;

proc summary data=gains print;
var height weight;
class sex school;
types sex school;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
run;

proc summary data=gains maxdec=4 fw=10 nonobs missing print;
var height weight;
class sex school;
types sex school sex*school;
output out=new3 max=maxheight maxwieght min=minht minwt
	maxid(height(name) weight(name))=Tallest heaviest
	minid(height(name) weight(name))=short lowweight;
	title 'one way and two way calculations';
run;

