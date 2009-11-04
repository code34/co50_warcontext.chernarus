
MenuAction = -1;
_currentVD = viewdistance;
ctrlSetText [13001, Format [localize "STR_ACGUI_VM_TXT_VD",_currentVD]];
ctrlSetText [13003, Format [localize "STR_ACGUI_VM_TXT_TG",(wcterraingrid*2)]];

SliderSetRange[13002,100,10000];
SliderSetRange[13004,0,50];
SliderSetPosition[13002,_currentVD];
SliderSetPosition[13004,wcterraingrid];

_lastvd = _currentVD;
_lasttg = wcterraingrid;	

while {alive player && dialog} do {
	sleep 0.05;

	if (!dialog) exitWith {};

	_name = name player;

	ctrlSetText [13009, Format [localize "STR_ACGUI_VM_WELMSG",_name]];
	
	_currentVD = Floor (SliderPosition 13002);
	wcterraingrid = Floor (SliderPosition 13004);
	
	ctrlSetText [13001, Format [localize "STR_ACGUI_VM_TXT_VD",_currentVD]];
	ctrlSetText [13003, Format [localize "STR_ACGUI_VM_TXT_TG",(wcterraingrid*2)]];
	
	if (MenuAction == 2) then {
	MenuAction = -1;
	closeDialog 0;
	if (_currentVD != _lastvd) then {setViewDistance _currentVD};
	if (wcterraingrid != _lasttg) then {setTerrainGrid (50 - wcterraingrid)};
	_lastvd = _currentVD;
	_lasttg = wcterraingrid;
	};
};




