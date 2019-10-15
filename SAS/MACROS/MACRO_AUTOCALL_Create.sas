/*AUTOCALL Library*/
/*we can store our macros in a central location called as autocall library*/


/*Using Mstored sasmstore option we can store into required libraries*/

/*syntax: */
options mstored sasmstore=<autocall library>;

/*Mstored: this option instruct the SAS system that you want to make stored compiled macro */
/*programs avialble to our SAS Session*/

/*SASMSTORE: option is the libref that points to the SAS catalog containing the compiled*/
/*macro programs*/

libname viv 'E:\Jagan';

options mstored sasmstore=viv;


%macro new(dsn)/store;
data &dsn.;
set sashelp.class;
run;

proc print data=&dsn.;
run;
%mend;

/*Note: the above macro it will create new dataset & and print the dset*/

/*%new(new);*/

%macro new1(dsn,age)/store des="print program";
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc print data=&dsn.;
run;
%mend;

/*Note: the above macro it will create new dataset, based on age & and print the dset*/

libname viv1 'E:\Jagan\vivek';
options mstored sasmstore=viv1;

%macro new2(dsn,age)/store;
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc sort data=&dsn.;
by height;
run;
%mend;

/*Note: the above macro it will create new dataset, based on age & and sort the dset*/

%macro ans(dsn,age)/store;
data &dsn.;
set sashelp.class;
if age gt &age.;
run;

proc sort data=&dsn.;
by height;
run;

proc print data=&dsn.;
title "this is my autocall program";
title2 " crated for ANS team";
run;
%mend;

/*Note: the above macro it will create new dataset, based on age & and sort the dset &
and print the dset*/

%ans(te,12);

proc catalog c=viv1.sasmacr;
contents;
run;
quit;
