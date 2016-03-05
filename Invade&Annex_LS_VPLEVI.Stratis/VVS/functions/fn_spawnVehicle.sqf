/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the selected vehicle, if a vehicle is already on the spawn point
	then it deletes the vehicle from the spawn point.
*/
disableSerialization;
private["_position","_direction","_className","_displayName","_spCheck","_cfgInfo"];
if(lnbCurSelRow 38101 == -1) exitWith {hint "You did not select a vehicle to spawn!"};

_className = lnbData[38101,[(lnbCurSelRow 38101),0]];
_displayName = lnbData[38101,[(lnbCurSelRow 38101),1]];
_position = getMarkerPos VVS_SP;
_direction = markerDir VVS_SP;

//Make sure the marker exists in a way.
if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?";};

//Check to make sure the spawn point doesn't have a vehicle on it, if it does then delete it.
_spCheck = nearestObjects[_position,["landVehicle","Air","Ship"],12] select 0;
if(!isNil "_spCheck") then {deleteVehicle _spCheck;};

_cfgInfo = [_className] call VVS_fnc_cfgInfo;

_vehicle = _className createVehicle _position;
_vehicle allowDamage false;
_vehicle setPos _position; //Make sure it gets set onto the position.
_vehicle setDir _direction; //Set the vehicles direction the same as the marker.

if((_cfgInfo select 4) == "Autonomous") then
{
	createVehicleCrew _vehicle;
};

if(VVS_Checkbox) then
{
	_vehicle addMagazine "168Rnd_CMFlare_Chaff_Magazine";
	_vehicle addWeapon "CMFlarelauncher";
	_vehicle addWeapon ("GMG_20mm");
	_vehicle addMagazine ("40Rnd_20mm_G_belt");
	_vehicle addMagazine ("40Rnd_20mm_G_belt");
	{_x addCuratorEditableObjects [[_vehicle], false];} foreach adminCurators;
};

_vehicle allowDamage true;
hint format["You have spawned a %1",_displayName];
closeDialog 0;
