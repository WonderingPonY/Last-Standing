/*
	File: fn_onTerrainChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the players terraingrid when called.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {};
	
switch (_type) do
{
	case "off": {setTerrainGrid 50;};
	case "low": {setTerrainGrid 30;};
	case "norm": {setTerrainGrid 12.5;};
	case "high": {setTerrainGrid 3.125;};
};