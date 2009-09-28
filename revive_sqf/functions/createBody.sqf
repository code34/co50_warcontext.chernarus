// createBody.sqf
// © AUGUST 2009 - norrin

_name 	= _this select 0;
_pos 	= _this select 1;  

call compile format ["_unit_type createUnit [[_pos select 0,_pos select 1, _Offset], group server, 'this setcaptive true;
										    this switchMove ''DeadState'';
											this disableAI ''ANIM'';
											this setdamage 1.0;
											this setVehicleVarName ''norrn_dead_%1'';											    
											norrn_dead_%1 = this;
											this setDir ((%1 getVariable ''NORRN_unc_array'') select 0); 
											this setPos [(%1 getVariable ''NORRN_pos_x''), (%1 getVariable ''NORRN_pos_y''), (%1 getVariable ''NORRN_unc_array'') select 1];
											removeAllWeapons this;
											{this removeMagazine _x} forEach magazines this;
											removeAllItems this;
											{this addMagazine _x;} forEach ((%1 getVariable ''NORRN_unc_array'') select 2);
											{this addWeapon _x;} forEach ((%1 getVariable ''NORRN_unc_array'') select 3);
											this addeventhandler [''hit'', {if (!isNull (_this select 0)) then {(_this select 0) setdamage 0;};}];
											this addeventhandler [''dammaged'', {if (!isNull (_this select 0)) then {(_this select 0) setdamage 0;};}];']", _name];