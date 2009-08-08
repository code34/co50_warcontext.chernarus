// by Xeno
private ["_grp","_grpskill","_pos","_unitliste"];
_pos = _this select 0;
_unitliste = _this select 1;
_grp = _this select 2;

_grpskill = (d_skill_array select 0) + (random (d_skill_array select 1));
{_x createunit [_pos, _grp, "", _grpskill];sleep 0.01} foreach _unitliste;
sleep 0.5312;
{if ((format["%1",_x getVariable "ke"]) == "<null>") then {_x addEventHandler ["killed", {[_this select 0] call XAddDead;_x setVariable ["ke", 1]}} foreach units _grp;

