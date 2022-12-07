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




