// by Xeno

if (!isServer) exitWith{};

_vehicle = _this select 0;
_position = _this select 1;
_enterer = _this select 2;

_enterer_name = typeOf _enterer;

if ((_enterer_name != "SoldierWCrew") && (_enterer_name != "SoldierECrew")) then {
	switch (_position) do {
		case "driver": {
			driver _vehicle action["Eject",_vehicle];
		};
	
		case "gunner": {
			gunner _vehicle action["Eject",_vehicle];
		};
		
		case "commander": {
			commander _vehicle action["Eject",_vehicle];
		};
	};
};

