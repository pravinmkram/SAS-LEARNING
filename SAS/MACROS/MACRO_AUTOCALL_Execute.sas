/*AUTOCALL Library*/
/*we can store our macros in a central location called as autocall library*/


/*Using Mstored sasmstore option we can store into required libraries*/

/*syntax: */
options mstored sasmstore=<autocall library>;

/*Mstored: this option instruct the SAS system that you want to make stored compiled macro */
/*programs avialble to our SAS Session*/

/*SASMSTORE: option is the libref that points to the SAS catalog containing the compiled*/
/*macro programs*/

libname viv 'E:\Jagan';

options mstored sasmstore=viv;


%new(new);
/*Note: the above macro it will create new dataset & and print the dset*/

%new1(new,13);

/*Note: the above macro it will create new dataset, based on age & and print the dset*/

libname viv1 'E:\Jagan\vivek';
options mstored sasmstore=viv1;

%new2(new,15);

/*Note: the above macro it will create new dataset, based on age & and sort the dset*/

%ans(te,12);


/*Note: the above macro it will create new dataset, based on age & and sort the dset &
and print the dset*/


proc catalog c=viv1.sasmacr;
contents;
run;
quit;


