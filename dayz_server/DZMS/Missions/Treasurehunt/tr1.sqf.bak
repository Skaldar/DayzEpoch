/*																					//
	Treasure hunt Mission by Brw1990 (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_crate"];

//Name of the Mission
_missName = "Treasure Hunt";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Eine Schatzsuche hat begonnen", "PLAIN",10] call RE;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddTreasurehunt;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) -5, (_coords select 1),0],[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"Treasure"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//Wait until the player is within 2 meters
waitUntil{ {isPlayer _x && _x distance _coords <= 10 } count playableunits > 0 }; 

//Let everyone know the mission is over
[nil,nil,rTitleText,"Mein Schatz, MEIN Schatz!", "PLAIN",6] call RE;
diag_log format["[DZMS]: ARGG The Treasure has been found."];
deleteMarker "DZMStrMarker";

//Let the timer know the mission is over
DZMSTreasureDone = true;