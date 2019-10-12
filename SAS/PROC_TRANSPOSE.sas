/*PROC TRANSPOSE*/

/*This proc changes variables into observation or 
observation into variables*/

/*FOR INTERVIEW PURPOSE ID STATMET IS IMP*/

/*Syntax*/

PROC TRANSPOSE <options>;
var variables;
by variables;
id variables;
copy variables;
run;

/*VAR:specify the variables which u want to transpose*/
/*by:Tranpose the each by group*/
/*id:Specify a variable whose values names the transposed*/
/*variables*/
/*Copy: copy variables directly without transpossing */
/*them*/
/**/
/*NOTE: BY DEFAULT it transpose only numeric variables. */
/*but if we wnat to transpose any specific vars(char or */
/*numeric) also need to use the VAR Statement*/
/**/
/*PREFIX:When column are transposing as rows system*/
/*creates column names like col1 col2 ---coln*/
/*when we specify prefix=name the column names like name1*/
/*name2 ---- namen etc*/
/*when we specify prefix=test the column names like test1*/
/*test2 ---- testn etc*/
/**/
/*NOTE: IF WE WON'T USE OUT= SYSTEM CREATES DATASETS LIKE */
/*DATA1, DATA2 ETC*/

data a;
input dept $ deptno m1 m2 m3;
cards;
SCIENCE 20 50 60 70
MATHS 21 40 61 72
ENGLISH 72 50 62 73
HINDI 23 75 63 74
SOCIAL 24 57 40 75
PHYSICS 25 57 50 76
;
run;

/*simple transpose*/
/*If dont give out statement it will create the output
dataset as Data1*/
proc transpose data=a;
run;

/*tranpose dataset will send to output dataset as b*/
proc transpose data=a out=b;
run;

proc transpose data=a out=b prefix=marks;
run;

/*It will transpose the data and dept variable convert
as variables*/
proc transpose data=a out=b2;
id dept;
run;

/*It will transpose the deptno data*/
proc transpose data=a out=b3;
var deptno;
run;

proc transpose data=a out=b4;
var deptno m1;
run;

proc transpose data=a out=b4;
var deptno m1 m2 m3;
run;

/*IT will transpose both numeric and char*/
proc transpose data=a out=b4;
var dept deptno m1 m2 m3;
run;


/*Example 2*/
data list; 
   input city $15. month $15. temp; 
   cards; 
Raleigh        July           77.5 
Raleigh        January        40.5 
Miami          August         82.9 
Miami          January        67.2 
Los_Angeles    August         69.5 
Los_Angeles    January        54.5 
Juneau         July           55.7 
Juneau         January        23.5 
Phoenix        July           91.2 
Phoenix        January        51.2 
Bismarck       January         8.2 
Bismarck       July           70.8 
Chicago        August         71.1 
Chicago        JUNE	        	22.9 
Wichita        July           80.7 
Wichita        January        31.3 
Honolulu       August         80.7 
Honolulu       JUNE     	   72.3 
Boston         July           73.3 
Boston         JUNE 	         29.2 
Duluth         July           65.6 
Duluth         January         8.5 
; 
run; 
 
/* Sort the data by CITY. */ 
proc sort data=list; 
   by city; 
run; 

/*Transpose the data set by CITY. Name the transposed  */
/*variables from the values of the ID variable, MONTH. */

proc transpose data=list out=listtran; 
   by city; 
   id month; 
run;

proc print data=listtran;
run;

/*EXAMPLE 3*/

data a1; 
input subject $ drug $ exercise $ response response1; 
   cards; 
Smith     Aspirin    Light      5 15 
Smith     Aspirin    Medium     8 18 
Smith     Aspirin    Heavy      9 19 
Smith     Placebo    Light      4 14 
Smith     Placebo    Heavy      7 17 
Jones     Aspirin    Light      6 16 
Jones     Aspirin    Medium     7 17 
Jones     Aspirin    Heavy      9 19 
Jones     Placebo    Light      3 13 
Jones     Placebo    Medium     4 14 
Jones     Placebo    Heavy      6 16 
; 
run; 

proc sort data=a1; 
   by subject drug; 
run; 
 
/*IT will transpose the all numeric variables data*/
proc transpose data=a1 out=a2 name=respname; 
   by subject drug; 
   id exercise; 
run; 

/*IT will transpose the only response variable data*/
 proc transpose data=a1 out=a21 name=respname; 
   by subject drug; 
   id exercise; 
   var response; 
run; 

/*then compare the a2 & a21 datasets*/

proc sort data=a21; by subject respname;run;

proc transpose data=a21 out=a4 name=exercise; 
   by subject respname; 
   id drug; 
   var light medium heavy; 
run;

/*EXAMPLE 4*/
data a;
input team $ dept time score;
cards;
ind 1 1 40
ind 1 2 50
ind 2 3 60
ind 2 1 40
ind 3 2 60
ind 3 3 70
;
run;

proc transpose data=a out=b;
by team dept;
/*var score;*/
run;

proc transpose data=a out=b1;
by team dept;
var score;
run;

proc transpose data=a out=c1;
by team ;
copy time score;
var score;
run;

proc transpose data=a out=d prefix=new;
by team dept;
copy time score;
var score;
run;

proc transpose data=a out=d prefix=new;
by team dept;
copy time score;
var time score;
run;
