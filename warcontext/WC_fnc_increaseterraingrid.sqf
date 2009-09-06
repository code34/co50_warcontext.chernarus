// -----------------------------------------------
// Author: =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// -----------------------------------------------
	private [
		"_text"
		];

	if (wcterraingrid < 50) then {
	wcterraingrid = wcterraingrid + 10;
	};
	setTerrainGrid wcterraingrid;
	switch (wcterraingrid) do {
	case 0:
			{
			_text = "very high";
			};
	case 10:
			{
			_text = "high";
			};

	case 20:
			{
			_text = "normal";
			};
	case 30:
			{
			_text = "low";
			};

	case 40:
			{
			_text = "very low";
			};

	case 50:
			{
			_text = "off";
			};
	};
	hint format ["Details du sol: %1", _text];