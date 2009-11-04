
/*------------------------------------------------------------------------------------------------------------------*/	
	class SettingsDialog
{
	idd = 13000;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	controlsBackground[] = {New_BackGround};
	controls[] = {VM_VD_TXT, VM_VD_SDR, VM_TG_TXT, VM_TG_SDR, VM_BtnClose, VM_Map, VM_TG_VAL, VM_LABEL, VM_WELMSG};
	onLoad = "ExecVM ""dialog\GUI\settingsdialog.sqf""";

	
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
		
		class VM_VD_TXT: RscText 
		{
			idc = 13001;
			text = "";
			x = 0.04;
			y = 0.25;
			sizeEx = 0.03;
		};
		
		class VM_VD_SDR : RscXSliderH 
		{
			idc = 13002;
			x = 0.04;
			y = 0.29;
			w = 0.28;
		};
		
		class VM_TG_TXT: RscText 
		{
			idc = 13003;
			text = "";
			x = 0.04;
			y = 0.33;
			sizeEx = 0.03;
		};
	
		
		class VM_TG_SDR : RscXSliderH 
		{
			idc = 13004;
			x = 0.04;
			y = 0.37;
			w = 0.28;
		};
	
		class VM_BtnClose  : New_Btn 
		{
			x = 0.87;
			y = 0.892;
			w = 0.22;
			default = true;
			text = $STR_ACGUI_VM_BTN_CLOSE;
			action = "MenuAction = 2";
		};
	
		class VM_Map : RscMapControl
		{
			idc = 13007;
			x = 0.410;
			y = 0.120;
			w = 0.69;
			h = 0.73;
			default = true;
			showCountourInterval = true;
		};
		
		class VM_TG_VAL: RscText 
		{
			idc = 13008;
			text = "%";
			x = 0.25;
			y = 0.33;
			sizeEx = 0.03;
		};
		
		class VM_LABEL: RscText
		{
			text = $STR_ACGUI_VM_LABEL;
			x = 0.04;
			y = 0.05;
		};
		
		class VM_WELMSG: RscText
		{
			idc = 13009;
			x = 0.04;
			y = 0.12;
			SizeEx = 0.030;
		};
};