class RscTitles
{
	titles[]={"infomessage"};

	class infomessage
		{
		  idd = 10100;
		  movingEnable=0;
		  duration=2;  
		  fadein=0;    
		  name="infomessage";
		  controls[]={"wctext"};

			class wctext: RscText
			{
				idc = 10101;
				type = CT_STATIC;
				x = 1;
				y = 0;
				w = 0.4;
				h = 0.1;
				style = ST_MULTI;
				lineSpacing = 0.7;
				colorText[] = { 0, 0, 0, 1 }; 
				colorBackground[] = { 0.3, 0.3, 0.3, 0.3 }; 
			};

	};
};






