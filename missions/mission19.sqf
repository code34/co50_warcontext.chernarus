// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: 
// -----------------------------------------------

	wcmissionauthor ="=[A*C]= code34";
	wcmissiondescription = "Today it is your turn. Your squad had been assigned to patrol in friendly citie. 
	There is no particular goal: watch and inform us immediatly if something happens. No enemy had been detected in this area since a long time.";
	wcmissiontarget = "";

	_position = [wcmaptopright, wcmapbottomleft, "onvalley"] call WC_fnc_createposition;
	wcmissionposition = _position;

	//NameCityCapital
	//NameCity
	//NameVillage 

	_nearestCity = nearestLocation [_position, "NameVillage"];
	wcmissionname = "On guard in " + text _nearestCity;

	nil = [] spawn WC_fnc_publishmission;