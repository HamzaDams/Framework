['Framework_Vehicle_SetVarName', {
	private ['_vehicle', '_id'];

	_vehicle = [_this, 0, objNull, [objNull]] call BIS_Fnc_Param;
	_id = [_this, 1, '', ['']] call BIS_Fnc_Param;

	_vehicle setVehicleVarName _id;
	_vehicle Call Compile format ["%1 = _this ; publicVariable '%1'", _id];
}] call Framework_Compile;

['Framework_Vehicle_Create', {
	private ['_classname', '_letters', '_id', '_vehicle'];

	_classname = [_this, 0, '', ['']] call BIS_Fnc_Param;
	_letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
	_format = [_letters call BIS_fnc_selectRandom, round(random(9))];
	_id = format['%1%2%3%4%5%6', _format call BIS_fnc_selectRandom, _format call BIS_fnc_selectRandom, _format call BIS_fnc_selectRandom, _format call BIS_fnc_selectRandom, _format call BIS_fnc_selectRandom, _format call BIS_fnc_selectRandom];
	
	_vehicle = _classname createVehicle (position player);
	_vehicle setVariable ['License', _id, true];
	_vehicle setVariable ['Owner', name player, true];
	_vehicle setVariable ['OwnerID', getPlayerUID player, true];
	_vehicle setVariable ['Trunk', [], true];
	_vehicle setVariable ['Users', [getPlayerUID player], true];
	_vehicle setVariable ['MaxSpace', ([_classname, 'space'] call Framework_Config_GetVehicle), true];
	_vehicle setVariable ['Space', 0, true];

	[[_vehicle, _id], "Framework_Vehicle_SetVarName", nil, true] spawn BIS_fnc_MP;
}] call Framework_Compile;

['Framework_Vehicle_Lock', {
	private ['_vehicle', '_locked'];

	_vehicle = [_this, 0] call BIS_Fnc_Param;
	_locked = locked _vehicle;

	switch (_locked) do {
		case 1: {
			_vehicle lock true;
			["You have locked the vehicle.", Framework_Color_Blue] call Framework_Message_Notification;
		};

		case 2: {
			_vehicle lock false;
			["You have unlocked the vehicle.", Framework_Color_Blue] call Framework_Message_Notification;
		};
	};
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Open', {
	private ['_vehicle'];

	_vehicle = [_this, 0] call BIS_Fnc_Param;

	createDialog "Dialog_VehicleInteraction";

	Current_Vehicle = _vehicle;

	[] call Framework_Vehicle_Interaction_Populate;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Populate', {
	private ['_actionName', '_action', '_args', '_index'];
	
	buttonSetAction [17761, "call Framework_Vehicle_Interaction_AddUser"];

	{
		_actionName = _x select 0;
		_action = _x select 1;
		_args = _x select 2;

		if ((call compile _args) isEqualTo true) then {
			_index = lbAdd [17661, format["%1", _actionName]];
			lbSetData [17661, _index, _action];
		};
	} forEach Config_vehicleInteractionActions;

	[] call Framework_Vehicle_Interaction_Information;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_OnSelect', {
	private ['_selection', '_data'];

	_selection = lbCurSel 17661;
	_data = lbData [17661, _selection];

	call compile (_data);
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Information', {
	lbClear 17662;
	ctrlEnable [17761, false];

	{
		lbAdd [17662, format["%1 %2", _x select 0, call compile (_x select 1)]];
	} forEach Config_VehicleInformation;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_ManageUsers', {
	lbClear 17662;
	ctrlEnable [17761, true];

	{
		if ((_x distance player) <= 10) then {
			_index = lbAdd [17662, format["%1 (%2)", name _x, _x]];
			lbSetData [17662, _index, str _x];
		};
	} forEach playableUnits - [player];
}] call Framework_Compile;

