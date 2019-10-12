/*SCAN Function*/
/*Select a given word from a character expression*/
/**/
/*Syntax: Scan(varname(String),n,delimeter);*/
/**/
/*Default delimiters:*/
/*blank,< ( + } & ! $ * ) ; / , %*/

data a;
input id name $19. age;
datalines;
100 jagan mohan reddy  34
200 rahul surya charan 23
300 shyam swati divya  23
;
run;

/*+ve means it will scan the left to right*/
/*-ve means it will scan the right to left*/
data a1;
set a;
firstname=scan(name,1);
secondname=scan(name,2);
lastname=scan(name,3);
run;

/*In this example lastname & lname get the same result*/
data a2;
set a;
firstname=scan(name,-1);
secondname=scan(name,-2);
lastname=scan(name,-3);
lname=scan(name,-3," ");
run;

data a3;
var1="abc def";
var2="rahul?purna lakshmi+rahul|jaagan";
a=scan(var1,1);
b=scan(var1,2);
c=scan(var1,-1);
d=scan(var2,4);
e=scan(var2,-4);
f=scan(var2,-1," ");
g=scan(var2,1," ");
h=scan(var2,1,"+");
h=scan(var2,1,"|");
run;

/*d: include all digits*/
/*The below example delimiter is digits*/

data a3;
var1="abc1def2ghi";
a=scan(var1,1);
b=scan(var1,1,"");
c=scan(var1,1,"","d");
d=scan(var1,2,"","d");
e=scan(var1,-1,"","d");
run;


data a;
input email $30.;
datalines;
jaganmohan@gmail.com
jaganmohan1@yahoo.com
jaganmohan1@hotmail.com
jaganmohan1@aol.com
jaganmohan1@rediff.com
jaganmohan4@gmail.com
;
run;

/*Left align*/
/*Left aligns a sas character expression*/
/*syntax: left(varname or stirng);*/

data a;
var="   Jagan mohan";
var1="   STANSYS SAS";
a=left(var);
b=left(var1);
run;

/*Right align*/
/*right aligns a sas character expression*/
/*syntax: RIGHT(varname or stirng);*/

data a1;
var="Jagan mohan    ";
var1="STANSYS SAS   ";
a=right(var);
b=right(var1);
run;

/*SUBSTR*/
/*Selects particulat part from character or string*/

/*Syntax: substr(string,start,length);*/

/*Start: start is the starting position within  the string.*/
/*length: If specified is the no.of characters to include in the */
/*substring. If this argument is omited the substr fn will return*/
/*all the characters from the start position to end of the string.*/
data a;
input id name $19. age;
datalines;
100 jagan mohan reddy  34
200 rahul surya charan 23
300 shyam swati divya  23
;
run;
data a1;
set a;
new_name=substr(name,7);
new_name1=substr(name,7,5);
run;

data t1;
var="surya rahul purna swati";
fname=substr(var,7,5);
lname=substr(var,13);
ff=substr(var,1,5);
run;

/*It will extract the only month*/
data a;
dt=put(today(),date9.);
new=substr(dt,3,3);
run;


%let dat=%sysfunc(today(),date9.);
/*%put &dat.;*/

%let mon=%sysfunc(substr(&dat.,3,3));
%put &mon.;


/*Compress*/

/*REmoves specified characters from character value or string.*/

/*Syn: compress(charactervalue, compress-line,'');*/

data a;
var1="nag      123   HYDERABAD";
var2="Rahul MBA swati";
var3="JAGan 1234";
a=compress(var1);/*it will remove spaces only*/
b=compress(var1,'abc');/*it will remove abc only*/
c=compress(var1,'abc','d');/*it will remove abc & digits only*/
d=compress(var1,,'a');/*it will remove alphabets(upper&lower)only*/
e=compress(var1,,'as');/*it will remove alphabet & spaces only*/
f=compress(var1,,'l');/*it will remove lower case only*/
g=compress(var1,,'u');/*it will remove uppercase only*/
h=compress(var1,'a');/*it will remove only 'a' only*/
i=compress(var2,'swati'); /*it will remove 'swati' only*/
j=compress(var3,,'a');/*it will remove alphabets(upper&lower)only*/
k=compress(var3,,'kd');/*it will keep only digits*/
run;

