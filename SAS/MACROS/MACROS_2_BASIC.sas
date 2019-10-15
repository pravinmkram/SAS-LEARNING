/*MACRO STATEMENT*/

%macro : Begins a macro definition.

Syntax: %macro macro-name(parameters1,parameters2------parametersn);
%macro macro-name();

%mend: ends a macro deifinition
%syntax: %mend; or %mend macro-name;


Note:-If you specify a macro name with %Mend Statement that name should be match with %Macro
Statement. It means both names should be same

Macro-name is a name you make up for your macro. The name must follow standard SAS naming 
conventions.

Macro name must start with a letter or _(underscore) and continue with eiether letters, 
numbers & _(underscore)	and can be up to 32 characters length


/*THE GENERAL FORM OF MACRO*/

Between %Macro and %Mend you can put any statements you want. The general form of a macro
is

Syntax: 

%macro test or _test or test_1 (para-1,para-2---para-n);
program;
program;
program;
----
----
%mend test or _test or test_1; /*Here macro-name is not necessary*/


%macro test();
program;
program;
program;
----
----
%mend;

/*Invoking macro */
/*After creating a macro, we can invoke it by adding the percent symbol or sign(%) infront */
/*of macro name*/

Interview question: What is the invoking macro ?

%test;
%test(dset,var,var2,var3);


%macro ansb_j();
 data new;
 set sashelp.class;
 run;

 proc sort data=new out=new1;
 by sex;
 run;

 proc print data=new1;
 run;

%mend;

%ansb_j;


%macro nih_sw_ale(dset,var);
 data &dset._1;
 set sashelp.class;
 run;

 proc sort data=&dset._1 out=new3;
 by sex;
 run;

 proc print data=new3;
/* where age ge &var.;*/
/* where age ge 13;*/
 run;

 %mend;

%nih_sw_ale(test,13);
%nih_sw_ale(alekya,14);


%macro nih_sw_ale_1(dataset,var);
 data &dataset._1;	
 set sashelp.class;
 run;

 proc sort data=&dset._1 out=new3;
 by sex;
 run;

 proc print data=new3;
	where sex = "&var.";
run;

 %mend;

%nih_sw_ale_1(ans,F);

%nih_sw_ale_1(jagan,M);


/* %include*/
/*It is used to include SAS MACRO program in another SAS files or program*/

%include "paht\programname.sas";



/* creating a macro varaible*/
%let name=jagan;
%let age=15;
%let location= chennai;
%let nihswaale = hyderabd;

/* Print macro variables that are created by the USER*/

%put _user_;

%put _automatic_;



/*prints all user defined & system defined variables*/

 %put _all_;


