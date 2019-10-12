/*PROC FREQ*/

/*the freq procedure produces one-way to n-way frequency and*/
/*crosstabulations tables*/


PROC FREQ DATA=DATASETNAME OPTIONS;
BY VARIABLES;
TABLES VAR1 VAR2*VAR/OPTIONS;
WEIGHT VARIABLES;
OUTPUT OUT/OPTIONS;
RUN;

/*BY: CALCULATE SEPARATE FREQUENCY OR CROSS TABULATION TABLES FOR*/
/*EACH BY GROUP*/
/*TABLES:  SPECIFIES FREQUENCY OR CROSS TABULATIONS TABLES AND */
/*REQUEST TESTS;*/
/*OUTPUT: CREATE AN OUTPUT DATASET THAT CONTAIN SPECIFICE DATA*/
/*WEIGHT: IDENTIFIES A VARIABLES WITH VALUES THAT WEIGHT EACH*/
/*OBSERVATION*/

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


proc sort data=raw out=raw2;
by region state;
run;

/*It will print all variables frequecny in i/p dataset*/
proc freq data=raw;
run;

proc freq data=raw;
tables region;
title "It's print only region count";
run;

proc freq data=raw;
tables state;
title "It's print only state count";
run;

proc freq data=raw;
tables region state;
title "It's print region & state count";
run;

proc freq data=raw;
tables region state region*state;
title "It's print region & state count";
run;

proc freq data=raw;
tables region state region*state/out=freq_1;
run;

proc freq data=raw;
tables region state region*state/out=freq_1;
weight expenses;
run;

/*IT will calculate the frequency based on revenue*/
proc freq data=raw;
tables region state region*state/out=freq_2;
weight revenue;/*we need to mention numeric variables here*/
run;

/*IT will calculate the frequency based on revenue*/
proc sort data=raw out=raw3;
by region;
run;

proc freq data=raw3;
tables state/out=freq_1;
weight expenses;
run;

proc freq data=raw3 page;
by region;
tables state/out=freq_1;
weight expenses;
run;

ods pdf file='F:\JAGAN Sas_class\bhartath\freq.pdf';
proc freq data=raw3 page;
by region;
tables state/out=freq_1;
weight expenses;
run;
ods pdf close;

/*nocum:Suppress the display of cumulative frequencies and cumulative*/
/*percentages for one-way frequency tables and cross tabulations*/
/*tables.*/

/*Nopercent: Suppress the display cell percentages, row toal percentages*/
/* and column total percentages for cross tabulations tables*/

/*Sparse: This option include zero cell frequencies in the o/p dset*/

/*After executing this you can compare the t5 & t6 dataset*/
proc freq data=raw3;
tables region/out=t1 nocum nopercent;
tables state/out=t2;
tables month/out=t3;
tables region*state/out=t5;
tables region*state/out=t6 sparse;
weight expenses;
run;

/*Plots: This option request frequency plots for the tables;*/
/*Type=dotplot this is specified dotplots. by default frequency
plots are produced as bar charts.*/
/*ods grphics must be enabled before producing plots*/

ods graphics on;
proc freq data=raw;
tables region state region*state/plots=freqplot;
weight expenses;
run;
ods graphics off;

ods graphics on;
proc freq data=raw;
tables region state region*state/plots=freqplot (type=dotplot);
weight expenses;
run;
ods graphics off;

/*scale=percent : plot option plots percentages instead of
frequncy count*/
ods graphics on;
proc freq data=raw;
tables region state region*state/plots=freqplot (type=dotplot
	scale=percent);
weight expenses;
run;
ods graphics off;
