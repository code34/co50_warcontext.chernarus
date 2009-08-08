if (!isServer) exitWith {};

sleep 3;

servicetrigger setPosASL [position servicetrigger select 0, position servicetrigger select 1, 15.9];

uh1 setDamage 0;
uh2 setDamage 0;
osp setDamage 0;
bh1 setDamage 0;
bh2 setDamage 0;
osp2 setDamage 0;

[uh1, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[uh2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[osp, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[bh1, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[bh2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";
[osp2, 120] execVM "extern\x_scripts\x_vehirespawn2H.sqf";

if (true) exitWith {};