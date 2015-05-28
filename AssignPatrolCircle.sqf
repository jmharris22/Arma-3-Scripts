//AssignPatrolCircle.sqf

_group = _this select 0;
_center = _this select 1;
_minRadius = _this select 2;
_maxRadius = _this select 3;
_numOfWaypoints = _this select 4;

for "_i" from 0 to (_numOfWaypoints - 1) do {
	_angle = random 360;
	_dist =  (random _maxRadius) + _minRadius;
	_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
	_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
	_waypointPos = [_xx_position, _yy_position,  0];
	_wp = _group addWaypoint [_waypointPos, 15];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
};
_angle = random 360;
_dist =  (random _minRadius) + 30;
_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
_waypointPos = [_xx_position, _yy_position,  0];
_cycleWP = _group addWaypoint [_waypointPos, 15];
_cycleWP setWaypointBehaviour "SAFE";
_cycleWP setWaypointType "CYCLE";
_cycleWP setWaypointSpeed "LIMITED";
_group setCurrentWaypoint [_group, 1];