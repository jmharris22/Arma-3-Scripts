//UnitPatrolHouse.sqf
_unit = _this select 0;
_building = _this select 1;
_numOfSpots = _this select 2;
_group = group _unit;
_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

_waypoints =  [];
for "_i" from 0 to (_numOfSpots - 1) do {
	_waypoints = _waypoints + [_building buildingPos _i];
};

_center = _building buildingPos 0;
for "_j" from 1 to 3 do {
	_dist = (random 6) + 10;
	_angle = random 360;
	_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
	_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
	_waypoints = _waypoints + [[_xx_position, _yy_position,  0]];
};

while{alive _unit} do {
	_timeout = time + 50;
	_pos = _waypoints select floor random count _waypoints;
	_unit doMove _pos;
	_unit moveTo _pos;
	waitUntil {moveToCompleted _unit || moveToFailed _unit || !alive _unit || _timeout < time};	
};