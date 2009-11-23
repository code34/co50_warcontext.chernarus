
/*
-----------------------------------------------------------------------------------------
*/

class acInfoDLG
{
	idd = 10000;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	fadein       =  0;
	fadeout      =  0;
	duration     =  10;
	name = "ac_info_dlg";
	controlsBackground[] = {New_BackGround};
	objects[] = {};
	controls[] = { MM_TAG, infomainmission, infosidemission, MM_BtnOk, MM_BtnOpt, MM_BtnHBfix, MM_Label, MM_WELMSG, MM_SCOREW, MM_SCOREE, MM_ACCURANCY, MM_AMMOUSED, MM_PLAYERROLE, MM_KILLNUMBER};

	onLoad = "ExecVM ""dialog\GUI\optionmenu.sqf""; uiNamespace setVariable [""ac_INFO_DLG"", _this select 0];";
	
	class New_BackGround : RscPicture
	{
		style = 48; 
		x = 0;
		y = 0;
		w = 1.498;
		h = 1.2;
		moving = 1;
		text = "\ca\ui\data\ui_wiz_background_ca.paa";
	};
	
	class MM_TAG : RscPicture
	{
		style = 48; 
		x = 0.505;
		y = 0.16;
		w = 0.5;
		h = 0.65;
		colorText[] = {0.75, 0.75, 0.75, 0.5};
		text = "dialog\pics\actag.paa";
	};
	
	class infomainmission: RscText
		{
			idc = 10001;
			x = 0.410;
			y = 0.12;
			w = 0.69;
			h = 0.11;
			SizeEx = 0.030;
			style = ST_MULTI;
			lineSpacing = 0.7;
			colorBackground[] = {0.3, 0.3, 0.3, 0.3};
		};

	class infosidemission: RscText
		{
			idc = 10006;
			x = 0.410;
			y = 0.24;
			w = 0.69;
			h = 0.11;
			SizeEx = 0.030;
			style = ST_MULTI;
			lineSpacing = 0.7;
			colorBackground[] = {0.3, 0.3, 0.3, 0.3};
		};	

	class MM_BtnOpt : New_Btn 
		{
			x = 0.04;
			y = 0.7;
			w = 0.2200;
			text = $STR_ACGUI_MM_BTN_Opt;
			action = "CloseDialog 0;_handle = [] execVM ""dialog\GUI\createsettingsdialog.sqf""";
		};

	class MM_BtnOk  : New_Btn 
		{
			x = 0.89;
			y = 0.892;
			w = 0.20;
			default = true;
			text = $STR_ACGUI_MM_BTN_CLOSE;
			action = "closeDialog 0;";
		};
		
	class MM_BtnHBfix  : New_Btn 
		{
			idc = 10002;
			x = 0.04;
			y = 0.76;
			w = 0.2200;
			text = $STR_ACGUI_MM_BTN_HBFIX;
			action = "MenuAction = 1";
		};
		
	class MM_Label: RscText
		{
			text = $STR_ACGUI_MM_LABEL;
			x = 0.04;
			y = 0.05;
		};
			
	class MM_WELMSG: RscText
		{
			idc = 10003;
			x = 0.04;
			y = 0.12;
			SizeEx = 0.030;
		};

	class MM_SCOREW: RscText
		{
			idc = 10004;
			x = 0.04;
			y = 0.16;
			SizeEx = 0.030;
		};

	class MM_SCOREE: RscText
		{
			idc = 10005;
			x = 0.04;
			y = 0.20;
			SizeEx = 0.030;
		};

	class MM_ACCURANCY: RscText
		{
			idc = 10007;
			x = 0.04;
			y = 0.24;
			SizeEx = 0.030;
		};

	class MM_AMMOUSED: RscText
		{
			idc = 10008;
			x = 0.04;
			y = 0.28;
			SizeEx = 0.030;
		};	

	class MM_PLAYERROLE: RscText
		{
			idc = 10009;
			x = 0.410;
			y = 0.36;
			w = 0.69;
			h = 0.11;
			SizeEx = 0.030;
			style = ST_MULTI;
			lineSpacing = 0.7;
			colorBackground[] = {0.3, 0.3, 0.3, 0.3};
		};	

	class MM_KILLNUMBER: RscText
		{
			idc = 10010;
			x = 0.04;
			y = 0.32;
			SizeEx = 0.030;
		};		
};







