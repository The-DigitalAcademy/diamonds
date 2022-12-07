FILENAME REFFILE '/home/u62783591/sasuser.v94/diamonds.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;




%macro modify(id, carat, cut, color, clarity, depth, table, x, y, z, price);
	 %do;
	 		data import;
	 			modify work.import;
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
	 			
	 			where VAR1 = &id;
	 		run;
	 %end;
	    			

%mend modify;

%modify('1', '0.3', "premium", "N", 'X3', 12.3, 43,294,1.23,5.21,34.1);




