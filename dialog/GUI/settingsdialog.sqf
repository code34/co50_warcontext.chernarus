MenuAction = -1;
ctrlSetText [13001, Format [localize "STR_ACGUI_VM_TXT_VD", wcviewDist]];
ctrlSetText [13003, Format [localize "STR_ACGUI_VM_TXT_TG", (50 - wcterraingrid)]];

SliderSetRange[13002,100, 10000];
SliderSetRange[13004,0, 50];

SliderSetPosition[13002, wcviewDist];
SliderSetPosition[13004, (50 - wcterraingrid)];

while {alive player && dialog} do {
	sleep 0.1;

	wcviewDist = Floor (SliderPosition 13002);
	wcterraingrid = (50 - Floor (SliderPosition 13004));
	
	ctrlSetText [13001, Format [localize "STR_ACGUI_VM_TXT_VD",wcviewDist]];
	ctrlSetText [13003, Format [localize "STR_ACGUI_VM_TXT_TG", (50 - wcterraingrid)]];
	
	if (MenuAction == 2) then {
		MenuAction = -1;
		closeDialog 0;
		setViewDistance wcviewDist;
		setTerrainGrid wcterraingrid;
	};
};




