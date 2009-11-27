//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_location", "_mainmission", "_color", "_ctrl"];

disableSerialization;
_ctrl = (findDisplay 10000) displayCtrl 10004;

MenuAction= -1;

waituntil {!isnil "wcmission"};

while {alive player && dialog} do {

	ctrlSetText [10003, format["Time left before end: %1 Mins", (wctimemax/60) - floor(time/60)]];
	ctrlSetText [10011, format["Squad Leader: %1", name (leader (group player))]];

	if (wcscoreT > 0) then {
		_color = [0,0,1,1];
	} else {
		if (wcscoreT < 0) then {
			_color = [1,0,0,1];
		} else {
			if (wcscoreT == 0) then {
				_color = [0,1,0,1];
			};
		};
	};
	_ctrl ctrlSetTextColor _color;
	ctrlSetText [10004, format["Global Score: %1", wcscoreT]];

	ctrlSetText [10007, format["Fire accurancy: %1", ((score player) / wcammoused)] + "%"];
	ctrlSetText [10008, format["Players Kill number: %1", wcnumberofkill]];
	ctrlSetText [10010, format["Lives used: %1", player getVariable "NORRN_lives_used"]];
	ctrlSetText [10012, format["Rank: %1", rank player]];

	if (side player == wcside) then {
		waituntil {!isnil "wcmainmissionW"};
		_location = wcmainmissionW;
		_mainmission = format["Main Mission: Clear the %1 town", text _location];
	} else {
		waituntil {!isnil "wcmainmissionE"};
		_location = wcmainmissionE;
		_mainmission = format["Main Mission: Protect the %1 town", text _location];
	};


	ctrlSetText [10001, _mainmission];
	ctrlSetText [10006, format["Side Mission: %1", wcmission select 0]];

	switch (typeOf player) do {
		case "RU_Soldier_Pilot": { ctrlSetText [10009, "Role Pilot: You have to transport troops, ammos, and construction kits on battelfield. Construction Kit permits to build object and can be retrieve on chopper service zone"]; };
		case "RU_Soldier": { ctrlSetText [10009, "Role Mortar: You have to build mortar near enemy position with construction Kit. Mortar permits to destroy the enemy position from far. Build mortar from construction kit that are send by pilot"]; };
		case "RU_Soldier_Medic": { ctrlSetText [10009, "Role Medic: You have to build hospital near enemy position. Hospital is a respawn point for your team. Build hospital from construction kit that are send by pilot"]; };
		case "RU_Soldier_Crew": { ctrlSetText [10009, "Role Engineer: You have to build radar to locate air enemy and repair vehicle. Build radar from construction kit that are send by pilot. Build it at top of mountain."]; };
		case "RU_Soldier_Light": { ctrlSetText [10009, "Role Radio: You have to build radio for the members of your team. After that they can see them each other on map. Build radio from construction kit that are send by pilot"]; };

		case "USMC_Soldier_Pilot": { ctrlSetText [10009, "Role Pilot: You have to transport troops, ammos, and construction kits on battelfield. Construction Kit permits to build object and can be retrieve on chopper service zone"]; };
		case "USMC_Soldier": { ctrlSetText [10009, "Role Mortar: You have to build mortar near enemy position with construction Kit. Mortar permits to destroy the enemy position from far. Build mortar from construction kit that are send by pilot"]; };
		case "USMC_Soldier_Medic": { ctrlSetText [10009, "Role Medic: You have to build hospital near enemy position. Hospital is a respawn point for your team. Build hospital from construction kit that are send by pilot"]; };
		case "USMC_SoldierS_Engineer": { ctrlSetText [10009, "Role Engineer: You have to build radar to locate air enemy and repair vehicle. Build radar from construction kit that are send by pilot. Build it at top of mountain."]; };
		case "USMC_SoldierS": { ctrlSetText [10009, "Role Radio: You have to build radio for the members of your team. After that they can see them each other on map. Build radio from construction kit that are send by pilot. Build it at top of mountain."]; };

	};

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

	sleep 1;
};