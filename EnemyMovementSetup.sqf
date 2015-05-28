//EnemyMovementSetup.sqf

_center = _this select 0;
_radius = _this select 1;
_numOfPatrols = 2 + (floor random 3);

for "_i" from 0 to (_numOfPatrols - 1) do {
	_buildings = []; 
	while{count _buildings <= 2 } do {
		_angle = random 360;
		_xPosition = _center select 0;
		_xPosition = _xPosition + (_radius * (cos _angle));
		_yPosition = _center select 1;
		_yPosition = _yPosition + (_radius * (sin _angle));
		_circlePos = [_xPosition, _yPosition,  0];
		
		_buildings = nearestObjects [_center, ["house"], 100];
	};
	
	_foundBuilding = [];
	{
		_numOfBuildingPos = 0;
		while {format ["%1", _x buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
			_numOfBuildingPos = _numOfBuildingPos + 1;
		};
		if(_numOfBuildingPos > 0) then {
			_foundBuilding = _x;
		};
	}forEach _buildings;
	_numOfBuildingPos = 0;
	while {format ["%1", _foundBuilding buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
			_numOfBuildingPos = _numOfBuildingPos + 1;
	};
	
	_spawnPos = _foundBuilding buildingPos (floor random _numOfBuildingPos);
	_group = createGroup resistance;
	for "_j" from 1 to 6 do {
		_unit = [_group, _spawnPos, opforUnitList, defaultSoldierType] call Operation_SpawnInsurgent;
	};
	[_group, _center, 50, _radius, 10] execVM "Util\AssignPatrolCircle.sqf";
};