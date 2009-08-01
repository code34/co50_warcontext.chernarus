// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_unit"
	];

_unit = _this select 0;

_skill = [
	"aimingAccuracy",
	"aimingShake",
	"aimingSpeed",
	"endurance",
	"spotDistance",
	"spotTime",
	"courage",
	"reloadSpeed",
	"commanding",
	"general"
	];

{
_unit setskill [_x, wcskill];
}foreach _skill;