/*a:include all upper&lowe case letters*/
/*s:include all spaces*/
/*d:include all digits*/
/*l-include all lower case letters*/
/*u-include all upper case letters*/

/*compbl*/
/*To replace all occureances of two or more blanks with a single */
/*blank space*/

/*syntax: compbl(character value)*/

data a;
var1="nag      123   HYD";
var2="Rahul                  MBA";
a=compbl(var1);
b=compbl(var2);
c=compress(var1);
d=compress(var2);
run;


/*TRIM: */
/*Removes trailing blanks from character expression and returns one*/
/*blank if the expression is missing*/

/*syn: trim(string);*/

data a;
var="Jagan   ";
var1="     mohan   ";
name=trim(var);
name2=trim(var1);
name3=trim(var)||trim(var1);
name4=trim(var1)||trim(var);
run;

/*TRIMn: */
/*Removes trailing blanks from character expression and returns null*/
/*blank if the expression is missing*/

data a;
var="Jagan   ";
var1=" ";
var2="     mohan   ";
name=trim(var) || trim(var1) || trim(var2);/*6 blank spaces*/
name1=trimn(var) || trimn(var1) || trimn(var2);/*5 blank spaces*/
run;


data a1;
var1=" ";
name='A' || trim(var1) || 'B';
name1='A'||trimn(var1)||'B';
run;

/*STRIP:*/
/*It will remove leading & trailing blanks from character expression*/
/*syntax: strip(string)*/

data a;
var="Jagan    ";
var1="     Sas      ";
var2="        MBA";
a=strip(var);
b=strip(var1);
c=strip(var2);
run;

/*The below example b & c values both are same*/
data a1;
var="Jagan   ";
var1="     Sas      ";
var2="        MBA";
a=trim(var)||trim(var1)||trim(var2);
b=strip(var)||strip(var1)||strip(var2);
c=trim(left(var))||trim(left(var1))||trim(left(var2));
run;

/*CAT*/
/*To concatenate two or more string or numeric values. Leaving */
/*leading and trailing blanks*/

/*Syntax: Cat(var1,var2---varn);*/

/*the below example just concatnation only it wll not remove any */
/*blanks*/

data a;
var = "jagan    ";
var1= "     sas    ";
var2= "      Mba";
name=cat(var,var1,var2);
name1=var||var1||var2;
run;


/*CATT*/
/*To concatenate two or more string or numeric values. it will removes*/
/*trailing blanks only*/

/*Syntax: Catt(var1,var2---varn);*/

/*the below example just do the concatnation and removes the trailing*/
/*blanks only it wll not remove leading blanks*/

data a1;
var = "jagan    ";
var1= "     sas    ";
var2= "      Mba";
name=catt(var,var1,var2);
name1=trim(var)||trim(var1)||trim(var2);
run;


/*CATS*/
/*To concatenate two or more string or numeric values. it will */
/*removes leading & trailing blanks both*/

/*Syntax: Cats(var1,var2---varn);*/

/*the below example just do the concatnation and removes both leading*/
/*& trailing blanks*/
data a2;
var = "jagan    ";
var1= "     sas    ";
var2= "      Mba";
name=cats(var,var1,var2);
name1=cat(var,var1,var2);
name2catt(var,var1,var2);
name3=trim(var)||trim(var1)||trim(var2);
name4strip(var)||trim(var1)||trim(var2);
name5=trim(left(var)) || trim(left(var1)) || trim(left(var2));
run;


/*Catx*/
/*To concatenate two or more string or numeric values. it will removes*/
/*leading & trailing blanks on character values and inserting one or more*/
/*separators*/

/*Syntax: Catx(separator,var1,var2,varn);*/

