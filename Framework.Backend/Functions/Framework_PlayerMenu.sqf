['Framework_PlayerMenu_Open', {
	createDialog "Dialog_PlayerMenu";
	[] call Framework_PlayerMenu_Populate;
}] call Framework_Compile;

['Framework_PlayerMenu_Populate', {
	private ['_index'];

	buttonSetAction [6341, "call Framework_PlayerMenu_Use"];
	buttonSetAction [6342, "call Framework_PlayerMenu_Drop"];
	buttonSetAction [6343, "call Framework_PlayerMenu_Give"];

	ctrlSetText [5742, format['WEIGHT: %1/%2', 0, 0]];
	ctrlSetText [6141, '1'];
	ctrlSetText [6142, '1'];

	{
		_index = lbAdd [6242, format["%1", _x select 0]];
		lbSetData [6242, _index, _x select 1];
	} forEach Config_PlayerMenuActions;

	{
		_index = lbAdd [6243, format["%1 (%2)", name _x, _x]];
		lbSetData [6243, _index, str _x];
	} forEach playableUnits;

	[] call Framework_PlayerMenu_Inventory;
}] call Framework_Compile;

['Framework_PlayerMenu_Inventory', {
	lbClear 6241;

	ctrlEnable [6343, true];
	ctrlEnable [6142, true];
	ctrlEnable [6243, true];
	ctrlEnable [6341, true];
	ctrlEnable [6342, true];
	ctrlEnable [6141, true];
	
	{
		_index = lbAdd [6241, format["%1 (x%2 UNITS)", [_x select 0, 'name'] call Framework_Config_GetItem, _x select 1]];
		lbSetData [6241, _index, _x select 0];
	} forEach Player_Inventory;
}] call Framework_Compile;

['Framework_PlayerMenu_Skills', {
	lbClear 6241;

	ctrlEnable [6343, false];
	ctrlEnable [6142, false];
	ctrlEnable [6243, false];
	ctrlEnable [6341, false];
	ctrlEnable [6342, false];
	ctrlEnable [6141, false];

	lbAdd [6241, "--- SKILLS ---"];
	{
		lbAdd [6241, format["%1: %2", _x select 0, _x select 1]];
	} forEach Player_Skills;
}] call Framework_Compile;

['Framework_PlayerMenu_Stats', {
	lbClear 6241;

	ctrlEnable [6343, false];
	ctrlEnable [6142, false];
	ctrlEnable [6243, false];
	ctrlEnable [6341, false];
	ctrlEnable [6342, false];
	ctrlEnable [6141, false];

	lbAdd [6241, "--- STATS ---"];
	lbAdd [6241, format["Name: %1", (name player)]];
	lbAdd [6241, format["Unit: %1", player]];
	lbAdd [6241, format["Hunger: %1", Player_Hunger]];
	lbAdd [6241, format["Thirst: %1", Player_Thirst]];
	lbAdd [6241, format["Health: %1", (call Framework_Player_ReturnHealth)]];
	lbAdd [6241, format["Steam ID: %1", (getPlayerUID player)]];
}] call Framework_Compile;

['Framework_PlayerMenu_MenuSelect', {
	private ['_selection', '_data'];

	_selection = lbCurSel 6242;
	_data = lbData [6242, _selection];

	call compile (_data);
}] call Framework_Compile;

['Framework_PlayerMenu_Use', {
	private ['_selection', '_classname', '_amount', '_canUse', '_function'];
	
	_selection = lbCurSel 6241;
	_classname = lbData [6241, _selection];
	
	if (_selection == -1) exitWith {};

	_amount = round(parseNumber(ctrlText 6141));

	if (_amount <= 0) exitWith {
		["Invalid amount.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_canUse = [_classname, 'canDrop'] call Framework_Config_GetItem;

	if (_canUse isEqualTo false) exitWith {
		["This item cannot be used.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_function = [_classname, 'function'] call Framework_Config_GetItem;

	if (_function == '') exitWith {
		["This item cannot be used.", Framework_Color_Red] call Framework_Message_Notification;
	};

	call compile format["['%1', %2] call %3;", _classname, _amount, _function];
}] call Framework_Compile;

['Framework_PlayerMenu_Give', {
	private ['_selection', '_classname', '_giveTo', '_amount', '_canGive', '_inInventory'];
	
	_selection = lbCurSel 6241;
	_classname = lbData [6241, _selection];
	
	if (_selection == -1) exitWith {
		["No item selected.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_selection = lbCurSel 6243;
	_giveTo = call compile (lbData [6243, _selection]);
	
	if (_selection == -1) exitWith {
		["No player selected.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_giveTo == player) exitWith {
		["You cannot give items to yourself.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_amount = round(parseNumber(ctrlText 6142));

	if (_amount <= 0) exitWith {
		["Invalid amount.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_inInventory = [_classname, _amount] call Framework_Player_HasItem;

	if (_inInventory isEqualTo false) exitWith {
		[format["You do not have %1 units of %2 to give.", _amount, _classname], Framework_Color_Red] call Framework_Message_Notification;
	};

	_canGive = [_classname, 'canGive'] call Framework_Config_GetItem;

	if (_canGive isEqualTo false) exitWith {
		["This item cannot be given to another player.", Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	[_classname, _amount] call Framework_Player_InventoryRemove;

	[format["You gave %1 units of %2 to %3.", _amount, _classname, name _giveTo], Framework_Color_Green] call Framework_Message_Notification;

	[[player, _amount, _classname], "Framework_PlayerMenu_Get", _giveTo] spawn BIS_fnc_MP;
}] call Framework_Compile;

['Framework_PlayerMenu_Get', {
	private ['_from', '_amount', '_classname'];

	_from = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;
	_classname = [_this, 2, '', ['']] call BIS_fnc_param;

	[_classname, _amount] call Framework_Player_InventoryAdd;

	[format["%1 gave you %2 units of %3.", name _from, _amount, _classname], Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;

["Framework_PlayerMenu_Drop", {
	private ['_selection', '_classname', '_amount', '_inInventory', '_canDrop'];
	
	_selection = lbCurSel 6241;
	_classname = lbData [6241, _selection];
	
	if (_selection == -1) exitWith {
		["No item selected.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_amount = round(parseNumber(ctrlText 6141));

	if (_amount <= 0) exitWith {
		["Invalid amount.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_inInventory = [_classname, _amount] call Framework_Player_HasItem;

	if (_inInventory isEqualTo false) exitWith {
		[format["You do not have %1 units of %2 to drop.", _amount, _classname], Framework_Color_Red] call Framework_Message_Notification;
	};

	_canDrop = [_classname, 'canDrop'] call Framework_Config_GetItem;

	if (_canDrop isEqualTo false) exitWith {
		["This item cannot be dropped.", Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	[_classname, _amount] call Framework_Player_InventoryRemove;

	[format["You dropped %1 units of %2.", _amount, _classname], Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;