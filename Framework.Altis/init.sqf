enableSaving [false,false];

if(isServer) then { [] execVM "\Framework.Backend\init.sqf"; };

waitUntil{!(isNil "Framework_ServerLoaded")};
waitUntil{Framework_ServerLoaded isEqualTo true};

if(isDedicated) exitWith {};

Player_Loaded = false;

waitUntil {((vehicle player) isEqualTo player)};

sleep 1.5;

[] call Framework_Player_Initialize;