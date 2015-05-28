//CivWalker.sqf
_c = _this select 0;
_marker = _this select 1;
_scripts = ["util\CivWalkToRandomSpot.sqf", "util\CivWalkToRandomBuilding.sqf"];
while{alive _c} do {
	_center = getMarkerPos _marker;
	_script = _scripts select floor random count _scripts;
	[_c,_center, 400 ] execVM _script;
	sleep 90;
};