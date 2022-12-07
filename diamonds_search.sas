FILENAME REFFILE '/home/u62783591/sasuser.v94/diamonds.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.DIAMONDS;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=DIAMONDS; RUN;

%macro search(filter,x);
	%put x= &x;
	%put filter = &filter;
	
	%if &filter = VAR1 %then 
	 		%do;
	 		data all_diamonds;
	 			set diamonds;
	 			search_count = search_count + 1;
	 			run;
 			data result;
           		set diamonds;
	    		where VAR1= "&x";
	    		run;
	 %end;
	    			
	proc print data=result;
	run;
%mend search;

%search(VAR1,3);


proc print data=DIAMONDS (obs=10);
   var carat cut ;
   title 'results for carat and cut';
   
run;



