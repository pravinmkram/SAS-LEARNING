/*NESTED MACRO*/

/*MACROs CAN call other macros*/

%macro print(dsn);
PRoc print data=&dsn.;
title 'CAlling nested macro';
run;
%mend;


%macro sort(dsn,var);
proc sort data=sashelp.&dsn. out=&dsn.;
by &var.;
run;

%print(&dsn.);
%mend;


%sort(class,sex);

/*Example-2*/

%macro exporting(dsn,sheet);
PROC EXPORT data=&dsn.
	outfile='E:\SAS_FILES\nihaswal.xls'
	dbms=excel;
	sheet="&sheet.";
	run;
%mend;


%macro sorting(dsn,var);
proc sort data=sashelp.&dsn. out=&dsn.;
by &var.;
run;

%print(&dsn.);

%exporting(&dsn.,test);

%mend;

options mlogic mprint symbolgen;
%sorting(class,sex);


/*example3*/

%macro swati(dsn,age);
data &dsn.;
set sashelp.class;
if age > &age.;
run;

%exporting(&dsn.,swati);

%print(&dsn.);



%mend;

%swati(new_s,14);
