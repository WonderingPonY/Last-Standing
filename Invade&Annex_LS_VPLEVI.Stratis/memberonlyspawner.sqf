if ((getPlayerUID player) in ["76561198027253339","76561197998528511","76561197971881198","76561198169221642","76561198078198558","76561198185082274"]) then {
vvsspawner addAction["Virtual Vehicle Spawner",VVS_fnc_openVVS,["VVS_all_1","All"]];
vvsspawner addAction["<t color='#ff9900'>HALO jump</t>", "ATM_airdrop\atm_airdrop.sqf"]
} else {
titleText ["Sorry, nothing to see here...", "PLAIN DOWN", 3];
};