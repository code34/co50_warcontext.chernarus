// AI_throwSmoke.sqf

private ["_unc_player","_reviver","_smoke_rounds","_round","_bloggs_pos","_bloggs_offset","_sav_pos","_sav_dir"];

_unc_player		= unconscious_body;
_reviver 		= _this select 0;
_smoke_rounds	= _this select 1;


while {count _smoke_rounds > 0 && !isNull unconscious_body && alive _reviver} do
{ 
	//reviver throws smoke
	if (_reviver distance _unc_player < 60 && _reviver distance _unc_player > 15) then
	{	
		if (call compile format ["!%1_smoke", _unc_player])then
		{	
				
			_round = _smoke_rounds select 0;
			_bloggs_pos = getPos _unc_player;
			_bloggs_offset = (_unc_player distance _bloggs_pos);
			_sav_pos = getPos _reviver;
			_set_dir = ((_bloggs_pos select 0) - (_sav_pos select 0))atan2((_bloggs_pos select 1) - (_sav_pos select 1)); 
			_reviver setDir _set_dir;
			sleep 0.1;
			if(_reviver distance _unc_player > 20) then {_reviver playMove "AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthEnd"};

			_reviver removeMagazine _round;
			_round createVehicle _bloggs_pos;
						
			call compile format ["%1_smoke = true; publicVariable '%1_smoke'", _unc_player]; 
			if(_reviver distance _unc_player <= 20) then {sleep 2};
		};
	};
	sleep 2;
};
if (true) exitWith {};

//Last modified - 010309