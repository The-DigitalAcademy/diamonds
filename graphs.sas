
FILENAME REFFILE '/home/u62783591/sasuser.v94/diamonds _clean.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.diamonds;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.diamonds; RUN;


proc sgplot data = work.diamonds;
  title height =14pt
    "Which color is prefered the most and which one is the least?";
 vbar color / response=price;
 yaxis grid;
run;

proc sgplot data = work.diamonds;
  title height =14pt
    "Which clarity is prefered the most?";
 vbar clarity / response=price ;
 yaxis grid;
run;


proc sgplot data = work.diamonds;
  title height =14pt
    "Which cut is prefered the most and least?";
 hbar cut / response=price group=clarity ;
 xaxis valuesrotate=vertical;
 yaxis grid;
 label;
run;

proc sgplot data = work.diamonds;
  title height =14pt
    "Which table is preferred the most?";
 hbar color / response=table group=clarity;
 xaxis valuesrotate=vertical;
 yaxis grid;
 label;
run;


proc sgplot data = work.diamonds ;
  title height =14pt
    "Does depth matter?";
 vbar cut / response=depth stat=sum ;
 yaxis grid;
run;



proc sgplot data = work.diamonds;
  title height =14pt
    "Which carat is considered better?";
 vbar color / response=carat;
 yaxis grid;
run;