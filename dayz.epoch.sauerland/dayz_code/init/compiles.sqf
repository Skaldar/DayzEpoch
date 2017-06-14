if (isServer) then {
	diag_log "Loading custom server compiles";	
};

if (!isDedicated) then {
	diag_log "Loading custom client compiles";
	
	
	player_humanityMorph = compile preprocessFileLineNumbers "dayz_code\compile\player_humanityMorph.sqf"; // This line can be removed when Epoch 1.0.6.2 comes out.
	DZ_KeyDown_EH = compile preprocessFileLineNumbers "dayz_code\compile\keyboard.sqf";
};
