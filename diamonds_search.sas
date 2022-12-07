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



