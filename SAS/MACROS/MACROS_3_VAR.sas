/*BASE SAS*/
data new;
set sashelp.class;
where age = 14;
run;

proc sort data=new out=new_2;
by name;
run;

proc print data=new_2;
run;

/*%let: Creates macro variables and assign a value*/

/*syntax: %let macrovarname = macro-var-value;*/

/*MACRO PROGRAM*/
%let dsn = jm;

data &dsn.;
set sashelp.class;
where age=14;
run;

proc sort data=&dsn. out=&dsn._2;
by name;
run;

proc print data=&dsn._2;
run;



/*global & local macro variable*/

/*%global: macro variable is global. if it is defined opencode outside. A global macro*/
/*variable is available during the execution of the entire sas session*/
/*Syntax: %global a;*/

/*%local: if it is defined inside macro. it is available during the execution of */
/*particular macro */
/*Syntax: %local b;*/


%let name1=niha;

%macro new;
%let name1=swati;
%put &name1.;
%mend;

%put my name is &name1.;

%new;

%put my name is &name1.;


/*example2*/
%let x=10;

%macro new;
%let x=20;
%put &x.;
%mend;

%put my values is &x.;

%new;

%put my name is &x.;


/*LOCAL VARIABLE*/
%let name2=alekya;

%macro new;
%local name2;
%let name2=bunti;
%put &name2.;
%mend;

%put my name is &name2.;

%new;

%put my name is &name2.;

/*Example3*/

%let name3=lucky;

%macro new;
%local name3;
%let name3=vineela;
%put &name3.;
%mend;

%put my name is &name3.;

%new;

%put my name is &name3.;

/*GLOBAL MACRI VARIABLE DEFINED*/
/*example3*/
%let name4=lucky;

%macro new1;
%global name4;
%let name4=enjoy;
%put &name4.;
%mend;

%put my name is &name4.;

%new1;

%put weekend &name4.;

/*another example*/
%let x=10;

%macro new_1;
%global x;
%let x=20;
%put &x.;
%mend;

%put my values is &x.;

%new_1;

%put my value is &x.;
