/*Combining datasets*/

/*1.Concatenation 2. Interleaving 3. Merge*/
/*4.Update   5. Modify*/

/*Concatenations:*/
/*Combinig two or more sas dataset into single SAS dataset one after*/
/*other using set statement.*/

/*1.the no.of observation in new dataset is equal to the sum of the*/
/*no.of observation from original datasets. */
/*2.the second dataset obseration followd by the first dataset */
/*observations.*/

/*Syntax: Set datasets;*/
/**/
/*IF original datasets contains same variables, the variables in new*/
/*dataset are same as the varibles in the original*/

data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

data ds;
set dset1 dset2;
run;

data ds1;
set dset2 dset1;
run;

/*If original datasets contain diff varaibles, observation from one */
/*dset having missig values for variables in new daset*/
data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

data ds2;
set dset1 dset2;
run;

data ds2;
set dset2 dset1;
run;

data dset2;
input id name $ age sal loc $;
datalines;
500 swati 34 45000 hyd
600 vijaya 32 54000 bang
700 divya 33 53000 che
800 lakshmi 22 15000 delhi
900 alekya 22 5000 delhi
;
run;

data ds4;
set dset1 dset2;
run;


data ds5;
set dset2 dset1;
run;

IF orinal datasets contain diff length for vairables concatenation done.
Note: The length for new dset variable is equal to the first dset
variable length in set stmt

data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $10. age loc $;
datalines;
500 swatikiran 34 hyd
600 vijayasrik 32 bang
700 divyasrikk 33 che
800 lakshmittt 22 delhi
900 alekyaraok 22 delhi
;
run;

/*Execute this program and check the log & output dset*/
data ds6;
set dset1 dset2;
run;

data ds6_1;
length name $10.;
set dset1 dset2;
run;

data ds8;
set dset2 dset1;
run;

/*Differnt datatypes*/
/*IF orignal datasets contain diff data types for variables, so*/
/*concatenation won't happen*/

data dset1;
input id $ name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data dset2;
input id name $ age sal loc $;
datalines;
500 swati 34 45000 hyd
600 vijaya 32 54000 bang
700 divya 33 53000 che
800 lakshmi 22 15000 delhi
900 alekya 22 5000 delhi
;
run;

/*Execute this program and check the log */
data ds9;
set dset1 dset2;
run;

/*Note:*/
/* It will give the error because of id var variable has defined as*/
/* char and numeric*/

So first we have to convert id from character to numeric datatype
using the input fucntion

So first we have to convert id from numeric to character datatype
using the put fucntion

/*Convert the data type and create the new variable*/
data dset_1;
set dset1;
id_1=input(id,3.);
run;

/*Convert the data type and create the new variable and drop the */
/*old variable*/
data dset_1(drop=id);
set dset1;
id_1=input(id,3.);
run;

/*Convert the data type and create the new variable and drop the */
/*old variable. and rename the variable name as old variable name*/

data dset_1(drop=id rename=(id_1=id));
set dset1;
id_1=input(id,3.);
run;

data ds9;
set dset_1 dset2;
run;

/*converting from numeric to char*/
data dset_2(drop=id rename=(id_1=id));
set dset2;
id_1=put(id,8.);
run;

data ds10;
set dset1 dset_2;
run;


/*Concatenate with options*/
data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
900 alekya 22 delhi
;
run;

data d1;
set dset1(keep=id name) dset2;
run;


data d2;
/*retain id name age loc;*/
set dset1(keep=id age) dset2;
run;


data d2;
set dset1(keep=id age) dset2(drop=id age);
run;

data d3;
set dset1(keep=id age) dset2(keep=id age);
run;


data d3;
set dset1(firstobs=3) dset2(keep=id age);
run;

data d3;
set dset1(firstobs=3) dset2(firstobs=2);
run;

data d4;
set dset1(obs=4) dset2(firstobs=2 obs=4);
run;

data d5;
set dset1(rename=(id=id1)) dset2(firstobs=2 obs=4);
run;

data d5;
set dset1(rename=(id=id1)) dset2(firstobs=2 obs=4 rename=(id=id1));
run;

******************************************;
/*Concatenation with multiple set stmts*/
******************************************;

combine obserations from 2 or more sas datasets into a one obs
using two or more set stmt.
The new dataset contains all variables from all i/p datasets

Syntax: set dataset1;
		set dataset2;
		set datasetn;


/*Both datasets contains same variables and same no.of obseratins*/

data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
;
run;

data dset2;
input id name $ age loc $;
datalines;
500 swati 34 hyd
600 vijaya 32 bang
700 divya 33 che
800 lakshmi 22 delhi
;
run;

/*Execute this program and check the log and o/p dataset*/
data new;
set dset1 dset2;
run;

/*Execute this program and check the log and o/p dataset*/
data new1;
set dset1;
set dset2;
run;

