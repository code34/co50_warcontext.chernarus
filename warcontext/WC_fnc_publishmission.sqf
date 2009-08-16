// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext - Description: publish missions variables
// -----------------------------------------------

	// wait for clientside initialisation
	sleep 10;

	wcmission = [wcmissiondescription, wcmissionname, wcmissiontarget];
	publicvariable "wclevel";
	publicvariable "wclevelmax";
	publicvariable "wcmission";
	publicvariable "wcmissionname";
	publicvariable "wcmissionauthor";
	publicvariable "wcmissionposition";