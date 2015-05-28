//MachineGunNests.sqf
_center = _this select 0;
_radius = _this select 1;

_spotFound = false;
_spot = [];
_angle = 0;
while{!_spotFound} do {
	_angle = random 360;
	_distance = random _radius;
	_xPosition = _center select 0;
	_xPosition = _xPosition + (_distance * (sin _angle));
	_yPosition = _center select 1;
	_yPosition = _yPosition + (_distance * (cos _angle));
	_circlePos = [_xPosition, _yPosition,  0];
	
	_isFlat = _circlePos isflatempty [
		2,	//--- Minimal distance from another object
		0,				//--- If 0, just check position. If >0, select new one
		0.3,				//--- Max gradient
		2,	//--- Gradient area
		0,				//--- 0 for restricted water, 2 for required water,
		false,				//--- True if some water can be in 25m radius
		server			//--- Ignored object
	];
	
	if(count _isFlat != 0) then {
		_spotFound = true;
		_spot = _isFlat;
	};
};
_mg = "RHS_M2StaticMG_D" createVehicle _spot;
player moveInGunner _mg;
_mg setDir _angle;
_mg setPosASL _spot;

_bagFence = "Land_BagFence_Round_F" createVehicle _spot;
_bagFence setDir (_angle - 180);
_distance = 3;
_xPosition = _spot select 0;
_xPosition = _xPosition + (_distance * (sin _angle));
_yPosition = _spot select 1;
_yPosition = _yPosition + (_distance * (cos _angle));
_circlePos = [_xPosition, _yPosition,  0];
_circlePos set[2, ((_circlePos select 2) - 0.2)];
_bagFence setPos _circlePos;

_angle = _angle + 180;
_bagFence = "Land_BagFence_Round_F" createVehicle _spot;
_bagFence setDir (_angle + 180);
_distance = 3;
_xPosition = _spot select 0;
_xPosition = _xPosition + (_distance * (sin _angle));
_yPosition = _spot select 1;
_yPosition = _yPosition + (_distance * (cos _angle));
_circlePos = [_xPosition, _yPosition,  0];
_circlePos set[2, ((_circlePos select 2) - 0.2)];
_bagFence setPos _circlePos;