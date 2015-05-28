//GetRandomBuildingPos.sqf
_building = _this select 0;
_pos = [0,0,0];

_numOfBuildingPos = 0;
while {format ["%1", _building buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
	_numOfBuildingPos = _numOfBuildingPos + 1;
};

if( _numOfBuildingPos > 0) then {

	_pos = _building buildingPos (floor random _numOfBuildingPos);
	_zPos = position _building select 2;
	_zPos2 = _pos select 2;
	_diff = abs(_zPos2 - _zPos);
	while{_diff > 2} do {
		_pos = _building buildingPos (floor random _numOfBuildingPos);
		_zPos = position _building select 2;
		_zPos2 = _pos select 2;
		_diff = abs(_zPos2 - _zPos);
	};
};
_pos