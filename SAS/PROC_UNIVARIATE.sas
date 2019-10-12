/*PROC UNIVARIATE: */
/*This procedure produce simple descriptive statistics such as mean, std,median, percentiles*/
/*etc for numeric variables.*/

PROC Univariate options;
by variables;
class variables;
id variables;
output out= options;
var variables;
run;

/*By: we can use the by stmt to obtain separate analysis for each*/
/*by group.*/
/*class: we can use class stmt to specify one or more variables*/
/*that group the data into claissification levels.*/
/*id: the id stmt specifies one or more variables to identify the*/
/*extreme observations.*/
/*var: the var stmt specifies the numeric variables to analyze the data*/
/*ouput: the o/p stmt saves statistics and by variables in an o/p*/
/*dataset.*/


data gains; 
    input name $ sex $ height  weight  school $  time; 
cards; 
Alfred  M 69.0 122.5 AJH  1 
Alfred  M 71.0 130.5 AJH  2 
Alicia  F 56.5  84.0 BJH  1 
Alicia  F 60.5  86.9 BJH  2 
Benicia F 65.3  98.0 BJH  1 
Benicia F 69.3  99.1 BJH  2 
Bennett F 63.2  96.2 AJH  1 
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

/*It will print the all the statistics*/
proc univariate data=gains;
   var height weight;
run;

ods select basicmeasures quantiles;
proc univariate data=gains;
   var height weight;
run;

ods select Modes;
proc univariate data=gains mode;
   var height weight;
   run;

ods select basicmeasures quantiles modes;
proc univariate data=gains mode;
   var height weight;
run;

ods select ExtremeObs;
proc univariate data=gains;
   var height weight;
   id name;
run;

/*It wont' display the output*/
/*it will create the new datasets with required statistics*/
ods select ExtremeObs;
proc univariate data=gains noprint;
   var height weight;
   id name;
output out=new  mean=systolicMean DiastolicMean;
output out=StrengthStats mean=heightMean weightMean std=heightstd weightstd
          min=heightMin weightMin   max=heightmax weightMax; 
run;

/*it will create the required statistics based on sex category*/
ods select ExtremeObs;
proc univariate data=gains;
class sex;
   var height weight;
   id name;
run;

proc sort data=	gains out=gains2;
by school time;
run;

ods pdf file="F:\JAGAN Sas_class\bhartath\univ.pdf";
ods select ExtremeObs;
proc univariate data=gains2;
by school time;
class sex;
   var height weight;
   id name;
run;
ods pdf close;

proc univariate data=gains;
   histogram height weight;
/*  QQPLOT weight;*/
   id name;
run;



/*EXAMPLE2*/
/*data BPressure;*/
/*   length PatientID $2;*/
/*   input PatientID $ Systolic Diastolic @@;*/
/*   datalines;*/
/*CK 120 50  SS 96  60 FR 100 70*/
/*CP 120 75  BL 140 90 ES 120 70*/
/*CP 165 110 JI 110 40 MC 119 66*/
/*FC 125 76  RW 133 60 KD 108 54*/
/*DS 110 50  JW 130 80 BH 120 65*/
/*JW 134 80  SB 118 76 NS 122 78*/
/*GS 122 70  AB 122 78 EC 112 62*/
/*HH 122 82*/
/*;*/
/*run;*/
/**/
/*ods select basicmeasures quantiles;*/
/*proc univariate data=BPressure;*/
/*   var Systolic Diastolic;*/
/*run;*/
/**/
/*ods select Modes;*/
/*proc univariate data=BPressure mode;*/
/*   var Systolic Diastolic;*/
/*run;*/
/**/
/*ods select ExtremeObs;*/
/*proc univariate data=BPressure;*/
/*   var Systolic Diastolic;*/
/*/*   id PatientID;*/*/
/*run;*/
/**/
/**/
/*ods select ExtremeObs;*/
/*proc univariate data=BPressure noprint;*/
/*   var Systolic Diastolic;*/
/*   id PatientID;*/
/*	output out=new  mean=systolicMean DiastolicMean;*/
/*   output out=StrengthStats mean=systolicMean DiastolicMean std=systolicstd Diastolicstd*/
/*                            min=systolicMin DiastolicMin   max=systolicMax DiastolicMax; */
/*run;*/
/**/
/*proc univariate data=BPressure;*/
/*   histogram Systolic Diastolic;*/
/*/*   id PatientID;*/*/
/*run;*/
