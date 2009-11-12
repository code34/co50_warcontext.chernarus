	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: publish missions variables
	// -----------------------------------------------
	if (!isServer) exitWith {};
	if (!wcinitialised) exitWith {};

	publicvariable "wcinitialised";
	wcmission = [wcmissiondescription, wcmissionname, wcmissiontarget];
	publicvariable "wccampaignname";
	publicvariable "wccampaignauthor",
	publicvariable "wccampaigndescription";
	publicvariable "wclevel";
	publicvariable "wclevelmax";
	publicvariable "wcmission";
	publicvariable "wcmissionname";
	publicvariable "wcmissionauthor";
	publicvariable "wcmissionposition";
	publicvariable "wcgameend";
	publicvariable "wchospital";
	publicvariable "wcradar";
	publicvariable "wcradio";
	publicvariable "wchospitalteleport";