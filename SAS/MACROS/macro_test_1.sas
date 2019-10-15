

data new;
set sashelp.class;
run;

proc print data=new;
where sex = 'F' and age in (11,12,13,14,15);
run;
