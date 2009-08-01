if (!X_Server) exitWith{};

groups_east = [];
dead_list = [];
groups_west = [];
groups_resistance = [];
groups_civilian = [];
can_create_group = true;
can_add_patrol_group = true;
patrol_groups_array = [];

if (isNil "d_skill_array") then {d_skill_array = [0.3,0.2];};
if (isNil "x_lock_spawned") then {x_lock_spawned = false};

if (isNil "d_attackwaves_radius") then {d_attackwaves_radius = 30;};

if (isNil "d_sleader_E") then {d_sleader_E = "RU_Soldier_SL";};
if (isNil "d_sleader_W") then {d_sleader_W = "SquadLeaderW";};
if (isNil "d_sleader_G") then {d_sleader_G = "SquadLeaderG";};
if (isNil "d_crewman_E") then {d_crewman_E = "RU_Soldier_Crew";};
if (isNil "d_crewman2_E") then {d_crewman2_E = "RU_Soldier";};
if (isNil "d_crewman_W") then {d_crewman_W = "SoldierWCrew";};
if (isNil "d_crewman2_W") then {d_crewman2_W = "SoldierWB";};
if (isNil "d_crewman_G") then {d_crewman_G = "SoldierGCrew";};
if (isNil "d_crewman2_G") then {d_crewman2_G = "SoldierGB";};
if (isNil "d_pilot_E") then {d_pilot_E = "RU_Soldier_Pilot";};
if (isNil "d_pilot_W") then {d_pilot_W = "SoldierWPilot";};
if (isNil "d_pilot_G") then {d_pilot_G = "SoldierGPilot";};
if (isNil "d_allmen_E") then {d_allmen_E = ["RU_Soldier_AA","RU_Soldier_HAT","RU_Soldier_AR","RU_Soldier_GL","RU_Soldier_MG","RU_Soldier_Marksman","RU_Soldier_Medic","RU_Soldier","RU_Soldier_LAT","RU_Soldier_AT","RU_Soldier2","RU_Soldier_Sniper","RU_Soldier_SniperH","RU_Soldier_Spotter","RU_Soldier_TL"];};
if (isNil "d_allmen_W") then {d_allmen_W = ["SoldierWB","SoldierWMedic","SoldierWG","SoldierW","SoldierWNOG","SoldierWMG","SoldierWAT","SoldierWAA","SoldierWSniper","SoldierWMiner"];};
if (isNil "d_allmen_G") then {d_allmen_G = ["SoldierGB","SoldierGMedic","SoldierGG","SoldierG","SoldierGNOG","SoldierGMG","SoldierGAT","SoldierGAA","SoldierGSniper","SoldierGMiner"];};
if (isNil "d_specops_E") then {d_specops_E = ["RUS_Soldier_Sab","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Soldier1","RUS_Soldier2","RUS_Soldier3","RUS_Soldier_TL"];};
if (isNil "d_specops_W") then {d_specops_W = ["SoldierWSaboteur","SoldierWSaboteurPipe","SoldierWSaboteurPipe2","SoldierWSaboteurRecon","SoldierWSaboteurAssault","SoldierWSaboteurMarksman"];};
if (isNil "d_specops_G") then {d_specops_G = ["SoldierGCommando","SoldierGMarksman","SoldierGGuard"];};

if (isNil "d_veh_a_E") then {d_veh_a_E = ["T90","BMP3","BTR90","2S6M_Tunguska","GAZ_Vodnik","GAZ_Vodnik_HMG","DSHKM","AGS_RU","D30_RU","KamazRefuel","KamazRepair","KamazReammo"];};
if (isNil "d_veh_a_W") then {d_veh_a_W = ["M1Abrams","Stryker_ICV_M2","M113","Vulcan","HMMWV50","HMMWVMK","M2StaticMG","AGS","M119","Truck5tRefuel","Truck5tRepair","Truck5tReammo"];};
if (isNil "d_veh_a_G") then {d_veh_a_G = ["M1Abrams","M113_RACS","M113_RACS","Vulcan_RACS","LandroverMG","HMMWVMK","M2StaticMG","AGS","M119","Truck5tRefuel","Truck5tRepair","Truck5tReammo"];};

if (isNil "x_attack_chopper_east") then {x_attack_chopper_east = "Mi24_P"};
if (isNil "x_attack_chopper_west") then {x_attack_chopper_west = "AH1W"};
if (isNil "x_attack_chopper_racs") then {x_attack_chopper_racs = "AH6_RACS"};
if (isNil "x_attack_plane_east") then {x_attack_plane_east = "Su39"};
if (isNil "x_attack_plane_west") then {x_attack_plane_west = "A10"};
if (isNil "x_attack_plane_racs") then {x_attack_plane_racs = "A10"};
if (isNil "x_transport_chopper_east") then {x_transport_chopper_east = "Mi17_rockets_RU"};
if (isNil "x_transport_chopper_west") then {x_transport_chopper_west = "UH60"};
if (isNil "x_transport_chopper_racs") then {x_transport_chopper_racs = "UH60Racs"};
if (isNil "x_transport_plane_east") then {x_transport_plane_east = "RC_be32k"};
if (isNil "x_transport_plane_west") then {x_transport_plane_west = "RC_Be32kUS"};
if (isNil "x_transport_plane_racs") then {x_transport_plane_racs = "RC_Be32kUS"};

if (isNil "x_addkilledhandler") then {x_addkilledhandler = [];};
if (isNil "x_suppressiv") then {x_suppressiv = false;};
x_ran_val_array = [];

x_removevehi = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_removevehi.sqf";
x_creategroup = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_creategroup.sqf";
x_getwparray = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_getwparray.sqf";
x_getwparray2 = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_getwparray2.sqf";
x_getwparray3 = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_getwparray3.sqf";
x_getrandom = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_getrandom.sqf";
x_makevgroup = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_makevgroup.sqf";
x_makemgroup = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_makemgroup.sqf";
x_getunitliste = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_getunitliste.sqf";
XGuardWP = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_guardwp.sqf";
XAttackWP = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_attackwp.sqf";
XAttackWavesWP = compile preprocessFileLineNumbers "x_scripts\x_funcs\x_attackwaveswp.sqf";

XAddDead = {
	dead_list = dead_list + [_this select 0];
};

[] execVM "x_scripts\x_removedead.sqf";
[] execVM "x_scripts\x_patrol.sqf";
if (count x_addkilledhandler > 0) then {[] execVM "x_scripts\x_initaddkilledhandler.sqf";};

if (true) exitWith {};