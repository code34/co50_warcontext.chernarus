// by Xeno
private ["_rarray", "_glindex", "_ctrl, "_index", "_selection", "_control", "_selectedIndex", "_real_list", "_vlist"];

//disableSerialization;


_selection = _this select 0;

_control = _selection select 0;
_selectedIndex = _selection select 1;

if (_selectedIndex == -1) exitWith {};

_real_list = [50, 25, 12.5];
_vlist = ["No Gras", "Medium Gras", "Full Gras"];
if (d_graslayer_index != _selectedIndex) then {
	d_graslayer_index = _selectedIndex;
	setTerrainGrid (_real_list select d_graslayer_index);

	//(format ["Gras layer set to: %1",_vlist select d_graslayer_index]) call XfGlobalChat;
};

if (true) exitWith {};