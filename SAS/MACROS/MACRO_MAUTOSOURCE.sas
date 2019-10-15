/*MAUTOSOURCE SASAUTOS*/

options mautosource sasautos=libref path;

/*mautosource: It means the macro processor to serach autocall library for a file with the*/
/*requested name when a macro has been invoked, but not compiled */

/*SASAUTOS:Specifies the location of one or more autocall libraries*/


options mautosource sasautos=('E:\Jagan'
									'D:\vivek\sha' 'E:\Jagan\vivek') mprint symbolgen;


%new2(ttt,13);

%new1(new,13);

/*%ans(te,12);*/

/*NESTED MACRO*/

/*Macros can call other macros*/


%macro print(dsn);
proc print data=&dsn.;
run;
%mend;


%macro sha(dsn,hei);
proc sort data=sashelp.class out=&dsn.;
by &hei.;
run;

%print(&dsn.);

%mend;

%sha(jagan,height);


/*Second example*/

%macro sort(dsn);
proc sort data=&dsn. out=&dsn._2;
by height;
run;
%mend;


%macro sha1(dsn,age);
data &dsn.;
set sashelp.class;
if age gt &age. ;
run;

%sort(&dsn.);
%print(&dsn._2);

%mend;

%sha1(jagan,13);



/*In three ways we can call external macros.*/

/*1.%include*/
/*2.mstored*/
/*3.MAUTOSOURCES*/
