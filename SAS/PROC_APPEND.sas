/*PROC APPEND*/
/*The append procedure adds the observation from one sas dataset */
/*to end of the another dataset*/
/*syntax:*/
proc append base=libref.dataset1 data=libref.dataset2 force;
run;

data a;
input id name $ age;
cards;
100 jagan 34
200 surya 30
300 alekya 24
;
run;

data b;
input id name $ age;
cards;
600 jagan1 34
700 surya2 30
800 alekya3 24
500 surya2 30
600 alekya3 24
;
run;

data c;
input id name $ age;
cards;
600 jagan1 34
700 surya2 30
800 alekya3 24
500 surya2 30
600 alekya3 24
;
run;


/*NOte: the b dataset add at the bottom of the a dataset*/
proc append base=a data=b;
run;
/*or */
proc append base=a data=c;
run;

/*Variable order is different*/
data d;
input id name $ age;
cards;
600 jagan1 34
700 surya2 30
800 alekya3 24
;
run;

data e;
input id age name $;
cards;
600 34 jagan1 
700 34 surya2
800 34 alekya3
;
run;

proc append base=d data=e;
run;

/*Second example*/
/*different variables*/
data c;
input id name $ age loc $;
cards;
100 jagan 34 hyd
200 surya 30 bang
300 alekya 24 chen
;
run;

data d;
input id name $ age;
cards;
600 jagan1 34
700 surya2 30
800 alekya3 24
;
run;

/*BASE DATASET CONTAIN the variables but not in second dataset. */
/*we will get the warning message in the log*/
proc append base=c data=d;
run;

/*first execute the program and check the log, then execute the*/
/*with force option*/

proc append base=d data=c;
run;

proc append base=d data=c force;
run;

/*FORCE*/
/*this is an optional specification that forces proc append to*/
/*concatnate datasets. when we use this append the datasets force by*/
/*without checking any conditions like present variable, difference*/
/*in the variable datasets and length*/

data c;
input id name $ age loc $;
cards;
100 jagan 34 hyd
200 surya 30 bang
300 alekya 24 chen
;
run;

data d;
input id name $ age sex $;
cards;
600 jagan1 34 m
700 surya2 30 m
800 alekya3 24 f
;
run;

/*Execute this program and check the log*/
proc append base=c data=d;
run;

proc append base=c data=d force;
run;

proc append base=d data=c force;
run;

/*Example 4*/
/*different lengths are there for name variable*/
data c;
input id name $ age ;
cards;
100 jagan 34
200 surya 30
300 alekya 24
;
run;
data d;
input id name :$10. age;
cards;
600 jaganmohan 34
700 suryak 30
800 alekya 24
;
run;

proc append base=c data=d;
run;

proc append data=d base=c force;
run;

/*execute this program check the log*/
proc append base=d data=c;
run;
