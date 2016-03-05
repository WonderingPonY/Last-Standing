/*
@filename: init.sqf
Author:

	Quiksilver

Last modified:

	12/05/2014

Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/

[] execVM "Anticheat.sqf";
[] execVM "AdminMenu.sqf";
[] execVM "memberonlyspawner.sqf";//Gracey

["Initialize"] call BIS_fnc_dynamicGroups;

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};


call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive

//Custom Fatigue
if (hasinterface) then {
waitUntil {!isnull player};
player setCustomAimCoef 0.1;
player setUnitRecoilCoefficient 0.1;
player forceWalk false;
};

enableSaving [false, false];

//null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";

//=================HELIPAD=====================
[] execVM "scripts\helipadInit.sqf";
sleep 0.1;
serialno = 133676;
heliPadOn = 0;
#include "scripts\helipadCamera.sqf"
//============================================
