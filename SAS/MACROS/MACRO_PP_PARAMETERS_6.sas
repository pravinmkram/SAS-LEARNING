/*PARAMETERS*/
/*names one or more local macro variable which values you specify when you invoke */
/*the macro.*/

/*A parameters list can contain any no.of macro parameters and separated by commas. the*/
/*macro variables in the parameter list are usually referenced in the macro*/

/*Syntax*/
%macro macroname(par1, para2, ------- para-n);
program lines
----
----
%mend;

%macroname(par1, para2,-----paran);

/*two types of parameters*/
/*1. positional parameters 2.keywrord parameters*/

/*Specify one or more positional parameters we can specify in any order. but in the macro*/
/*invocation the order in which you specify the values must match the order*/

/*Note: If you define more than one p.p use a comma to separate the parameter*/



option mlogic symbolgen mprint;

%macro ale_nihs(out,dsn);
data &dsn.;
set sashelp.&out.;
run;
%mend;

%ale_nihs(class,test);

data tt;
set sashelp.class;
if age ge 14;
run;


%macro ale_nihs_1(out,dsn,age);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if age ge &age.; 
run;
%mend;

%ale_nihs_1(class,niha_al,15);


%macro ale_nihs_2(age,out,dsn);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if age ge &age.; 
run;
%mend;

%ale_nihs_2(13,class,niha_new);


%macro ale_nihs_3(out,gen,dsn);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if sex = "&gen."; 
run;
%mend;

%ale_nihs_3(class,F,fe_data);


%macro nihals3(gen,out,dsn,age);
data &dsn._1 &dsn._2;/*data niha_1 niha_2;*/
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen." then output &dsn._2;
run;
%mend;

%nihals3(F,class,niha,14);




%macro alekya2(gen1,out,dsn,age,gen2);
data &dsn._1 &dsn._2 &dsn._3; /*data alek_1 alek_2 alek_3;*/
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;
%mend;

%alekya2(F,class,alek,15,M);


%macro alekya3(gen1,out,dsn,age,gen2);
data &dsn._1(keep=name sex height)
		&dsn._2 (drop=name sex)
			&dsn._3(rename=(name=ename sex=gender)); 
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;
%mend;

%alekya3(F,class,alek,15,M);


%macro alekya3(gen1,out,dsn,age,gen2);
proc sort data=sashelp.&out. out=new;
by age;
run;

data &dsn._1(keep=name sex height)
		&dsn._2 (drop=name sex)
			&dsn._3(rename=(name=ename sex=gender)); 
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;

%mend;

%alekya3(F,class,alek,15,M);



/*	IMPORTING THE DATA FROM EXCEL file and multiples sheets IN BASE SAS*/

PROC EXPORT data=alek_1
	outfile='E:\SAS_FILES\nihals.xls'
	dbms=excel;
	sheet='a';
	run;

	PROC EXPORT data=alek_2
	outfile='E:\SAS_FILES\nihals.xls'
	dbms=excel;
	sheet='test';
	run;

	PROC EXPORT data=alek_3
	outfile='E:\SAS_FILES\nihals.xls'
	dbms=excel;
	sheet='test2';
	run;

	PROC ExPORT data=niha_1
	outfile='E:\SAS_FILES\nihals.xls'
	dbms=excel;
	sheet='test3';
	run;

	
%macro exporting(dsn,sheet);
	PROC EXPORT data=&dsn.
	outfile='E:\SAS_FILES\nihaswal.xls'
	dbms=excel;
	sheet="&sheet.";
	run;
%mend;

%exporting(alek_1,one);
%exporting(alek_2,test2);
%exporting(alek_3,test3);
%exporting(niha_2,test4);


%macro exporting(dsn,sheet,fname);
	PROC EXPORT data=&dsn.
	outfile="E:\SAS_FILES\&fname..xls"
	dbms=excel;
	sheet="&sheet.";
	run;
%mend;

%exporting(alek_1,one,nihals);
%exporting(alek_2,test2,vivek);
%exporting(alek_3,test33,nihals);
%exporting(niha_2,test44,vivek);


***************************************;
/*Keyword parameters*/
***************************************;

