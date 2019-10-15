/*PROC SQL*/

/*HOW TO CREATE THE MACRO VARIABLE IN PROC SQL*/
/*PROC SQL through INTO CLAUSE*/

data raw; 
   input region $ state $ month monyy5. 
         headcnt expenses revenue; 
   format month monyy5.; 
   cards; 
Eastern  VA FEB78  10  7800 15500 
Southern FL MAR78   9  9800 13500 
Southern GA JAN78   5  2000  8000 
Northern MA MAR78   3  1500  1000 
Southern FL FEB78  10  8500 11000 
Northern NY MAR78   5  6000  5000 
Eastern  VA MAR78  11  8200 16600 
Plains   NM MAR78   2  1350   500 
Southern FL JAN78  10  8000 10000 
Northern NY FEB78   4  3000  4000 
Southern GA FEB78   7  1200  6000 
; 
run; 

/*SYntax to create the macro var in proc sql*/
PROC SQL;
select varname into :macrovarname from table;
run;


/*INto clause*/
PROC SQL;
select region into :ans from raw;
run;

%put region name &ans.;

PROC SQL;
select state into :ans from raw;
run;

%put region name &ans.;

/*Distinct means it will take the unique values*/
/*I want see the unique region name*/
PROC SQL;
select distinct(region) into :rname from raw;
quit;

%put region name &rname.;

/*It will print the all region names in log window and each values separated by blanks*/
PROC SQL;
select region into :rname  separated by ' ' from raw;
quit;


%put region name &rname.;


PROC SQL;
select distinct(state) into :rname separated by ' ' from raw;
quit;

%put region name &rname.;


/*It will print the all region names in log window and each values separated by comma*/
PROC SQL;
select region into :rname  separated by ',' from raw;
quit;

%put region name &rname.;

PROC SQL;
select region into :rname1-:rname11  from raw;
quit;

%put region name &rname1. &rname2. &rname5. &rname8. &rname11.;


PROC SQL;
select expenses into :exp from raw;
quit;

%put region name &exp.;

/*It will print the all region names in log window and each values separated by blanks*/
PROC SQL;
select expenses into :exp separated by ',' from raw;
quit;

%put region name &exp.;



/*First it will extract all distinct records for headcnt then it will take headcnt*/
/*more than 5*/

PROC SQL;
select distinct(headcnt) into :exp separated by ',' from raw
	where headcnt gt 5;
quit;

%put region name &exp.;

data raw1;
set raw;
if headcnt in (&exp.);
run;


/*First it will extract where condition and  consider the distinct records for headcnt*/

PROC SQL;
select distinct(headcnt) into :exp separated by ',' from raw
	where expenses ge 6000;
quit;

%put region name &exp.;


option mprint mlogic symbolgen;
data raw1;
set raw;
if headcnt in (&exp.);
run;


/*FOR CHARACTER VARIABLE*/
/*First it will extract where condition and  consider the distinct records for headcnt*/
PROC SQL;
select distinct(quote(region)) into :reg separated by ',' from raw
	where expenses ge 6000;
quit;

%put region name &reg.;


option mprint mlogic symbolgen;
data raw1;
set raw;
if region in (&reg.);
run;


/*CREATING THE MACROS FOR MULIPLE VARIABLES*/
PROC SQL;
select region, state into :rname , :state from raw;
quit;


%put region name is &rname. and &state.;


/*Create the muliple macro variables for multiple names*/
PROC SQL;
select region, state into :rname1-:rname11 , :state from raw;
quit;


%put &rname1. &rname5. &rname8. &state.;


PROC SQL;
select region, state into :rname1-:rname11 , :state1-:state11 from raw;
quit;


%put &rname1. &state1. &rname5. &state5. &rname8. &state8.;

%put &rname1. &rname2. &rname3. &rname4. &rname5. &rname6. &rname7. &rname8. &rname9. 
	&rname10. &rname11.;


	
proc sql;
select count(*) into :cnt from raw;
run;

%put in my current dataset count is &cnt.;

/*Converting from char to numeric*/
%let cn=%sysfunc(putn(&cnt,2.));
%put &cn.;


PROC SQL;
select region, state into :rrname1-:rrname&cn. , :state1-:state&cn. from raw;
quit;

%put &rrname1. &rrname3.;
