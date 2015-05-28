//CivWalkToRandomSpot.sqf
_c = _this select 0;
_center = _this select 1;
_radius = _this select 2;

_angle = random 360;
_dist =  (random _radius) + 30;
_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
_waypointPos = [_xx_position, _yy_position,  0];
_c doMove _waypointPos;
_c moveTo _waypointPos;