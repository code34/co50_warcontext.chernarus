//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

MenuAction= -1;

while {alive player && dialog} do {
	sleep 0.05;

_name = name player;

ctrlSetText [10003, Format [localize "STR_ACGUI_MM_WELMSG",_name]];

	if (!dialog) exitWith {};
	if (MenuAction == 1) then {
		MenuAction = -1;
		closeDialog 0;
		titleCut["","BLACK IN",1];
		_pos = position player;
		_vehi = "Lada1" createVehicle [0,0,0];
		player moveInCargo _vehi;
		deleteVehicle _vehi;
		player setPos _pos;
	};
};