['Framework_Vehicle_Interaction_AddUser', {
	private ['_selection', '_user', '_currentUsers'];

	_selection = lbCurSel 17662;
	_user = call compile (lbData [17662, _selection]);
	_currentUsers = Current_vehicle getVariable 'Users';

	if (_selection isEqualTo -1) exitWith {
		["You must select a person first.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((getPlayerUID _user) in _currentUsers) exitWith {
		["This person is already a user.", Framework_Color_Red] call Framework_Message_Notification;
	};

	Current_vehicle setVariable ['Users', _currentUsers + [getPlayerUID _user], true];
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Trunk_Open', {
	createDialog 'Dialog_Trunk';

	[] call Framework_Vehicle_Interaction_Trunk_Populate;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Trunk_Populate', {
	private ['_vehicleType', '_maxSpace', '_currentSpace', '_trunkArr'];

	_vehicleType = typeOf Current_Vehicle;
	_maxSpace = Current_Vehicle getVariable 'MaxSpace';
	_currentSpace = Current_Vehicle getVariable 'Space';
	_trunkArr = Current_vehicle getVariable 'Trunk';

	buttonSetAction [2706, "call Framework_Vehicle_Interaction_Trunk_Add"];
	buttonSetAction [2707, "call Framework_Vehicle_Interaction_Trunk_Remove"];

	ctrlSetText [2106, format['Weight: %1/%2', _currentSpace, _maxSpace]];
	ctrlSetText [2506, '1'];

	lbClear 2606;
	lbClear 2607;

	{
		_index = lbAdd [2606, format["%1 (x%2 UNITS)", [(_x select 0), 'name'] call Framework_Config_GetItem, (_x select 1)]];
		lbSetData [2606, _index, format["['%1', %2]", _x select 0, _x select 1]];
	} forEach Player_Inventory;

	{
		_index = lbAdd [2607, format["%1 (x%2 UNITS)", [(_x select 0), 'name'] call Framework_Config_GetItem, (_x select 1)]];
		lbSetData [2607, _index, format["['%1', %2]", _x select 0, _x select 1]];
	} forEach _trunkArr;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Trunk_Add', {
	private ['_data', '_class', '_amount', '_itemWeight', '_currentSpace', '_totalWeight', '_totalSpace'];

	if ((lbCurSel 2606) isEqualTo -1) exitWith {
		["You must select an item to add to the trunk.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_data = call compile(lbData [2606, lbCurSel 2606]);
	_class = [_data, 0] call BIS_fnc_param;
	_amount = round(parseNumber(ctrlText 2506));
	_itemWeight = [_class, 'weight'] call Framework_Config_GetItem;
	_currentSpace = Current_Vehicle getVariable 'Space';
	_totalWeight = _itemWeight * _amount;
	_totalSpace = Current_Vehicle getVariable 'MaxSpace';

	if (_amount <= 0) exitWith {
		["You must enter a valid number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (([_class, _amount] call Framework_Player_HasItem) isEqualTo false) exitWith {
		["You do not have that many items.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((_totalWeight + _currentSpace) > _totalSpace) exitWith {
		["You cannot fit the item(s) into the trunk.", Framework_Color_Red] call Framework_Message_Notification;
	};

	[_class, _amount] call Framework_Player_InventoryRemove;
	
	[(Current_vehicle getVariable 'Trunk'), _class, _amount] call BIS_fnc_addToPairs;

	Current_vehicle setVariable ['Space', (_currentSpace + _totalWeight), true];

	[] call Framework_Vehicle_Trunk_Verify;

	[] call Framework_Vehicle_Interaction_Trunk_Populate;
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Trunk_Remove', {
	private ['_data', '_class', '_amount', '_itemWeight', '_currentSpace', '_totalWeight'];

	if ((lbCurSel 2607) isEqualTo -1) exitWith {
		["You must select an item to add to the trunk.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_data = call compile(lbData [2607, lbCurSel 2607]);
	_class = [_data, 0] call BIS_fnc_param;
	_amount = round(parseNumber(ctrlText 2506));
	_itemWeight = [_class, 'weight'] call Framework_Config_GetItem;
	_currentSpace = Current_Vehicle getVariable 'Space';
	_totalWeight = _itemWeight * _amount;

	if (_amount <= 0) exitWith {
		["You must enter a valid number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (([_class] call Framework_Vehicle_Trunk_Get) < _amount) exitWith {
		["You do not have that many items.", Framework_Color_Red] call Framework_Message_Notification;
	};
	
	[_class, _amount] call Framework_Player_InventoryAdd;

	[(Current_vehicle getVariable 'Trunk'), _class, -(_amount)] call BIS_fnc_addToPairs;

	Current_vehicle setVariable ['Space', (_currentSpace - _totalWeight), true];

	[] call Framework_Vehicle_Trunk_Verify;

	[] call Framework_Vehicle_Interaction_Trunk_Populate;
}] call Framework_Compile;

["Framework_Vehicle_Trunk_Get", {
	private ["_class", "_amount"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [(Current_vehicle getVariable 'Trunk'), _class, 0] call BIS_fnc_getFromPairs;

	_amount;
}] call Framework_Compile;

['Framework_Vehicle_Trunk_Verify', {
	private ['_array', '_index', '_foreachindex'];

	_array = (Current_vehicle getVariable 'Trunk');

	{
		if((_x select 1) < 1) then {
			_index = _forEachIndex;
			_array set [_index, "REMOVE"];
		};
	} forEach _array;

	Current_vehicle setVariable ['Trunk', (_array - ['REMOVE']), true];
}] call Framework_Compile;

['Framework_Vehicle_Interaction_Search', {
	lbClear 17662;
	ctrlEnable [17761, false];

	{
		_index = lbAdd [17662, format["%1 (x%2 UNITS)", [(_x select 0), 'name'] call Framework_Config_GetItem, (_x select 1)]];
		lbSetData [17662, _index, format["['%1', %2]", _x select 0, _x select 1]];
	} forEach (Current_vehicle getVariable 'Trunk');
}] call Framework_Compile;