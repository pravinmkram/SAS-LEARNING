/*MACRO DEBUGGING*/

/*MERROR*/
/*SERROR*/
/*MLOGIC*/
/*MPRINT*/
/*SYMBOLGEN*/

/*MERROR:When this option is using SAS will issue a warinng, if you invoke a macro that SAS*/
/*Cann't find*/

option MERROR;

%macro nihswaalekk(d1,d2,cond);
data &d1.;
set d2.;
if &cond.;
run;
%mend;

%nihswaaleekk(new,sashelp.class,%str(sex='F'));

option NOMERROR;

%macro nihswaalek(d1,d2,cond);
data &d1.;
set &d2.;
where &cond.;
run;
%mend;

%nihswaaleek(new,sashelp.class,%str(sex='F'));

%nihswaalek(new,sashelp.class,%str(sex='F'));

/*WARNING: Apparent invocation of macro VIVEKK not resolved.*/

/*Note: Why because we created a macro called nihswaalek but while invoking we 
specifies nihswaaleek.*/

/*SERROR:When this option is using SAS will issue a warinng, if you use a macro variable
that SAS Cann't find*/

option SERROR;

%macro vivek(d1,d2,cond);
data &d1.;
set &dd2.;
if &cond.;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

/*WARNING:Apparent symbolic reference DD2 not resolved*/

option NOSERROR;

%macro vivek(d1,d2,cond);
data &d1.;
set &dd2.;
if &cond.;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));


option NOSERROR;

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));


/*MLOGIC:	When this option is using, SAS print in log window about the execution of macros*/
/*and macro variables*/

option MLOGIC NOSERROR;
/*option NOMLOGIC NOSERROR;*/

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

option NOMLOGIC;
/*option NOMLOGIC NOSERROR;*/

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));


/*MPRINT:	When this option is using, SAS prints in log window about the standard SAS code*/
/*genarated by macro processor*/

option NOMLOGIC MPRINT ;

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

option NOMLOGIC NOMPRINT ;

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

/*SYMBOLGEN:When this option is using, SAS prints in log window the values of macro resolved*/
/*genarated by macro processor*/


option Symbolgen;

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
run;

proc print data=&d1._2;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

option MLOGIC MPRINT SYMBOLGEN;

%macro vivek(d1,d2,cond);
data &d1.;
set &d2.;
if &cond.;
run;

PROC sort data=&d1. out=&d1._2;
by name;
run;

proc print data=&d1._2;
run;
%mend;

%vivek(new,sashelp.class,%str(sex='F'));

/*How to delete the macro variables*/
/*%symdel: Deletes the specified variables from macro symbol tables*/

/*Syntax:*/
%symdel variablename/options;

%let name=nihaswaale;

%put &name.;

/*Delete the macro variable here*/
%symdel name;


%put &name.;

/*example 2*/
%let age=30;

%put my age is &age.;

/*Delete the macro variable here*/
/*executin three macro and see the log and execute one by one*/
%symdel age;

%symdel age;

%symdel age/nowarn;


%put my age is &age.;
