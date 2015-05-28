//GenericZonePopulator.sqf
_center = _this select 0;
_radius = _this select 1;

_numOfInsurgents = 30;
for "_i" from 1 to 2 do {
	_buildings = nearestObjects [_center, ["house"], _radius];
	for "_j" from 1 to (_numOfInsurgents/2) do { 
		_numOfBuildingPos = 0;
		_building = [];
		_suitable = false;
		_maxIterations = 2000;
		_iteration = 0;
		while{!_suitable && _iteration < _maxIterations} do {
			_r = floor random count _buildings;
			
			_building = _buildings select _r;
			_buildings set[_r, -1];
			_buildings = _buildings - [-1];
			while {format ["%1", _building buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
				_numOfBuildingPos = _numOfBuildingPos + 1;
			};
			if(_numOfBuildingPos > 0) then {
				_suitable = true;
			};
			_iteration = _iteration + 1;
		};
		
		_rBuildingPos = floor random _numOfBuildingPos;
		_pos = _building buildingPos _rBuildingPos;
		_group = createGroup resistance;
		_unit = [_group, _pos, opforUnitList, defaultSoldierType] call Operation_SpawnInsurgent;
	};
};