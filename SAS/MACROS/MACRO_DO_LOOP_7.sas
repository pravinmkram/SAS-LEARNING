data a_1 a_2 a_3;
set sashelp.class;
if age in (11,12,15,16) then output a_1;
if sex ='M' then output a_2;
if sex ='F' then output a_3;
run;


%let n=1;
%let shya=3;

%macro knr();
/*data _null_;*/
/*call symputx('n',n);*/
/*run;*/

%do i = 1 %to &shya.;

proc append base=ba data=a_&i. force;
run;

proc export data=a_&i.
	outfile="E:\Jagan\exist\output.xls"
	dbms=xls;
	sheet="a_&i.";
	run;

/*	%let n=%sysevalf(&n+1);*/
%end;

%mend;
%knr();


/*The above program it will execute 3 times*/
/*it will append the dataset & export the datasets to excel into different sheets*/

%macro nn(dset,path);
data &dset.;
infile "&path." dlm='&';
input name $ sex $ age height weight;
run;
%mend;

%nn(one,%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt));

%macro nn1(dset,path,dlm);
data &dset.;
infile "&path." &dlm.;
input name $ sex $ age height weight;
run;
%mend;

%nn1(one,%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt),%str(dlm='&'));

%nn1(two,%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt),%str(dlm='&' firstobs=5));

%nn1(three,%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt),
	%str(dlm='|' firstobs=5 obs=10));

%nn1(%str(four(keep=name sex)),%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt),
	%str(dlm='&' firstobs=5 obs=10));

/*Note:*/
/*1.IT will import the & delimeter file and create the dataset */
/*2.IT will import the & delimeter file and create the dataset from 5th observation*/
/*3.IT will import the | delimeter file and create the dataset from 5th to 10 observation*/
/*4.IT will import the & delimeter file and create the dataset from 5th to 10 observation and*/
/*keep only name sex variables.*/

%macro nn(path);
%do i = 1 %to &shya.;
data dset_&i.;
infile "&path." dlm='&';
input name $ sex $ age height weight;
run;
%end;
%mend;

%nn(%str(C:\Users\kantha\Desktop\JAGAN_Sas_class\test.txt));

