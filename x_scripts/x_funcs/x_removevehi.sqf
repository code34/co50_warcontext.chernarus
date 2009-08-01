// by Xeno
private ["_aunit", "_type", "_direction", "_position", "_velocity", "_speed", "_dummyvehicle"];
if (!isServer) exitWith{};

_aunit = _this select 0;
_aunit removeAllEventHandlers "getout";
_aunit removeAllEventHandlers "killed";
_aunit removeAllEventHandlers "hit";
_type = typeOf _aunit;
_direction = direction _aunit;
_position = position _aunit;
_velocity = velocity _aunit;
_speed = speed _aunit;
{deleteVehicle _x} forEach ([_aunit] + crew _aunit);
_dummyvehicle = _type createVehicle _position;
_dummyvehicle setDir _direction;
_dummyvehicle setPos _position;
_dummyvehicle setVelocity _velocity;
_dummyvehicle setFuel 0.0;
_dummyvehicle setDamage 1.1;
[_dummyvehicle] call XAddDead;

if (true) exitWith {};