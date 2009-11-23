if (!isServer) exitWith {};

sleep 3;

servicetrigger setPosASL [position servicetrigger select 0, position servicetrigger select 1, 17];

if (true) exitWith {};