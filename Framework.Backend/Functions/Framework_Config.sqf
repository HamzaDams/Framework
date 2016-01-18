["Framework_Config_GetItem", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_Items;

	switch (_search) do {
		default { _return = _config; };
		case "name": { _return = _config select 1; };
		case "weight": { _return = _config select 2; };
		case "function": { _return = _config select 3; };
		case "dropClass": { _return = _config select 4; };
		case "canUse": { _return = _config select 5; };
		case "canDrop": { _return = _config select 6; };
		case "canGive": { _return = _config select 7; };
		case "desc": { _return = _config select 8; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetShopInfo", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_ShopInfo;

	switch (_search) do {
		default { _return = _config; };
		case "name": { _return = _config select 1; };
		case "price": { _return = _config select 2; };
		case "owner": { _return = _config select 3; };
		case "stock": { _return = _config select 4; };
		case "money": { _return = _config select 5; };
		case "type": { _return = _config select 6; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetShops", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_Shops;

	switch (_search) do {
		default { _return = _config; };
		case "items": { _return = _config select 1; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetGear", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_Gear;

	switch (_search) do {
		default { _return = false; };
		case "name": { _return = _config select 1; };
		case "type": { _return = _config select 2; };
		case "weaponType": { _return = _config select 2; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetFishingTools", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_FishingTools;

	switch (_search) do {
		default { _return = false; };
		case "Skill": { _return = _config select 1; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetFish", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_Fish;

	switch (_search) do {
		default { _return = false; };
		case "Fish": { _return = _config select 1; };
	};

	_return;
}] call Framework_Compile;

["Framework_Config_GetVehicle", {
	private ["_class", "_Search", "_config", "_return"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_search = [_this, 1, '', ['']] call BIS_fnc_param;
	_config = [];
	_return = "";

	{
		if(_x select 0 == _class) then {
			_config = _x;
		};
	} forEach Config_Vehicles;

	switch (_search) do {
		default { _return = false; };
		case "name": { _return = _config select 1; };
		case "space": { _return = _config select 2; };
	};

	_return;
}] call Framework_Compile;