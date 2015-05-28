//CivWalkToRandomBuilding.sqf
_c = _this select 0;
_center = _this select 1;
_radius = _this select 2;

_angle = random 360;
_dist =  (random _radius);
_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
_pos = [_xx_position, _yy_position,  0];
_array = nearestObjects [_pos, ["house"], _radius];
if(count _array > 0) then {
	_building = _array select floor random count _array;

	_numOfBuildingPos = 0;
	while {format ["%1", _building buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
		_numOfBuildingPos = _numOfBuildingPos + 1;
	};

	_buildingPos = floor random _numOfBuildingPos;
	_pos = _building buildingPos _buildingPos;

	_c doMove _pos;
	_c moveTo _pos;
};