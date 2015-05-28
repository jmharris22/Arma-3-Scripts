//FindSuitableBuildingForEnemySpawn.sqf
_center = _this select 0;
_radius = _this select 1;

_suitable = false;
_counter = 0;
_maxIterations = 1500;
_spawnBuilding = objNull;

while{!_suitable && _counter < _maxIterations} do {
	
	_angle = random 360;
	_dist =  (random _radius) + 15;
	
	_xPosition = _center select 0;
	_xPosition = _xPosition + (_dist * (cos _angle));
	
	_yPosition = _center select 1;
	_yPosition = _yPosition + (_dist * (sin _angle));
	
	_circlePos = [_xPosition, _yPosition,  0];
	
	
	_buildings = nearestObjects [_circlePos, ["house"], _radius];
	
	_c = count _buildings;
	if(_c > 0) then {
		
		_building = _buildings select floor random count _buildings;
		_closeToBase =(_building distance server < 300);
		
		if(!_closeToBase) then {
			
			//is it close to any players?
			_playerClose = false;
			_playersInGame = [] call CBA_fnc_players;
			
			{
				if(_x distance _building < 75)then {_playerClose = true;};
			}foreach _playersInGame;
			_numOfBuildingPos = 0;
			while {format ["%1", _building buildingPos _numOfBuildingPos] != "[0,0,0]"} do {
				_numOfBuildingPos = _numOfBuildingPos + 1;
			};
			if(!_playerClose && _numOfBuildingPos >= 1) then {
				_suitable = true;
				_spawnBuilding = _building;
			};
			
		};
		
	};
	
	_counter = _counter + 1;
};
_spawnBuilding