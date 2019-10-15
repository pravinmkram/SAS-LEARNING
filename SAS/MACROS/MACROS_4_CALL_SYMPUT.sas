
***********************************;
/*CALL SYMPUT*/
***********************************;
/*How will you create the macro variable in datastep*/

/*call symput: macro variable can also creates in a datastep, by using the call symput*/

/*Syntax:*/
/*call symput('macrovariablename',value)*/


data a;
set sashelp.class;
call symput('ans',name);
run;

%put emp name is &ans.;


data a;
set sashelp.class(obs=18);
call symput('ans',name);
run;

%put emp name is &ans.;


/*I want to create the macro variable for 10th obsevation*/
data ds;
set sashelp.class;
/*if _n_=10 then call symput('ename',name);*/
if _n_=12 then call symput('ename',name);
run;

%put &ename.;


/*Example 2*/

data new;
x=10;
call symput('num',x);
run;

%put &num.;

data new;
x=10;
call symput('num3',x);
y = "&num3."+20;
put y=;
run;

%put &num.;

/*IMPORTANT INTERVIEW QUESTION*/
/*Symget: rerturn the values of macro variable during the datastep execution*/

data new;
x=60;
call symput('num4',x);
y = symget('num4') + 20;
put y=;
run;


%put &num4.;


/*create the status macro variable*/
data ds1;
set sashelp.class;
if age ge 14 then call symput('status','good');
else
call symput('status','bad');
/*stat="&status";*/
stat=symget('status');
run;

%put &status.;

/*create the no.of macro variables for stat variable value*/
data ds2;
set ds1;
call symput('status' || trim(left(_n_)),stat);
run;

%put &status1.  &status2. &status3. &status17. &status18. &status19.;

/*create the no.of macro variables for stat variable value*/
data ds2;
set ds1;
/*call symput('status',name);*/
call symput('status' || trim(left(_n_)),name);
run;

%put &status1.  &status2. &status3. &status17. &status18. &status19.;

data ds2;
set ds1;
call symput('status' || trim(left(_n_)),name);
call symput('ht' || trim(left(_n_)),height);
call symput('wt' || trim(left(_n_)),weight);
run;

%put first person name &status1.  &ht1.;
%put --------------------;
%put second person name &status2. &ht2.;
%put third person name &status18. &ht18.;
%put fourth person name &status19. &ht19.;


/*previous variable value keep in current observation */
data ds2;
length new $300.;
set ds1;
retain new;
if _n_=1 then new=name;
else new=catx(",",new,name);
call symput('new2',new);
run;

%put &new2.;

