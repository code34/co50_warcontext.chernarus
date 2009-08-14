// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// Mission loader - list all missions and load them
// -----------------------------------------------
if (!isServer) exitWith{};

private [
	"_position"
	];

		// global variables initilisation
		wcgroupindex = 0;
		wcgroupcount = 0;
		wccounttotalunit = 0;
		wcmissionclear = true;
		wconconnected = true;
	
		// liste des variables que le serveur envoie
		// aux joueurs rejoignant la partie en cours
		// les variables sont traites par le script
		// createclientside.sqf
		setupvariables = {
			publicvariable "wclevel";
			publicvariable "wclevelmax";
			publicvariable "wcmission";
			publicvariable "wcmissionposition";
			publicvariable "wcmissionname";
			publicvariable "wcmissionauthor";
			publicvariable "wceventmission";
		};
		
		onPlayerConnected call setupvariables;
	
		// declaration de toutes les missions utilisables
		mission0 = compile preprocessFile "missions\mission0.sqf";
		mission1 = compile preprocessFile "missions\mission1.sqf";
		mission2 = compile preprocessFile "missions\mission2.sqf";
		mission3 = compile preprocessFile "missions\mission3.sqf";
		mission4 = compile preprocessFile "missions\mission4.sqf";
		//mission5 = compile preprocessFile "missions\mission5.sqf";
		mission6 = compile preprocessFile "missions\mission6.sqf";
		mission7 = compile preprocessFile "missions\mission7.sqf";
		mission8 = compile preprocessFile "missions\mission8.sqf";
		mission9 = compile preprocessFile "missions\mission9.sqf";
		mission10 = compile preprocessFile "missions\mission10.sqf";
		mission11 = compile preprocessFile "missions\mission11.sqf";
		mission12 = compile preprocessFile "missions\mission12.sqf";
		//mission13 = compile preprocessFile "missions\mission13.sqf";
		//mission14 = compile preprocessFile "missions\mission14.sqf";
		mission15 = compile preprocessFile "missions\mission15.sqf";
		//mission16 = compile preprocessFile "missions\mission16.sqf";
		//mission17 = compile preprocessFile "missions\mission17.sqf";
		//mission18 = compile preprocessFile "missions\mission18.sqf";
		//mission19 = compile preprocessFile "missions\mission19.sqf";
		//mission20 = compile preprocessFile "missions\mission20.sqf";
	
		// creation du trigger qui declenche les missions
		// si wcmissionclear = true alors on cree une nouvelle mission
		// la mission utilise par defaut est la 0
		_position = [0,0,0];
		wcmissiontrg = createTrigger["EmptyDetector", _position]; 
		wcmissiontrg setTriggerArea[5,5,0,false];
		wcmissiontrg setTriggerActivation["NONE","PRESENT", true];
		call compile format ["wcmissiontrg setTriggerStatements[""wcmissionclear"", ""
			wcmissionclear = false;
			wcskill = wcskill + 0.05;
			wclevel = wclevel + 1;
			publicvariable 'wclevel';
			nil = [] spawn mission15;
			wcmission = [wcmissiondescription, wcmissionname, wcmissiontarget];
			publicvariable 'wcmission';
			publicvariable 'wcmissionname';
			publicvariable 'wcmissionauthor';
			publicvariable 'wcmissionposition'; 
			wceventmission = true;
			publicvariable 'wceventmission';
		"", """"];", wclevel];