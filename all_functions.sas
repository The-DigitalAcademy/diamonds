

FILENAME REFFILE '/home/u62783591/sasuser.v94/diamonds _clean.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.DIAMONDS;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.DIAMONDS; RUN;

/*insert function*/

%macro insert(index=, carat=, cut=, color=, clarity=, depth=, table=, x=, y=, z=, price=);
	 			
	 		data new_diamond;
	 			index = &index;
	 	        carat = &carat;
	 			cut = &cut;
	 			color =  &color;
	 			clarity = &clarity;
	 			depth= &depth;
	 			table=&table;
	 			price=&price;
	 			x= &x;
                y = &y;
                z= &z;
	 
	 		run;
	 			

%MEND insert;


%insert(index=53941 ,carat=0.3, cut="premium", color="N",clarity='X3',depth= 12.3,table= 43,price=294,x=1.23,y=5.21,z=34.1);
	 			
	 
DATA new_details; 
   SET diamonds new_diamond;
run;
PROC PRINT DATA = new_details; 
RUN;  
quit;	



/*search function*/

%macro search(filter,x);
	%put x= &x;
	%put filter = &filter;
	
	%if &filter = index %then 
	 		%do;
	 		data all_diamonds;
	 			set diamonds;
	 			search_count = search_count + 1;
	 			run;
 			data result;
           		set diamonds;
	    		where index = "&x";
	    		run;
	 %end;
	    			
	proc print data=result;
	run;
%mend search;

%search(index,3);


proc print data=DIAMONDS (obs=10);
   var carat cut ;
   title 'results for carat and cut';
   
run;

	

/*modify function*/

%macro modify(index, carat, cut, color, clarity, depth, table, x, y, z, price);
	 %do;
	 		data diamonds;
	 			modify work.diamonds;
	 			color =  &color;
	 			carat = &carat;
	 			cut = &cut;
	 			clarity = &clarity;
	 			depth= &depth;
	 			table=&table;
	 			price=&price;
	 			x= &x;
                y = &y;
                z= &z;
	 			
	 			where index = &index;
	 		run;
	 %end;
	 
	 proc print data = diamonds;
	 run;
	    			

%mend modify;

%modify(1, 0.3, "premium", "N", "X3", 12.3, 43,294,1.23,5.21,34.1);


/*delete function*/

%macro deleting(user);
%put user=&user;
data diamonds;
    set diamonds;
    if index = &user then delete;
run;
%mend deleting;

%deleting(2);

	
