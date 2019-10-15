options mprint mlogic symbolgen;
/*%let dsname=sashelp.class;*/

libname nn "E:\Jagan\exist";
%let dsname=nn.ab;

%macro opends(name);
%if %sysfunc(exist(&name)) %then
   %do;

	libname nn "E:\Jagan\exist";

	data nn.alekya nn.swati nn.nihar;
	set sashelp.class;
	run;

	data nn.anteadm;
	set sashelp.class;
	where age > 14;
	run;

	%end;

%else 

	%put Data set &name. does not exist.;

%mend opends;
%opends(&dsname);

/*second example*/
%let testfile = 'E:\Jagan\exist\Alekya.txt';            

%macro opends(name);
%if %sysfunc(fileexist(&name)) %then
   %do;

	libname nn "E:\Jagan\exist";

	data nn.alekya nn.swati nn.nihar;
	set sashelp.class;
	run;
	%end;
   %else 

%put ======DATA SET &name DOES NOT EXIST. ANS TEAM WANT CREATE THE FILE;
%mend opends;
%opends(&testfile);


libname nn "E:\Jagan\exist";
%let dsname=nn.abc;

%macro QC(name);

%top:
%if %sysfunc(fileexist(&name)) %then
   %do;

	libname nn "E:\Jagan\exist";

	data nn.nnnn nn.nnnn1 nn.nnnn22;
	set sashelp.class;
	run;
	%end;
   %else 
		%do;
		%do;
			data _null_;
			dt=datetime();
			do while (datetime() < dt+30);
			continue;
			end;
			run;
		%end;
	%goto top;

	%end;

%mend qc;
%QC(&testfile);


/*libname nn "E:\Jagan\exist";*/
/*%let dsname=nn.abcd;*/

%macro QC(name);

%top:
%if %sysfunc(fileexist(&name)) %then
   %do;

	libname nn "E:\Jagan\exist";

	data nn.ansteam;
	set sashelp.class;
	run;
	%end;
   %else 
		%do;
		%do;
			data _null_;
			dt=datetime();
			do while (datetime() < dt+30);
			continue;
			end;
			run;
		%end;

		%let Currtime =%sysfunc(time(),tod5.2);
		%put &currtime.;

		%if &currtime. gt 00:51 %then %goto exit;
	%goto top;
%exit:
%end;

%mend qc;
%QC(&testfile);

