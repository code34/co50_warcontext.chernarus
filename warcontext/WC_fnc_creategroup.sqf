// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// units & vehicles class
// http://community.bistudio.com/wiki/ArmA:_CfgVehicles
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_scriptinit",
	"_scriptinitvehicle",
	"_countofgroup",
	"_typeofgroup", 
	"_typeofvehicle",
	"_position", 
	"_motorized",
	"_x", 
	"_y", 
	"_z", 
	"_xtemp",
	"_ytemp",
	"_vehicle", 
	"_vehicle2", 
	"_soldier1",
	"_soldier2", 
	"_soldier3", 
	"_soldier4", 
	"_soldier5", 
	"_soldier6", 
	"_soldier7", 
	"_soldier8",
	"_unitsofgroup"
	];

	_marker = _this select 0;
	_typeofgroup = _this select 1;

	// initialisation script for units
	_scriptinit = format["nil = [this, '%1'] execVM 'extern\ups.sqf';", _marker];
	
	// initialisation script for units in vehicle
	_scriptinitvehicle = format["nil = [this, '%1', 'noslow'] execVM 'extern\ups.sqf';", _marker];

switch (_typeofgroup) do {

	case "strykermg":
			{
				_motorized = true;
				_typeofvehicle = "Stryker_ICV_M2";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};


	case "strykertow":
			{
				_motorized = true;
				_typeofvehicle = "Stryker_TOW";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

      case "strykermk19":
			{
				_motorized = true;
				_typeofvehicle = "Stryker_ICV_MK19";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "uh60mg":
			{
				_motorized = true;
				_typeofvehicle = "UH60MG";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "cobra":
			{
				_motorized = true;
				_typeofvehicle = "ah1W";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};


	case "vulcan":
			{
				_motorized = true;
				_typeofvehicle = "vulcan";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};


	case "m1a1":
			{
				_motorized = true;
				_typeofvehicle = "m1abrams";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "m113":
			{
				_motorized = true;
				_typeofvehicle = "M113";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "humveemg":
			{
				_motorized = true;
				_typeofvehicle = "HMMWV50";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "humveemk":
			{
				_motorized = true;
				_typeofvehicle = "HMMWVMK";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "humveetow":
			{
				_motorized = true;
				_typeofvehicle = "HMMWVTOW";
				_unitsofgroup = [
				"SoldierWcrew",
				"SoldierWcrew"
				];
			};

	case "army1w":
			{
				_motorized = false;
				_unitsofgroup = [
				"SquadLeaderW",
				"SoldierWSniper",
				"SoldierWG",
				"SoldierWMedic",
				"SoldierWAT",
				"SoldierWAA",
				"SoldierWMG",
				"SoldierWG"
				];
			};

	case "special1w":
			{
				_motorized = false;
				_unitsofgroup = [
				"SoldierWSaboteurPipe",
				"SoldierWSaboteurPipe",
				"SoldierWSaboteurPipe",
				"SoldierWSaboteurPipe",
				"SoldierWSaboteurPipe",
				"SoldierWSaboteurMarksman"
				];
			};

	case "special2w":
			{
				_motorized = false;
				_unitsofgroup = [
				"SoldierWSaboteurRecon",
				"SoldierWSaboteurRecon",
				"SoldierWSaboteurRecon",
				"SoldierWSaboteurRecon",
				"SoldierWSaboteurRecon",
				"SoldierWSaboteurRecon"
				];
			};

	case "mi17":
			{
				_motorized = true;
				_typeofvehicle = "Mi17_Ins";
				_unitsofgroup = [
				"RU_Soldier_Pilot",
				"RU_Soldier_Pilot"
				];
			};

	case "mi24":
			{
				_motorized = true;
				_typeofvehicle = "Mi24_D";
				_unitsofgroup = [
				"RU_Soldier_Pilot",
				"RU_Soldier_Pilot"
				];
			};

	case "ka50":
			{
				_motorized = true;
				_typeofvehicle = "Ka52";
				_unitsofgroup = [
				"RU_Soldier_Pilot"
				];
			};

	case "uralrepair":
			{
				_motorized = true;
				_typeofvehicle = "UralRepair";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "uralrefuel":
			{
				_motorized = true;
				_typeofvehicle = "uralrefuel";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "uralreammo":
			{
				_motorized = true;
				_typeofvehicle = "uralreammo";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "d30":
			{
				_motorized = true;
				_typeofvehicle = "d30";
				_unitsofgroup = [
				"RU_Soldier_Crew"
				];
			};

	case "uazmg":
			{
				_motorized = true;
				_typeofvehicle = "UAZMG";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "uazags30":
			{
				_motorized = true;
				_typeofvehicle = "UAZ_AGS30";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "brdm":
			{
				_motorized = true;
				_typeofvehicle = "brdm2";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "brdmatg":
			{
				_motorized = true;
				_typeofvehicle = "BRDM2_ATGM";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "bmp":
			{
				_motorized = true;
				_typeofvehicle = "BMP2_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "tunguska":
			{
				_motorized = true;
				_typeofvehicle = "2S6M_Tunguska";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "shilka":
			{
				_motorized = true;
				_typeofvehicle = "ZSU_INS";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};


	case "t72":
			{
				_motorized = true;
				_typeofvehicle = "T72_RU";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "t90":
			{
				_motorized = true;
				_typeofvehicle = "T90";
				_unitsofgroup = [
				"RU_Soldier_Crew",
				"RU_Soldier_Crew",
				"RU_Soldier_Crew"
				];
			};

	case "army1":
			{
				_motorized = false;
				_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier",
				"RU_Soldier2",
				"RU_Soldier_AA",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_MG",
				"RU_Soldier_Medic"
				];
			};

	case "special1":
			{
				_motorized = false;
				_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier",
				"RU_Soldier2",
				"RU_Soldier_AA",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_MG",
				"RU_Soldier_Medic"
				];
			};

	case "special2":
			{
				_motorized = false;
				_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier",
				"RU_Soldier2",
				"RU_Soldier_AA",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_MG",
				"RU_Soldier_Medic"
				];
			};
	
	default 
		{
			_motorized = false;
			_unitsofgroup = [
				"RU_Commander",
				"RU_Soldier",
				"RU_Soldier2",
				"RU_Soldier_AA",
				"RU_Soldier_AR",
				"RU_Soldier_AT",
				"RU_Soldier_MG",
				"RU_Soldier_Medic"
			];
		};
};


			if (_motorized) then {
				_position = [_marker] call WC_fnc_createpositioninmarker;
			} else {
				_position = [_marker] call WC_fnc_createpositioninmarker;
			};

			wcgroupindex = wcgroupindex + 1;
			wcgroupcount = wcgroupcount + 1;
			call compile format["wcgroup%1 = createGroup wcenemyside;", wcgroupindex];
			_countunits = 1;
	
			{
				if ( wccounttotalunit < wcmaxenemyonmap ) then {
					call compile format["_soldier%1 = wcgroup%3 createUnit [""%2"", _position, [], 0, ""NONE""];", _countunits, _x, wcgroupindex];
					_line = "nil = [_soldier%1, wcskill] spawn WC_fnc_setskill;_soldier%1 addeventhandler ['killed', {_this spawn WC_fnc_garbagecollector}];";
					call compile format[_line, _countunits];
					_countunits = _countunits + 1;
					wccounttotalunit = wccounttotalunit + 1;
					sleep 0.1;
				};
			}foreach _unitsofgroup;

			if (_motorized) then {
				call compile format["_vehicle = createVehicle [""%1"", _position, [], 0, ""NONE""];", _typeofvehicle];
				if(_typeofvehicle == "d30") then {
					_soldier1 moveingunner _vehicle;
				}else{
					_soldier1 moveindriver _vehicle;
					_soldier2 moveingunner _vehicle;
					_soldier3 moveincommander _vehicle;
				};
				_soldier1 setVehicleInit _scriptinitvehicle;
				_vehicle setVehicleInit "[this] spawn EXT_fnc_atot";
			} else {
				_soldier1 setVehicleInit _scriptinit;
			};
			processInitCommands;