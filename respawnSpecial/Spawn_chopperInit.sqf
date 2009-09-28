// Spawn_chopperInit.sqf
// July - norrin

if (!isServer) exitWith {};

_chopper 	= _this select 0;
_pos 		= getPos _chopper;
_c			= 0;

_chopper setPos [_pos select 0, _pos select 1, 1000]; 
_chopper flyInHeight 1000; 
_chopper stop true;
_chopper addEventHandler ["HandleDamage", {false}];
_pilot = driver _chopper;
_pilot disAbleAI "MOVE";

while {true} do
{
	_chopper setVelocity [0,0,0];
	_chopper setVectorUp [0.001, 0.001, 1];
	sleep 0.02;
};

if (true) exitWith {};
	

