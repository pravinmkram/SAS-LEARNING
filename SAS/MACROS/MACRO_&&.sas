/*TWO AMPERSANDS (&&)*/

/*The rules that the macro process uses to resolve macro variable reference that*/
/*conatain multiple &*/
/*1.macro variable references are resolved from left to right.*/
/*2.two && resolves to one ampersand(&).*/
/*3.multiple leading &(ampersand) cause the macro processor to rescan the references until*/
/*no more ampersand can be resolved.*/

options symbolgen;

%let n=3;
%let name3=jagan;

%put &n.;

%put &&name&n.;

/*--> &&|name|&n*/
/*--> &name3*/

/*&&name*/

%let n=3;
%let g=4;
%let nam=jag;
%let jag34=mba;

%put &&&Nam&N&G.;

%let n=3;
%let g=5;
%let nam=jag;
%let jag34=mba;

%put &&&Nam&N&G.;

/*&& | &nam | &n | &g*/
/*&jag35*/

data a;
set sashelp.class;
run;

%let row19=william;
%let row15=philip;
%let row9=Jeffrey;
%let a=19;

%put &row19.;

proc sql;
/*select strip(count(*)) into :ca  from sashelp.class;*/
select strip(put(count(distinct(name)),8.)) into :cnt from sashelp.class;
quit;

%put &&row&cnt.;

proc sql;
/*select strip(count(*)) into :ca  from sashelp.class;*/
select strip(put(count(distinct(name)),8.)) into :cnt from sashelp.class
where sex ='F';
quit;

%put &&row&cnt.;

proc sql;
/*select strip(count(*)) into :ca  from sashelp.class;*/
select strip(put(count(distinct(name)),8.)) into :cnt from sashelp.class
where age ne 14;
quit;

%put &&row&cnt.;


%let section2=new;
%let section3=old;
%let where=section;
%let n=2;
%let n1=3;

%put &&&where&n.;

/*&& | &where | &n ---&section2 ---new*/

%put &&&where&n1.;

/*&& | &where | &n1 ---&section3 ---old*/

%let a=b;
%let b=c;
%let c=a;

%put &a.;
%put &&a.;
/*&& |a ---&a*/

%put &&a.;

/*SYMBOLGEN:  && resolves to &.*/
/*SYMBOLGEN:  Macro variable A resolves to b*/

%put &&&a.;
&&|&a. ----&b ---c
/*SYMBOLGEN:  && resolves to &.*/
/*SYMBOLGEN:  Macro variable A resolves to b*/
/*SYMBOLGEN:  Macro variable B resolves to c*/

%put &&&&a.;
%put &&&&&a.;
