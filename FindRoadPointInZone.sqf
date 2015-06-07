//FindRoadPointInZone.sqf
_theMarker = _this select 0;
_radius = ((getMarkerSize _theMarker) select 0) ;
_center = getMarkerPos _theMarker;

_minRadius = 1;
_maxRadius = _radius;

_angle = random 360;
_dist =  (random _maxRadius) + _minRadius;
_xx_position = _center select 0; _xx_position = _xx_position + (_dist * (sin _angle));
_yy_position = _center select 1; _yy_position = _yy_position + (_dist * (cos _angle));
_randomStartingPos = [_xx_position, _yy_position,  0];

_right = 1;
_left = -1;
_up = 1;
_down = -1;

_rightPos = [(_randomStartingPos select 0), (_randomStartingPos select 1), (_randomStartingPos select 2) ];
_leftPos = [(_randomStartingPos select 0), (_randomStartingPos select 1), (_randomStartingPos select 2) ];
_upPos = [(_randomStartingPos select 0), (_randomStartingPos select 1), (_randomStartingPos select 2) ];
_downPos = [(_randomStartingPos select 0), (_randomStartingPos select 1), (_randomStartingPos select 2) ];

_foundRoadPointInZone = false;
_anyPointsInZone = true;
_keepGoingRight = true;
_keepGoingLeft = true;
_keepGoingUp = true;
_keepGoingDown = true;
_foundRoadPos = [0,0,0];


if(isOnRoad _randomStartingPos) then {
	_foundRoadPointInZone = true;
	_foundRoadPos = _randomStartingPos;
};


while{!_foundRoadPointInZone && _anyPointsInZone} do {
	if(_keepGoingRight) then {
		_rightPos set[0, ((_rightPos select 0) + _right)];
		if(isOnRoad _rightPos) then {
			if(([_theMarker, _rightPos] call BIS_fnc_inTrigger)) then {
				_foundRoadPos = _rightPos;
				_foundRoadPointInZone = true;
			} else {
				_keepGoingRight = false;
			};
		};
		if(!([_theMarker, _rightPos] call BIS_fnc_inTrigger)) then {
			_keepGoingRight = false;
		};
	};
	
	if(_keepGoingLeft) then {
		_leftPos set[0, ((_leftPos select 0) + _left)];
		if(isOnRoad _leftPos) then {
			if(([_theMarker, _leftPos] call BIS_fnc_inTrigger)) then {
				_foundRoadPos = _leftPos;
				_foundRoadPointInZone = true;
			} else {
				_keepGoingLeft = false;
			};
		};
		if(!([_theMarker, _leftPos] call BIS_fnc_inTrigger)) then {
			_keepGoingLeft = false;
		};
	};
	if(_keepGoingUp)then{
		_upPos set[1, ((_upPos select 1) + _up)];
		if(isOnRoad _upPos) then {
			if(([_theMarker, _upPos] call BIS_fnc_inTrigger)) then {
				_foundRoadPos = _upPos;
				_foundRoadPointInZone = true;
			} else {
				_keepGoingUp = false;
			};
		};
		if(!([_theMarker, _upPos] call BIS_fnc_inTrigger)) then {
			_keepGoingUp = false;
		};
	};
	if(_keepGoingDown) then {
		_downPos set[1, ((_downPos select 1) + _down)];
		if(isOnRoad _downPos) then {
			if(([_theMarker, _downPos] call BIS_fnc_inTrigger)) then {
				_foundRoadPos = _downPos;
				_foundRoadPointInZone = true;
			} else {
				_keepGoingDown = false;
			};
		};
		if(!([_theMarker, _downPos] call BIS_fnc_inTrigger)) then {
			_keepGoingDown = false;
		};
	};
	
	if(!_keepGoingRight && !_keepGoingLeft && !_keepGoingUp && !_keepGoingDown) then {
		_anyPointsInZone = false;
	};
	
};
_foundRoadPos