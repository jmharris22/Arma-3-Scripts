//HuntPlayer.sqf
_unit = _this select 0;
while{alive _unit} do {
	
	_playersInGame = [] call CBA_fnc_players;
	
	_iterations = 0;
	_maxIterations = (count _playersInGame) * 10;
	_suitableTargetPlayerFound = false;
	_targetPlayer = [];
	while{!_suitableTargetPlayerFound && _iterations < _maxIterations} do {
		_targetPlayer = _playersInGame select floor random count _playersInGame;
		if(( getposATL _targetPlayer) select 2 < 12 && (_targetPlayer distance server > 200)) then {
			_suitableTargetPlayerFound = true;
		};
		_iterations = _iterations + 1;
	};
	
	_pos = [];
	if(_suitableTargetPlayerFound) then {
		_pos = position _targetPlayer;
	} else {
		_pos = position _unit;
	};
	_timeout = time + 60;
	_unit doMove _pos;
	_unit moveTo _pos;
	waitUntil {moveToCompleted _unit || moveToFailed _unit || !alive _unit || _timeout < time};	
};