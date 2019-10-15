/*Functions in MACRO*/

/*%sysfunc:*/

/*Execute sas functions or user written fucntions. if we are using any base sas function in */
/*macros that should be call with %sysfunc*/

options mprint mlogic symbolgen;
/*syntax:*/
%sysfunc(function(argument));

/*Today's date*/
data a;
dt=today();
format dt date9.;
run;

%let tdt = %sysfunc(Today(),date9.);

%put &tdt.;

/*I want to get the month name*/
%let mon = %sysfunc(substr(%sysfunc(Today(),date9.),3,4));
%put &mon.;

%let tdate = %sysfunc(Today(),date9.);
%let mon = %sysfunc(substr(&tdate,3,3));
%put &mon.;

%let yr = %sysfunc(substr(&tdate,6,4));
%put &yr.;

/*SCAN FUNCTION*/
%let mth = %sysfunc(scan(jan feb mar,3));
%put &mth.;

%let mth = %sysfunc(scan(jan|feb|mar,2,'|'));
%put &mth.;

%let mth = %sysfunc(scan(jan|feb|mar,3,'|'));
%put &mth.;

%let lth = %sysfunc(length(niharikaswatialek));
%put length is &lth.;

/*UPCASE & LOWCASE & PROPCASE*/
%let lth = %sysfunc(upcase(vivek sha));
%put MY NAME IS &lth.;

%let lcase= %sysfunc(lowcase(&lth.));
%put &lcase.;

%let lth = %sysfunc(propcase(vivek sha));
%put MY NAME IS &lth.;

/*Intnx*/

%let mth=%sysfunc(intnx(month,"&sysdate."d,0),date9.);
%put &mth.;

%let mth=%sysfunc(intnx(month,"&sysdate."d,0),date7.);
%put &mth.;

%let mth=%sysfunc(intnx(month,"&sysdate."d,0),yymmddn8.);
%put &mth.;


%let mth=%sysfunc(intnx(month,"&sysdate."d,1),yymmddn8.);
%put &mth.;

%let mth1=%sysfunc(intnx(month,"&sysdate."d,-24),date9.);
%put &mth1.;

%let mth1=%sysfunc(intnx(month,"&sysdate."d,-12),date9.);
%put &mth1.;

%let mth1=%sysfunc(intnx(days,"&sysdate."d,-24),date9.);
%put &mth1.;

%let mth1=%sysfunc(intnx(week,"&sysdate."d,-12),date9.);
%put &mth1.;

%let mth=%sysfunc(intnx(year,"&sysdate."d,-2),date9.);
%put &mth.;


data b;
input id name $ age gender $ sal dob date9. doj;
/*informat doj :ddmmyy10.;*/
informat dob date9. doj date9.;
format dob date9. doj date9.;
cards;
100 jagan 23 m 50000 30jan2009 15jan2017
200	surya 34 m 40000 30mar2008 27mar2008
300 RAMYA 33 f 55000 30dec2008 03jan1981
400 vivek 33 m 60000 23jul2008 28feb1976
1300 vinel 29 f 55000 30dec2008 03jan1981
2400 sivak 28 m 62000 23feb1976 28feb1976
3200 vinay 30 f 75000 30dec1984 03jan1999
4200 vijay 32 m 64000 23feb1976 28feb1996
4201 vijaya 33 m 64000 23feb2007 28feb1996
4202 vijay1 34 m 64000 23feb1976 28feb1996
4203 vijay2 35 m 64000 23feb2007 28feb1996
;
run;

/*I need to get the last 12 months data*/
%let mth1=%sysfunc(intnx(month,"&sysdate."d,-12),date9.);
%put &mth1.;

%let mth2=%sysfunc(intnx(month,"&sysdate."d,0),date9.);
%put &mth2.;


data c;
set b;
if "&mth2."d > dob > "&mth1."d;
run;

/*I need to get the last 24 months data*/
%let mth1=%sysfunc(intnx(month,"&sysdate."d,-24),date9.);
%put &mth1.;

%let mth2=%sysfunc(intnx(month,"&sysdate."d,0),date9.);
%put &mth2.;


data d;
set b;
if "&mth2."d > dob > "&mth1."d;
run;


/*I need to pull the last 12 weeks data*/
%let mth1=%sysfunc(intnx(week,"&sysdate."d,-12),date9.);
%put &mth1.;

%let mth2=%sysfunc(intnx(month,"&sysdate."d,0),date9.);
%put &mth2.;


data e;
set b;
if "&mth2."d > dob > "&mth1."d;
run;

%let mth1=%sysfunc(intnx(week,"&sysdate."d,-12),date9.);
%put &mth1.;

data e;
set b;
if "&mth2."d > dob > "&mth1."d;
run;


%let a=10;
%let b=15;
%let c=&a+&b;

%put &a &b &c.;

/*%eval : evaluates arithemetic and logical expression using integer arithmetic*/

%let d=%eval(&a+&b);
%put &d.;


%let a=10.5;
%let b=15.3;
%let c=%eval(&a+&b);

%put &a &b &c.;

/*%sysevalf:evaluates arithemetic and logical expression using floating point numeric/integer*/

%let c=%sysevalf(&a+&b);

%put &a &b &c.;

%let c=%sysevalf(&a+&b,ceil);
%let d=%sysevalf(&a+&b,floor);

%put &a &b &c &d;

%let a=jagan;
%let b=mohan;

%let name =%sysfunc(catt(&a,&b));
%put &name.;
