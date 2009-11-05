	// -----------------------------------------------
	// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext 
	// Deployed an HOSPITAL
	// -----------------------------------------------
	 private [
		"_hospital"
	];
	
 	if(!isnull wchospital) then {
		if ((position player) distance (position wchospital) < 50) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 4;
			deletevehicle wchospital;
			deletemarker "HOSPITAL";
			nil = [nil,nil,rHINT,'Hospital has been removed'] call RE;
			wchospital = objnull;
			publicvariable "wchospital";
		}else{
			hint 'Hospital already exists. Check map';
		};
	} else {
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 4;
		wchospital = "CDF_WarfareBFieldhHospital" createVehicle [(getposasl player) select 0, (getposasl player) select 1, (getposasl player) select 2];
		wchospital setposasl [(getposasl player) select 0, (getposasl player) select 1, (getposasl player) select 2];
		publicvariable "wchospital";
		['HOSPITAL', 0.5, position wchospital, 'ColorGreen', 'ICON', 'FDIAGONAL', 'Headquarters', 0, 'HOSPITAL'] call WC_fnc_createmarker;
		nil = [nil,nil,rHINT,'Hospital is Deployed'] call RE;
	};