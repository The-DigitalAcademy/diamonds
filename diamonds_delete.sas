%macro deleting(user);
	%put user=&user;
	data diamonds;
		set diamonds;
		if index = &user then delete;
	run;
	%mend deleting;
	
	%deleting(2);


      