/*	Names one or more macro prameters followed by equal sign*/
/*NOTE: There is no limit define the keyword paramters.*/
/*keywors reference are separated by commas*/

%macro macroname(par2, para1, ------- para-n);
program lines
----
----
%mend;

%macroname(para2,para1,------paran);


/*Keyword paramenter syn*/
%macro macroname(par1=, para2=, ------- para-n=);
program lines
----
----
%mend;

%macroname(para1=xxx,para2=xxx,------paran=xxx);

%macroname(para-n=xxx,para1=xxx,------para2=xxx);


option mlogic symbolgen mprint;

%macro ale_nihs(out=,nih=);
data &nih.;
set sashelp.&out.;
run;
%mend;

%ale_nihs(nih=test,out=class);

data tt;
set sashelp.class;
if age ge 14;
run;


%macro ale_nihs_1(out=,dsn=,age=);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if age ge &age.; 
run;
%mend;

%ale_nihs_1(dsn=niha_al,age=15,out=class);


%macro ale_nihs_2(age=,out=,dsn=);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if age ge &age.; 
run;
%mend;

%ale_nihs_2(out=class,dsn=niha_new,age=13);


%macro ale_nihs_3(out=,gen=,dsn=);
data &dsn.;	/*dsn is the dataset name*/
set sashelp.&out.; /*here out is dataset name*/
if sex = "&gen."; 
run;
%mend;

%ale_nihs_3(out=class,dsn=fe_data,gen=F);


%macro nihals3(gen=,nn=,dsn=,age=);
data &dsn._1 &dsn._2;/*data niha_1 niha_2;*/
set sashelp.&nn.;
if age ge &age. then output &dsn._1;
if Sex = "&gen." then output &dsn._2;
run;
%mend;

%nihals3(gen=F,dsn=niha,age=14,nn=class);


%macro alekya2(gen1=,out=,dsn=,age=,gen2=);
data &dsn._1 &dsn._2 &dsn._3; /*data alek_1 alek_2 alek_3;*/
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;
%mend;

%alekya2(gen1=F,out=class,gen2=M,dsn=alek,age=15);


%macro alekya3(gen1=,out=,dsn=,age=,gen2=);
data &dsn._1(keep=name sex height)
		&dsn._2 (drop=name sex)
			&dsn._3(rename=(name=ename sex=gender)); 
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;
%mend;

%alekya3(gen1=F,out=class,dsn=alek,age=15,gen2=M);


%macro alekya3(gen1=,out=,dsn=,age=,gen2=);
proc sort data=sashelp.&out. out=new;
by age;
run;

data &dsn._1(keep=name sex height)
		&dsn._2 (drop=name sex)
			&dsn._3(rename=(name=ename sex=gender)); 
set sashelp.&out.;
if age ge &age. then output &dsn._1;
if Sex = "&gen1." then output &dsn._2;
if Sex = "&gen2." then output &dsn._3;
run;

%mend;

%alekya3(gen1=F,out=class,dsn=alek,age=15,gen2=M);


PROC EXPORT data=alek_1
	outfile='E:\SAS_FILES\nihalswa.xls'
	dbms=excel;
	sheet='niha';
	run;

	PROC EXPORT data=alek_2
	outfile='E:\SAS_FILES\nihalswa.xls'
	dbms=excel;
	sheet='swati';
	run;

	PROC EXPORT data=alek_3
	outfile='E:\SAS_FILES\nihalswa.xls'
	dbms=excel;
	sheet='alekya';
	run;

	PROC ExPORT data=niha_1
	outfile='E:\SAS_FILES\nihalswa.xls'
	dbms=excel;
	sheet='ans';
	run;

	
%macro ansmacro(dsn=,sheet=);
	PROC EXPORT data=&dsn.
	outfile='E:\SAS_FILES\nihaswa.xls'
	dbms=excel;
	sheet="&sheet.";
	run;
%mend;

%ansmacro(dsn=alek_1,sheet=niharika);
%ansmacro(dsn=alek_2,sheet=swati);
%ansmacro(dsn=alek_3,sheet=alekya);
%ansmacro(dsn=niha_1,sheet=ans);
%ansmacro(dsn=niha_2,sheet=ans2);

