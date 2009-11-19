/*
TRIGGER MAKING SCRIPT

This script automatically creates the triggers required for the revive_player.sqf script

© OCTOBER 2008 - norrin

*************************************************************************************************************************************
trigger_mkr.sqf
*/

_mission_end_function = NORRN_revive_array select 0;
_Base_1 = 			NORRN_revive_array select 13;
_Base_2 = 			NORRN_revive_array select 14;
_Base_3 = 			NORRN_revive_array select 15;
_Base_4 = 			NORRN_revive_array select 16;
_Base_free_respawn =	NORRN_revive_array select 36;

_no_enemy_sides =		NORRN_revive_array select 22;
_enemy_side_1 =		NORRN_revive_array select 23;
_enemy_side_2 =		NORRN_revive_array select 24;

_mobile_spawn = 		NORRN_revive_array select 51;
_mobile_base_start = 	NORRN_revive_array select 52;

_Base_1_respawn 		= _Base_free_respawn select 0;
_Base_2_respawn 		= _Base_free_respawn select 1;
_Base_3_respawn 		= _Base_free_respawn select 2;
_Base_4_respawn 		= _Base_free_respawn select 3;

if (_mission_end_function == 1) then
{
	_trig_0 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];	
	_trig_0 setTriggerType "END6";
	_trig_0 setTriggerActivation ["LOGIC", "", false];
	_trig_0 setTriggerArea [1, 1, 0, false];
	_trig_0 setTriggerStatements ["mission_Over", "titleText [""Mission Failed - all players are unconscious"", ""Black Faded"", 1]", ""];
	_trig_0 setTriggerTimeout [15, 15, 15, false];
};

_trig_1 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_1 setTriggerType "NONE";
_trig_1 setTriggerActivation ["LOGIC", "", true];
_trig_1 setTriggerArea [1, 1, 0, false];
_trig_1 setTriggerStatements ["onConnect", "call{[] execVM ""revive_sqf\onConnect.sqf""}",""];

_trig_2 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_2 setTriggerType "NONE";
_trig_2 setTriggerActivation ["LOGIC", "", true];
_trig_2 setTriggerArea [1, 1, 0, false];
_trig_2 setTriggerStatements ["connected", "call{[] execVM ""revive_sqf\connected.sqf""}", ""];

_trig_3 = createTrigger["EmptyDetector",getArray(configFile>>"CfgWorlds">>worldName>>"centerPosition")];
_trig_3 setTriggerType "NONE";
_trig_3 setTriggerActivation ["LOGIC", "", true];
_trig_3 setTriggerArea [1, 1, 0, false];
_trig_3 setTriggerStatements ["onConnect", "call{[] execVM ""revive_sqf\respawn_counter.sqf""}", ""];


if (true) exitWith {};
