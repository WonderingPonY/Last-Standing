private ["_veh"];
_veh = _this select 0;

if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};

if (!(_veh isKindOf "helicopter")) exitWith {_veh vehicleChat "This pad is for aircraft service only, soldier!";};

_veh vehicleChat "Servicing aircraft, please wait ...";

_veh setFuel 0;

sleep 1;

_veh setDamage 0;
_veh vehicleChat "Repaired";

sleep 1;
_veh setVehicleAmmo 1;
_veh vehicleChat "Re-armed";

Sleep 1;
_veh setFuel 1;
_veh vehicleChat "Refuelled";

sleep 2;
_veh vehicleChat "Service complete.";