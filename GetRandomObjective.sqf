//GetRandomObjective.sqf

_objectiveArray = [
	[0, "Enemy Movement"],
	[1, "Pilot Rescue"],
	[2, "Enemy Stronghold"],
	[3, "Enemy Deopt"],
	[4, "Supply Local Militia"],
	[5, "Supply Locals"],
	[6, "High Value Target"],
	[7, "PilotDown"]
	
	
];
_dataArray = _objectiveArray select floor random count _objectiveArray;
_dataArray