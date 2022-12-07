FILENAME REFFILE '/home/u62783591/sasuser.v94/diamonds.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.DIAMONDS;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=DIAMONDS; RUN;

%macro deleting(user);
%put user=&user;
data all_diamonds;
    set DIAMONDS;
    if var1 = &user then delete;
run;
%mend deleting;

%deleting(5);


      





