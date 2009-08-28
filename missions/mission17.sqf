// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: DESTROY
// -----------------------------------------------

	wcmissionauthor ="=[A*C]=Lueti";
	wcmissionname = "Target switch";
	wcmissiondescription = "Massive enemy reinforcements are on the way to Chernarus. 
	They divided thoses reinforcements in several convoys in order to minimize the ambushes. Do your best to destroy them as much as possible.";
	wcmissiontarget = "";
	wcmissionposition = [];
	nil = [] spawn WC_fnc_publishmission;


	_source_position1 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position1 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createpositionon;

	_position1 = _source_position1;
	wcmissionposition = _position1;
	nil = [] spawn WC_fnc_publishmission;
	
	_markersize = 500;
	_markername = "sourceposition1";
	_position1 = _source_position1;
	nil = [_markername, _markersize, _position1, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition1";
	_position1 = _destination_position1;
	nil = [_markername, _markersize, _position1, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_T901 = [_position, 0, "T90", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_T902 = [_position, 0, "T90", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Tunguska = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Vodnik = [_position, 0, "GAZ_Vodnik", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_units = ["RUS_Commander","RUS_Soldier1","RUS_Soldier1","RUS_Soldier1","RUS_Soldier_GL","RUS_Soldier_Marksman"];
	_groupvodnik = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_groupvodnik moveincargo _Vodnik;

	convoi1= [_T901,_T902,_Tungunska,_Vodnik];

	_source_position2 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position2 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createpositionon;

	_position2 = _source_position2;
	wcmissionposition = _position2;
	nil = [] spawn WC_fnc_publishmission;
	
	_markersize = 500;
	_markername = "sourceposition2";
	_position2 = _source_position2;
	nil = [_markername, _markersize, _position2, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition2";
	_position2 = _destination_position2;
	nil = [_markername, _markersize, _position2, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_Bmp3 = [_position, 0, "Bmp3", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Bmp3 = [_position, 0, "Bmp3", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Tunguska = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	convoi2= [_Bmp3,_Bmp3,_Tungunska];

	_source_position3 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	_destination_position3 = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createpositionon;

	_position3 = _source_position3;
	wcmissionposition = _position3;
	nil = [] spawn WC_fnc_publishmission;
	
	_markersize = 500;
	_markername = "sourceposition3";
	_position3 = _source_position3;
	nil = [_markername, _markersize, _position3, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_markersize = 500;
	_markername = "destinationposition3";
	_position3 = _destination_position3;
	nil = [_markername, _markersize, _position3, 'ColorBLUE', 'ELLIPSE', 'FDIAGONAL'] call WC_fnc_createmarker;

	_T90 = [_position, 0, "T90", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Tunguska = [_position, 0, "2S6M_Tunguska", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Btr = [_position, 0, "Btr90", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Grad = [_position, 0, "Grad_RU", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_KamazOpen = [_position, 0, "KamazOpen", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_units = ["RUS_Commander","RUS_Soldier1","RUS_Soldier1","RUS_Soldier1","RUS_Soldier_GL","RUS_Soldier1","RUS_Soldier_GL","RUS_Soldier_Marksman"];
	_groupKamazOpen = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_groupKamazOpen moveincargo _KamazOpen;

	_Kamaz = [_position, 0, "Kamaz", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_units = ["RUS_Commander","RUS_Soldier1","RUS_Soldier1","RUS_Soldier1","RUS_Soldier_GL","RUS_Soldier1","RUS_Soldier_GL","RUS_Soldier_Marksman"];
	_groupKamaz = [_position, east, _units, [], [],[wcskill,wcskill,wcskill]] call BIS_fnc_spawnGroup;
	_groupKamaz moveincargo _Kamaz;

	_KamazReammo = [_position, 0, "KamazReammo", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	_Uaz = [_position, 0, "UAZ_AGS30_RU", east] call BIS_fnc_spawnVehicle;
	_crew = _grad select 1;
	{[_x, wcskill]spawn WC_fnc_setskill;}foreach _crew;

	convoi3= [_T90,_Tungunska,_Btr,_Grad,_KamazOpen,_Kamaz,_KamazReammo,_Uaz];