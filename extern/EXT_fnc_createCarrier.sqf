	// Original LHD placement script by ArMaTeC
	private ["_i", "_LHDspawnpoint", "_playerspawnpoint", "_vehicle", "_array"];

	_LHDdir = 70;
	_LHDspawnpoint = [13668,1125.05,0];
	_parts = 
	[
		"Land_LHD_house_1",
		"Land_LHD_house_2",
		"Land_LHD_elev_R",
		"Land_LHD_1",
		"Land_LHD_2",
		"Land_LHD_3",
		"Land_LHD_4",
		"Land_LHD_5",
		"Land_LHD_6"
	];
	{
		_dummy = _x createvehicle _LHDspawnpoint;
		_dummy setdir _LHDdir;
		_dummy setpos _LHDspawnpoint;
	} foreach _parts;
