if (!isServer) exitWith {};

sleep 3;

servicetrigger setPosASL [position servicetrigger select 0, position servicetrigger select 1, 17];

j1 assignAsCommander uh1;
j1 assignAsCommander uh2;
j1 assignAsCommander uh3;
j1 assignAsCommander mv22;
j1 assignAsCommander bh1;
j1 assignAsCommander bh2;

uh1 setDamage 0;
uh2 setDamage 0;
uh3 setDamage 0;
mv22 setDamage 0;
bh1 setDamage 0;
bh2 setDamage 0;

[uh1, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[uh2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[uh3, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[mv22, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[bh1, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[bh2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";

[RU1, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU3, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU4, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU5, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU6, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU7, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU8, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[RU9, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";

if (true) exitWith {};