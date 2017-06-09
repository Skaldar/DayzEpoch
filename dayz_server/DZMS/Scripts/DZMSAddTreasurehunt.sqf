/*
	Adds a marker for Treasure hunt Missions. Only runs once.
	DZMSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
DZMStrCoords = _this select 0;
DZMStrName = _this select 1;

_nul = createMarker ["DZMStrMarker", DZMStrCoords];
"DZMStrMarker" setMarkerColor "ColorGreen";
"DZMStrMarker" setMarkerShape "ELLIPSE";
"DZMStrMarker" setMarkerBrush "Grid";
"DZMStrMarker" setMarkerSize [200,200];