data a3;
var = "jagan    ";
var1= "     sas    ";
var2= "      Mba";
name=catx(' ',var,var1,var2);
name1=catx(':',var,var1,var2);
name2=catx('-',var,var1,var2);
name3=catx('-',988,678,7076);
run;

data a1;
var = "jagan    ";
var1= "     sas    ";
var2= "      Mba";
name=catx(' ',var,var1,var2);

name1=cat(var,var1,var2);
name2=cats(var,var1,var2);
name3=catt(var,var1,var2);

run;

/*TRANSLATE*/
/*Replaces specific character in a character expression*/
/*syntax: translate(charvalues,to,from);*/
/*data a;*/
/*var="12X45";*/
/*a=translate(var,"ABCDE","12345");*/
/*d=translate(var,"A","1","B","2");*/
/*run;*/

/*TRANWORD:*/
/*Replaces the complete word in character string*/

/*Syntax: tranwrd(charvalue,find,replace)*/
/*or 		tranwrd(charvalue,source,target)	*/

data a;
a="SR Nagar Road";
b="Bangalore JP Nagar";
c="Mr Vijaya";
d="Rahul wants money";
a1=tranwrd(a,"Road","Hyd");
/*a21=tranwrd(a1,"Nagar","nag");*/
a2=tranwrd(b,"Jp","jaya");
a3=tranwrd(b,"JP","jaya");
a4=tranwrd(c,"Mr","Miss");
a5=tranwrd(d,"money","sweet");
run;


/*INDEX*/
/*To locate the starting position of substring in a string*/
/**/
/*syntax: index(charvalue,findstring);*/

data a;
var="jagan mba";
var1="ABCDEF";
var2="stansys sas srnagr";
a=index(var,"mba");
a1=index(var,"gan");
a2=index(var,"a");
a3=index(var1,"C");
a4=index(var1,"EF");
a5=index(var2,"sas");
a6=index(var2,"s");
run;

/*Indexc: To search a character string for one or more characters and*/
/*returns the positions of the chars*/
/**/
/*Syntax: indexc(charvalues,char1,char2,char3--charn);*/

data a;
var="jagan mba";
var1="ABCDEF";
var2="stansys sas srnagr";
a=indexc(var,"mba");
a1=indexc(var,"g","a","n");
a2=indexc(var1,"D","E","B");
a3=indexc(var2,"r");
a4=indexc(var2,"y","n","r");
run;

/*Indexw: serach a charcter expression for specified string as word*/
/**/
/*syntax: indexw(charvalue,word);*/

data a3;
var="jagan mba";
var1="stansys sas srnagr";
var2="jagan and surya to alekya home";
a=indexw(var,"gan");
b=indexw(var,"mba");
c=indexw(var2,"to");
d=indexw(var2,"alekya");
e=indexw(var2,"home");
f=indexw(var2,"hom");
run;


/*Length*/
/*It will give the length of string*/
/*syntax: length|(string or varname);*/

data a;
input id name $10. sal;
datalines;
10 jaganmohan 34000
12 niharika   43000
13 vijaysri   34550
14 rahulbha   2222
;run;

data b;
set a;
new=length(name);
run;

/*Quote:*/
/*adds the double quotes to character values*/
/*syntax: quote(varname or string)*/

data a1;
set a;
new_name=quote(name);
run;

/*deQuote:*/
/*remove double quotes from character values*/
/*syntax: dequote(varname or string)*/

data b;
set a1;
new_name1=dequote(new_name);
run;

/*Repeat:*/

/*To make multiple copies of a string*/
/*Syntax: repeat(string,n)*/

data a;
var="jagan";
a=repeat(var,3);
b=repeat("*",5);
c=repeat("hello",2);
run;


/*RAnk:*/

/*Data a1;*/
/*var="A";*/
/*var1="Vijaya";*/
/*var2="ZOO";*/
/*var3="{";*/
/*var4="str";*/
/*a=rank(var);*/
/*b=rank(var1);*/
/*c=rank(var2);*/
/*d=rank(var3);*/
/*e=rank(var4);*/
/*run;*/


