class RscTitles
{
	titles[]={"infomessage"};

	class infomessage
		{
		idd = 10100;
		movingEnable=0;
		duration= 4;  
		fadein=0;    
		name="infomessage";
		controlsBackground[] = {"wctext"};
		controls[]={"wcslider", "wctime"};
		onLoad = "uiNamespace setVariable ['wcdisplay', _this select 0];";
		onunLoad = "uiNamespace setVariable ['wcdisplay', objnull];";    

			class wctext: RscText
			{
				idc = 10101;
				type = CT_STATIC;
				x = WCTEXTX;
				y = WCTEXTY;
				w = WCTEXTWIDTH;
				h = 0.15;
				style = ST_MULTI;
				font = FontM; 
				sizeEx = 0.03; 
				lineSpacing = 0.7;
				colortext[] = {0,0,0,0.7};
				colorBackground[] = { 0.3, 0.3, 0.3, 0.3 };
			};

			class wcslider : RscXSliderH 
			{
				idc = 10102;
				x = WCSLIDERX;
				y = WCSLIDERY;
				w = WCSLIDERWIDTH;
				color[] = {0,1,0,1}; 
				coloractive[] = { 0, 0, 0, 1};
			};

			class wctime: RscText
			{
				idc = 10103;
				x = WCTIMEX;
				y = WCTIMEY;
				w = WCTIMEWIDTH;
				h = 0.10;
				font = FontM;
				sizeEx = 0.03;			
			};

	};
};






