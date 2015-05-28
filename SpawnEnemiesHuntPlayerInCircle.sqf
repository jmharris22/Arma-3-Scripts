//SpawnEnemiesHuntPlayerInCircle.sqf
_center = _this select 0;
_radius = _this select 1;
_getbuilding = objNull;
while{isnull _getbuilding} do {
	_getbuilding = [_center, _radius] call Operation_FindSuitableBuildingForEnemySpawn;
};
_spawnPos = [];

while{count _spawnPos != 3} do {
	_spawnPos = [_getbuilding] call Operation_GetRandomBuildingPos;
};
_group = createGroup resistance;
for "_i" from 1 to 3 do {
	
	_unit = [_group, _spawnPos, opforUnitList, defaultSoldierType] call Operation_SpawnInsurgent;
};
[_group, _center, _radius] execVM "Util\GroupHuntPlayerInZone.sqf";