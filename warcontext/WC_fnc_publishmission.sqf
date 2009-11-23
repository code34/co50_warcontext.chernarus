	// -----------------------------------------------
	// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: publish missions variables
	// -----------------------------------------------
	if (!isServer) exitWith {};
	if (!wcinitialised) exitWith {};

	publicvariable "wcinitialised";
	wcmissionW = [wcmissiondescriptionW, wcmissionname, wcmissiontarget, wcmissionnumber, wcmissionauthor, wcmissionposition];
	wcmissionE = [wcmissiondescriptionE, wcmissionname, wcmissiontarget, wcmissionnumber, wcmissionauthor, wcmissionposition];
	publicvariable "wccampaignname";
	publicvariable "wccampaignauthor",
	publicvariable "wccampaigndescription";
	publicvariable "wclevel";
	publicvariable "wclevelmax";
	publicvariable "wcmissionW";
	publicvariable "wcmissionE";
	publicvariable "wcgameend";
	publicvariable "wchospitalW";
	publicvariable "wchospitalE";
	publicvariable "wcradarW";
	publicvariable "wcradarE";
	publicvariable "wcradioW";
	publicvariable "wcradioE";
	publicvariable "wchospitalteleport";
	publicvariable "wctimemax";
	publicvariable "wcmainmissionE";
	publicvariable "wcmainmissionW";
	publicvariable "wcscoreE";
	publicvariable "wcscoreW";