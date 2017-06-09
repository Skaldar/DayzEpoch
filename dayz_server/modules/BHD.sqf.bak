

private ["_rand_player","_waypointsrange","_aiskin","_zedskin","_plane_class","_loot_lists","_loot","_positionp","_this","_center_1","_unitGroup","_pilot","_carrier","_xpos",
"_ypos","_cor_y","_cor_x","_wp1","_getPos_para1","_zed","_randomCases","_getPos_zed","_Body2","_medicbox"];


_rand_player    = playableUnits call BIS_fnc_selectRandom;
_waypointsrange = 30;//range to move
_aiskin = "TK_Commander_EP1";
_zedskin = "z_new_worker2";
_plane_class = "C130J";


//------------------------------------------------------------------------------------------------------------------------------------------------------------//
/////////////////////////////////////////////////CONFIG LOOT/////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------------------------------//
_loot_lists = [

[
["ChainSaw"],
["equip_herb_box","transfusionKit","bloodTester"]
],

[
["Revolver_DZ"],
["6Rnd_45ACP","Skin_Soldier_Bodyguard_AA12_PMC_DZ","ItemMixOil","ItemComboLock","ItemFuelcan","ItemAntibacterialWipe"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
//------------------------------------------------------------------------------------------------------------------------------------------------------------//
/////////////////////////////////////////////////CONFIG LOOT/////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------------------------------------------------------------------------------//


if((isPlayer _rand_player) && (alive _rand_player)) then {
[nil,nil,rTitleText,"bleeding heart disease in the air", "PLAIN",10] call RE;
_positionp = [_rand_player] call FNC_GetPos;
diag_log format["[Events]: BHD funktioniert"];

	

_this = createCenter civilian;
_center_1 = _this;
_unitGroup = createGroup _center_1;
//

//spawnai
_pilot = objNull;
_pilot = _unitGroup createUnit [_aiskin, [(_positionp select 0) + 90, (_positionp select 1) + 100], [], 1, "NONE"];
_pilot addEventHandler ["handleDamage", {false}];
[_pilot] joinSilent _unitGroup;
sleep 1;
_carrier =  createVehicle [_plane_class, [(_positionp select 0) + 50, (_positionp select 1) + 50],[], 0, "FLY"];
_carrier         setVehicleVarName "heli";
_carrier 		setFuel 1;
_carrier 		engineOn true;
_carrier 		setVehicleAmmo 1;
_carrier 		flyInHeight 150;
_carrier 		setVehicleLock "LOCKED";
_carrier 		addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];


dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_carrier];
_pilot 	assignAsDriver _carrier;
_pilot 	moveInDriver _carrier;



//waypoints
_xpos = _positionp select 0;
_ypos = _positionp select 1;
_cor_y = -20;
_cor_x = 20;
_wp1 = _unitGroup addWaypoint [[((_positionp select 0) + _cor_y),((_positionp select 1) + _cor_x),50],0];
_wp1   setWaypointType "MOVE";


sleep 5;
deleteVehicle _pilot;
_carrier setDamage 1;

sleep 7;

_getPos_para1 = getPos _carrier;

_zed = objNull;
_zed = _unitGroup createUnit [_zedskin, [(_getPos_para1 select 0) + 2, (_getPos_para1 select 1) + 2], [], 1, "NONE"];
[_zed] joinSilent _unitGroup;
_zed playMove "AinvPknlMstpSnonWrflDnon_medic1"; 
removeAllWeapons _zed;
removeAllItems _zed;
_randomCases = round(random(3));
switch (_randomCases) do {    
        case 0 :{
	_zed addMagazine "ItemSapphire";	
		};
		
		case 1 :{
	_zed addMagazine "ItemEmerald";
		};
		case 2 :{
	_zed addMagazine "ItemTopaz";
		};
};



_getPos_zed = getPos _zed;
_Body2 = createVehicle ["Body2",[(_getPos_zed select 0)+0, (_getPos_zed select 1)+0,-0.12],[], 0, "CAN_COLLIDE"];
_Body2 setVectorUp surfaceNormal position _Body2;




_medicbox = createVehicle ["MedBox1", [(_getPos_para1 select 0) + 3, (_getPos_para1 select 1) - 1,-0.12],[], 0, "CAN_COLLIDE"];
clearMagazineCargoGlobal _medicbox;
clearWeaponCargoGlobal _medicbox;

// Add loot to the crate
{
_medicbox addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_medicbox addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);



sleep 300;

deleteVehicle _carrier;
deleteVehicle _zed;
deleteVehicle _Body2;
deleteVehicle _medicbox;
};