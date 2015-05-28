//GetRandomZone.sqf
_zoneArray = [

	["Operation_Pradesh", 200],
	["Operation_Tal Kar", 400],
	["Operation_Kar Shek", 400], 
	
	["Operation_Chahar Dara", 400],
	["Operation_Gardan", 400],
	["Operation_Annbar Tappeh", 500],
	["Operation_Kamar", 400],
	
	["Operation_Tappah Ka", 500],
	["Operation_Shiek Ka", 300],
	
	["Operation_Tanpeh", 500],
	["Operation_Taher", 300],
	["Operation_Andi", 300],
	
	["Operation_Darrah", 300],
	["Operation_Titoli", 400],
	["Operation_Naqel", 300],
	["Operation_Tal Gozar", 500]
];

_arrayData = _zoneArray select floor random count _zoneArray;
_arrayData