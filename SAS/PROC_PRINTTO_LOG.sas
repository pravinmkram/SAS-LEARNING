/*PROC PRINTTO PROCEDURE*/
The PRINTTO procedure defines destinations, other than 
ODS destinations, for SAS procedure output and for the 
SAS log. By default, SAS procedure output and the SAS 
log are routed to the default procedure output file and 
the default SAS log file for your method of operation.

/*Log print in external file*/

proc printto 
	log="F:\Jagan Sas_class2\outputs\testlog_&sysdate..log";
run;

data new;
set sashelp.class;
run;

data new1;
set sashelp.class;
where sex = 'M';
run;

proc sort data=sashelp.class out=tt;
by age;
run;

/*output print in external file*/
proc printto 
	print="F:\Jagan Sas_class2\outputs\new_&sysdate..rtf";
run;

proc print data=sashelp.class;
run;

proc means data=sashelp.class;
run;

proc sort data=sashelp.class out=class nodupkey;
by age;
run;

/*clears any information that exists in a file and prepares 
the file to receive the SAS log or procedure output.*/

proc printto 
	print="F:\Jagan Sas_class2\outputs\new_&sysdate..rtf"
		new;
run;

proc means data=sashelp.class;
var height;
run;

When no options are specified, the PROC PRINTTO stmt
does the following:

closes any files opened by a PROC PRINTTO statement
points both the SAS log and SAS procedure output to
their defaultdestinations.

Proc printto;
run;

/*Execute this prrogram and check the log & output window*/
proc means data=sashelp.class;
var height;
run;
