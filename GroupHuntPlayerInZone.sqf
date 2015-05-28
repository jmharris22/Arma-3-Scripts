//GroupHuntPlayerInZone.sqf
_group = _this select 0;
_center = _this select 1;
_radius = _this select 2;
while{count (units _group) > 0} do {
	
	_targetFound = false;
	_target = [];
	_playersInGame = [] call CBA_fnc_players;
	
	{
		if(_x distance _center < _radius) exitWith {
			_targetFound = true;
			_target = _x;
		};
	}forEach _playersInGame;
	
	if(_targetFound) then {
		_wp =_group addWaypoint [(position _target), 15];
		_wp setWaypointType "MOVE";
	};
	sleep 100;
};