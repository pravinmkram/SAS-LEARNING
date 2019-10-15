/*Examples*/

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
/**/
%nih_sw_ale_1(jagan,M);
