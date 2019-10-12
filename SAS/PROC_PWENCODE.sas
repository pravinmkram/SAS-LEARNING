/*PROC PWENCODE*/
/*To convert password into Encrypted mode.*/

/*Syntax:-*/
PROC PWENCODE IN='password' <OUT=fileref> <METHOD=encoding-method>;
run; 

/*Options:-*/
/*IN='password' */
Specifies the password to encode. The password can 
contain up to a maximum of 512 characters, which include
alphanumeric characters, spaces, and special characters.
If the password contains embedded single or double 
quotation marks, use the standard SAS rules for quoting
character constants 

Proc pwencode in='teja@1234';
Run;


/*OUT=fileref */
/*Specifies a fileref to which the output string is to be*/
/*written. If the OUT= option is not specified, the output*/
/*string is written to the SAS log.*/

Filename Jagan "F:\Jagan Sas_class2\outputs\tejapwd.txt";

Proc pwencode in='teja@1234' out=Jagan;
Run;

data _null_;
infile jagan truncover;
input pwd :$50.;
call symputx('tejapwd',pwd);
run;

%put &tejapwd.;

/*METHOD=encoding-method */
/*Specifies the encoding method. Here are the supported values for encoding-method:*/
/*Encrypted password contains starting letters as {sas002} or {sas001} or {sas003}*/
/*sas001*/
/*Uses 64-bit key to encode passwords. */
/*sas002*/
/*Uses a 32-bit key to encode passwords. This is the default. */
/*sas003*/
/*Uses a 256-bit key to encode passwords.  AES (Advanced Encryption Standard), which is*/
/*supported in SAS/SECURE*/

/*Examples:-*/
PROC SQL;
CONNECT TO ORACLE (USER=SCOTT PASSWORD="&tejapwd.");
CREATE TABLE DS1 AS
SELECT * FROM CONNECTION TO ORACLE
(
SELECT * FROM DEPT
);
DISCONNECT FROM ORACLE;
QUIT;

PROC PWENCODE IN='TIGER';
RUN;

PROC SQL;
CONNECT TO ORACLE (USER=SCOTT PASSWORD='{SAS002}F77E0C345A42C6A753443DCE');
CREATE TABLE DS1 AS
SELECT * FROM CONNECTION TO ORACLE
(
SELECT * FROM DEPT
);
DISCONNECT FROM ORACLE;
QUIT;

NOTE:
In realtime usernames and passwords will provide by client. 
Generally we can’t specify our direct passwords in program,
why because when others know our password’s there is a chance to 
misuse the passwords. To avoid this problem we need to encrypt
our passwords using PROC PWENCODE that encrypted password we need
to apply in program. This encrypted password having only reading
permissions so others can’t misuse.


/*PROC SETINIT PROC SETINIT PROC SETINIT PROC SETINIT*/
To get the license information in the log
Syntax: -
Proc Setinit;
Run;
