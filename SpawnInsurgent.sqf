//SpawnInsurgent.sqf
_group = _this select 0;
_pos = _this select 1;
_unitList = _this select 2;
_defaultUnit = _this select 3;

_soldierType = "";

_rand = floor random 100;
if(_rand < 35) then {
	_soldierType = _defaultUnit;
} else {
	_soldierType = _unitList select floor random count _unitList;
};

_unit = _group createUnit [_soldierType, [0,0,0], [], 1, "CAN_COLLIDE"];
_unit setPos _pos;
_unit setSkill ["aimingAccuracy", 0.2];
_unit setSkill ["aimingSpeed", 0.2];
_unit setSkill ["spotDistance", 1];
_unit