/*Both datasets contains different variables and same no.of obs*/
data dset1;
input id name $ age loc $ sex $;
datalines;
100 jagan 34 hyd m
200 vijay 32 bang m
300 surya 33 che m
400 kiran 22 delhi m
;
run;

data new1;
set dset1;
set dset2;
run;

/*Both datasets contains same variables and diff no.of obs*/
data dset1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
500 kiran 22 delhi
600 kiran 22 delhi
;
run;

data new1;
set dset1;
set dset2;
run;

data new2;
set dset2;
set dset1;
run;

/*Both dataset contain diff variables and diff no.of observations*/
data ds1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
200 vijay 32 bang
300 surya 33 che
400 kiran 22 delhi
500 kiran 22 delhi
600 kiran 22 delhi
;
run;

data ds2;
input id name $ age loc $ sex $;
datalines;
500 jagan 34 hyd m
600 vijay 32 bang m
700 surya 33 che m
800 kiran 22 delhi m
;
run;
                                         
data new1;
set ds1;
set ds2;
run;


data new2;
set ds2;
set ds1;
run;


/*INTERLEAVING*/
/*Use the set stmt and by stmt to combine multiple datasets into*/
/*single datataset*/
/**/
/*The no.of observation in new dataset(output dset) is equal to sum*/
/*of the no.of observation from original datasets.*/
/**/
/*Note: To perform interleaving both dataset variables should be */
/*same, same data types, same length and should be sorting order*/
/**/
/*Syntax: */
	data new;
	set datasets;
	by vraibles;
	run;

data ds1;
input id name $ age loc $;
datalines;
100 jagan 34 hyd
100 vijay 32 bang
200 surya 33 che
200 kiran1 22 delhi
300 kiran2 22 delhi
100 kiran3 22 delhi
400 vijay 32 bang
;
run;


data ds2;
input id name $ age loc $;
datalines;
100 jagan1 34 hyd
100 vijay1 32 bang
300 surya1 33 che
200 kiran1 22 delhi
200 kiran2 22 delhi
400 kiran23 22 delhi
500 kiran3 22 delhi
;
run;

data new;
set ds1 ds2;
by id;
run;

proc sort data=ds1;by id;
run;

proc sort data=ds2;by id;
run;

/*Execute this program and check the log & dataset*/
data ds;
set ds1;
by id;
n1=first.id;
n2=last.id;
run;

/*First.var: value is 1 for the first observation in the by group and*/
/*value 0 for all other obseration in by group.*/

/*last.var: value is 1 for the last observation in the by group and*/
/*value 0 for all other obseration in by group.*/


/*I want to know each customer first visit information*/

data ds_1;
set ds1 ds2;
by id;
if first.id=1;
run;

/*I want to know each customer information except first &last*/

data ds_2;
set ds1 ds2;
by id;
if first.id=0 and last.id=0;
run;

/*I want to know each customer last visting information*/
data ds_2;
set ds1 ds2;
by id;
if last.id=1;
run;

/*I want to know each customer who visitied only once*/
data ds_3;
set ds1 ds2;
by id;
if first.id=1 and last.id=1;
run;

/*I want to know each customer first visintg information except*/
/*who visited once*/

data ds_3;
set ds1 ds2;
by id;
if first.id=1 and last.id=0;
run;

/*I want to know each customer last visintg information except*/
/*who visited once*/

data ds_3;
set ds1 ds2;
by id;
if first.id=0 and last.id=1;
run;

/*I want to know each customer all visting information except who*/
/*visited once and excpet last*/

data ds_3;
set ds1 ds2;
by id;
if first.id=1 or last.id=0;
run;

/*I want to know each customer all visting information except who*/
/*visited once and excpet first*/

data ds_4;
set ds1 ds2;
by id;
if first.id=0 or last.id=1;
run;


data ds1;
input id name $ age loc $ dob date7.;
format dob date7.;
datalines;
100 jagan 34 hyd 12mar89
100 vijay 32 bang 22mar89
200 surya 33 che 23mar89
200 kiran1 22 delhi 12mar89
300 kiran2 22 delhi 23mar89
100 kiran3 22 delhi 15mar89
400 vijay 32 bang 16mar89
;
run;

data ds2;
input id name $ age loc $ dob date7.;
format dob date7.;
datalines;
100 jagan1 34 hyd 05mar89
100 vijay1 32 bang 13mar89
300 surya1 33 che 13mar89
200 kiran1 22 delhi 13mar89
200 kiran2 22 delhi 23mar89
400 kiran23 22 delhi 23mar89
500 kiran3 22 delhi 23mar89
;
run;


proc sort data=ds1;
by id dob;run;


proc sort data=ds2;
by id dob;run;

data n;
set ds1 ds2;
by id dob;
if first.id=1;
run;
