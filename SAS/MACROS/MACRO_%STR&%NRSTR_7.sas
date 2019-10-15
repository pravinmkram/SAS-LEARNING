/*MACRO QUOTING */

/*%str, %nrstr, --Compilation time it wll resolve*/
/*%BQUOTE, %NRBQUOTE --- execution it will resolve*/

/*%str, %nrstr mask special characters at the time of compilation*/

/*Special characters: blank ) ( = * , ' " < > ~  ; + - / */
/*mnemoic operator :and or eq gt lt ge le ne not in*/

%nrstr having additional two special character &, % symbol

%let  new = proc print data=new;run;

%put &new.;

%let  new1 = %str(proc print data=new;run;);

%put &new1.;

%LET new2=%substr(jan,feb,mar,5,3);
%put &new2.;

%LET new3=%substr(%str(jan,feb,mar),5,3);
%put &new3.;

%LET new4=%substr(%str(jan,feb,mar),9,3);
%put &new4.;

%let rep1=%str(jan&feb %sales data);
%put &rep1.;

%let rep=%nrstr(jan&feb %sales data);
%put &rep.;


data a;
set sashelp.class;
run;

data dsn;
set sashelp.class ;
if age in (14,15);
run;


option mprint mlogic symbolgen;

/*I need to get the data whichever age is 14 or 15*/
%macro vivek1(out,dsn,age);
data &dsn.;
set sashelp.&out.;
if age in (&age.);
run;
%mend;

/*execute the below line and see the log*/
%vivek1(class,test1,14,15);

/*execute the below line and see the log*/
%vivek1(class,test1,%str(14,15));

%macro vivek2(out,dsn,age);
data &dsn.;
set sashelp.&out.;
if name in (&age.);
run;
%mend;

/*execute the below line and see the log*/

%vivek2(class,test1,'Janet','Mary','William');

/*execute the below line and see the log*/

%vivek2(class,test1,%str('Janet','Mary','William'));


/*Difference between %STR & %nrstr*/
%let nname = William;

/*using the %str and see the log & test1 dataset*/

%vivek2(class,test1,%str('Janet','Mary',"&nname."));

/*%vivek2(class,test1,%nrbquote('Janet','Mary','William'));*/

/*using the %nrstr and see the log & test1 dataset*/

%vivek2(class,test1,%nrstr('Janet','Mary',"&nname."));


%macro vivek3(out,dsn,age);
data &dsn.;
set sashelp.&out.;
if name in (&age.);
run;

&new1.;

%mend;

%vivek3(class,new,%str('Janet','Mary',"&nname."));


%let  new10 = %bquote(proc print data=new;run;);

%put &new10.;

%let rep2=%bquote(jan&feb %sales data);
%put &rep2.;

%let rep=%nrbquote(jan&feb %sales data);
%put &rep.;

%let rep3=%nrstr(jan&feb %sales data);
