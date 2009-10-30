
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
	controls[] = { MM_TAG, InfoHTML, MM_Btn_en, MM_Btn_fr, MM_Btn_ger, MM_BtnOk, MM_BtnOpt, MM_BtnHBfix, MM_Label, MM_Btn_TXT, MM_WELMSG};

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
	

	
	class InfoHTML 
		{ 
			idc = 10001;	
			type = 9; // defined constant (9) 
			style = 0; // defined constant (0) 
			x = 0.410;
			y = 0.120;
			w = 0.69;
			h = 0.73;
			filename = $STR_ACGUI_MISSIONHTML; 
			colorBackground[] = {0.5, 0.5, 0.5, 0.5};
			colorBold[] = {1, 0, 0, 1}; 
			colorLink[] = {0, 0, 1, 1}; 
			colorLinkActive[] = {1, 0, 0, 1}; 
			colorPicture[] = {1, 1, 1, 1}; 
			colorPictureBorder[] = {1, 0, 0, 1}; 
			colorPictureLink[] = {0, 0, 1, 1}; 
			colorPictureSelected[] = {0, 1, 0, 1}; 
			colorText[] = {0, 0, 0, 1}; 
			prevPage = "\ca\ui\data\arrow_left_ca.paa"; 
			nextPage = "\ca\ui\data\arrow_right_ca.paa"; 
			class H1 { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.025; }; 
			class H2 { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.029; }; 
			class H3 { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.0286458; }; 
			class H4 { font = "Zeppelin33Italic"; fontBold = "Zeppelin33"; sizeEx = 0.030; }; 
			class H5 { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.0208333; }; 
			class H6 { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.0208333; }; 
			class P { font = "Zeppelin32"; fontBold = "Zeppelin33"; sizeEx = 0.0228333;}; 
		};
	
	class MM_Btn_en  : New_Btn
		{
			x = 0.425;
			y = 0.835;
			w = 0.20;
			text = $STR_ACGUI_MM_BTN_EN;
			action = "_void = [""en"" ] execVM ""dialog\GUI\Mainmenu_chg_language.sqf"";";
		};
	
	class MM_Btn_fr  : New_Btn 
		{
			x = 0.6575;
			y = 0.835;
			w = 0.20;
			text = $STR_ACGUI_MM_BTN_FR;
			action = "_void = [""fr"" ] execVM ""dialog\GUI\Mainmenu_chg_language.sqf"";";
		};
	
	class MM_Btn_ger  : New_Btn 
		{
			x = 0.89;
			y = 0.835;
			w = 0.20;
			text = $STR_ACGUI_MM_BTN_GER;
			action = "_void = [""ger"" ] execVM ""dialog\GUI\Mainmenu_chg_language.sqf"";";
		};
	
	class MM_BtnOpt : New_Btn 
		{
			x = 0.1;
			y = 0.45;
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
			x = 0.1;
			y = 0.6
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
		
	class MM_Btn_TXT: RscText
		{
			x = 0.04;
			y = 0.4;
			text = $STR_ACGUI_MM_BTN_TXT;
			SizeEx = 0.030;
		};
			
	class MM_WELMSG: RscText
		{
			idc = 10003;
			x = 0.04;
			y = 0.12;
			SizeEx = 0.030;
		};
		
			
};







