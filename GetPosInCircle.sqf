//GetPosInCircle.sqf

private ["_center", "_minRadius", "_maxRadius", "_angle", "_dist", "_xx_position", "_yy_position", "_returnPos"];
_center = _this select 0;
_minRadius = _this select 1;
_maxRadius = _this select 2;

_angle = random 360;
_dist =  (random _maxRadius) + _minRadius;
_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (cos _angle));
_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (sin _angle));
_returnPos = [_xx_position, _yy_position,  0];
_returnPos