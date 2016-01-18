['Framework_Player_SetVariables', {
	Player_ID = getPlayerUID player;
	Player_Groups = [];
	Player_Bank = 500;
	Player_Hunger = 0;
	Player_Thirst = 0;
	Player_PaycheckTimer = 0;
	Player_StatsLoaded = false;
	Player_Notifications = [];
	Player_Inventory = [];
	Player_Skills = [["Mining", 0], ["Manufacturing", 0], ["Fishing", 0]];
	Player_OwnsBusiness = false;
	Player_Detained = false;
	Player_PaycheckTimer = 0;
	CurrentlyFishing = false;
	Player_HasDeliveryJob = false;
	Delivery_Location = [0,0,0];
	Player_RobbingBank = false;
	Player_CleaningMoney = false;
	Player_Side = "";
	Player_UI_Loaded = false;
	Player_WebData = nil;
	Framework_Color_Red = "#FF0000";
	Framework_Color_Blue = "#0000FF";
	Framework_Color_Green = "#00CC00";
	Framework_Color_Yellow = "#FFCC00";
	player setVariable ['Player_Restrained', false, true];
}] call Framework_Compile;

['Framework_Player_SetSide', {
	private ['_side'];

	_side = str(side player);

	switch (_side) do {
	    case "WEST": {
	    	Player_Side = "Police";
	    };

	    case "GUER": {
	    	Player_Side = "EMS";
	    };

	    case "CIV": {
	    	Player_Side = "Civilian";
	    };
	};

}] call Framework_Compile;

['Framework_Player_SetupLoops', {
	["itemAdd", ["Framework_loop_Hunger", { [] spawn Framework_Player_AddHunger; }, 300, 'seconds']] call BIS_fnc_loop;
	["itemAdd", ["Framework_loop_Thirst", { [] spawn Framework_Player_AddThirst; }, 300, 'seconds']] call BIS_fnc_loop;
	["itemAdd", ["Framework_loop_Paycheck", { [] spawn Framework_Player_Paycheck; }, 600, 'seconds']] call BIS_fnc_loop;
	["itemAdd", ["Framework_loop_RestrainCheck", { [] spawn Framework_Player_RestrainCheck; }, nil, nil, { (player getVariable 'Player_Restrained') isEqualTo true; }]] call BIS_fnc_loop;
	//["itemAdd", ["Framework_loop_UI", { [] call Framework_Player_UIUpdate; }, 2, 'seconds', { Player_UI_Loaded isEqualTo true }]] call BIS_fnc_loop;
}] call Framework_Compile;

['Framework_Player_Initialize', {
	//Move player to safe zone while loading
	[true] call Framework_Player_SetupPlayer;

	//Set initial variables before loading stats
	[] call Framework_Player_SetVariables;
	//Set player side
	[] call Framework_Player_SetSide;
	
	//Sets up the scroll menu actions
	[] call Framework_Player_CreateActions;

	//Move player back to spawn location after loading
	[false] call Framework_Player_SetupPlayer;

	//Setup Loops
	[] call Framework_Player_SetupLoops;
	
	//Disabled UI - Causes lag - REWRITE
	//[] call Framework_Player_SetupUI;

	//DEBUG - Teleport to click location on map
	onMapSingleClick "player setpos _pos;";
}] call Framework_Compile;

['Framework_Player_SetupPlayer', {
	private ['_setup'];

	_setup = [_this, 0, true, [true]] call BIS_fnc_param;

	if (_setup isEqualTo true) then {
		player enableSimulation false;
		player allowDamage false;
		player setDamage 0;
		player setPosASL [2081.48,22460.2,5.02351];
		player setDir 120.47;
		removeBackpack player;
	} else {
		player enableSimulation true;
		//player allowDamage true;
		player setPosASL [12859.6,14174.2,1.97694];
		player setDir 331.783;
	};
}] call Framework_Compile;

['Framework_Player_GetStats', {
	private ['_data'];

	_data = (call compile (_this select 0));
	_data = [_data] call Framework_Database_FormatArray;
	_data = ((call compile (_data)) select 0);

	[_data] call Framework_Player_SetStats;
}] call Framework_Compile;

['Framework_Player_SetStats', {
	private ['_data'];

	_data = _this select 0;



	Player_StatsLoaded = true;
}] call Framework_Compile;

['Framework_Player_CreateActions', {
	removeAllActions player;

	{
		_name = [_x, 0, '', ['']] call BIS_fnc_param;
		_code = [_x, 1, {}, [{}]] call BIS_fnc_param;
		_args = [_x, 2, '', ['']] call BIS_fnc_param;
		_color = [_x, 3, '', ['']] call BIS_fnc_param;

		player addAction [(format["<t color='%1'>", _color] + _name), _code, [], 1, true, true, "", _args];
	} forEach Config_Actions;
}] call Framework_Compile;

["Framework_Player_InventoryAdd", {
	private ["_class", "_amount"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;

	[Player_Inventory, _class, _amount] call BIS_fnc_addToPairs;

	[] call Framework_Player_InventoryVerify;
}] call Framework_Compile;

["Framework_Player_InventoryRemove", {
	[[_this, 0, '', ['']] call BIS_fnc_param, -([_this, 1, 0, [0]] call BIS_fnc_param)] call Framework_Player_InventoryAdd;
}] call Framework_Compile;

["Framework_Player_MoneyAdd", {
	['money', ([_this, 0, 0, [0]] call BIS_fnc_param)] call Framework_Player_InventoryAdd;
}] call Framework_Compile;

["Framework_Player_MoneyRemove", {
	['money', -([_this, 0, 0, [0]] call BIS_fnc_param)] call Framework_Player_InventoryAdd;
}] call Framework_Compile;

["Framework_Player_InventoryVerify", {
	private ['_index', '_forEachIndex'];
	
	{
		if((_x select 1) < 1) then {
			_index = _forEachIndex;
			Player_Inventory set [_index, "REMOVE"];
		};
	} forEach Player_Inventory;
	
	Player_Inventory = Player_Inventory - ["REMOVE"];
}] call Framework_Compile;

["Framework_Player_InventoryGet", {
	private ["_class", "_amount"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [Player_Inventory, _class, 0] call BIS_fnc_getFromPairs;

	_amount;
}] call Framework_Compile;

["Framework_Player_HasItem", {
	private ["_class", "_amount"];

	_class = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;
	_inventoryAmount = [_class] call Framework_Player_InventoryGet;

	if (_inventoryAmount < _amount) exitWith {false;};

	true;
}] call Framework_Compile;

["Framework_Player_SkillAdd", {
	private ["_skill", "_amount"];

	_skill = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;

	[Player_Skills, _skill, _amount] call BIS_fnc_addToPairs;

	[] call Framework_Player_SkillVerify;
}] call Framework_Compile;

["Framework_Player_SkillRemove", {
	[[_this, 0, '', ['']] call BIS_fnc_param, -([_this, 1, 0, [0]] call BIS_fnc_param)] call Framework_Player_InventoryAdd;
}] call Framework_Compile;

["Framework_Player_SkillVerify", {
	private ['_index', '_forEachIndex'];
	
	{
		if((_x select 1) < 1) then {
			_index = _forEachIndex;
			Player_Skills set [_index, "REMOVE"];
		};
	} forEach Player_Skills;
	
	Player_Skills = Player_Skills - ["REMOVE"];
}] call Framework_Compile;

["Framework_Player_SkillGet", {
	private ["_skill", "_amount"];

	_skill = [_this, 0, '', ['']] call BIS_fnc_param;
	_amount = [Player_Skills, _skill, 0] call BIS_fnc_getFromPairs;

	_amount;
}] call Framework_Compile;

["Framework_Player_AddHunger", {
    Player_Hunger = Player_Hunger + 10;

    if (Player_Hunger >= 100) exitWith {
            player setDamage 1;
            ["You have died from hunger.", Framework_Color_Red] call Framework_Message_Notification;
    };
}] call Framework_Compile;
 
["Framework_Player_AddThirst", {
    Player_Thirst = Player_Thirst + 10;
 
    if (Player_Thirst >= 100) exitWith {
        player setDamage 1;
        ["You have died from thirst.", Framework_Color_Red] call Framework_Message_Notification;
    };
}] call Framework_Compile;
 
["Framework_Player_Paycheck", {
    private ['_amount'];
 
    if (Player_PaycheckTimer isEqualTo 0) then {
        ["You will have a paycheck in 10 minutes.", Framework_Color_Yellow] call Framework_Message_Notification;
    };
 
    if (Player_PaycheckTimer isEqualTo 1) then {
    	switch (playerSide) do {

    		case civilian: {
    			_amount = 40;

    			Player_Bank = Player_Bank + _amount;
                [format["You have recieved a $%1 paycheck.", _amount], Framework_Color_Green] call Framework_Message_Notification;
    		};

    		case west: {
    			_amount = 300;

    			Player_Bank = Player_Bank + _amount;
                [format["You have recieved a $%1 paycheck.", _amount], Framework_Color_Green] call Framework_Message_Notification;
    		};
    		
    		case independent: {
    			_amount = 250;

    			Player_Bank = Player_Bank + _amount;
                [format["You have recieved a $%1 paycheck.", _amount], Framework_Color_Green] call Framework_Message_Notification;
    		};
    	};

        Player_PaycheckTimer = 0;
    };
 
    Player_PaycheckTimer = Player_PaycheckTimer + 1;
}] call Framework_Compile;

["Framework_Player_RestrainCheck", {
	private ['_isRestrained'];

	_isRestrained = (player getVariable 'Player_restrained');

	if (_isRestrained isEqualTo false) exitWith {};

	player switchMove "AmovPercMstpSnonWnonDnon_Ease";
}] call Framework_Compile;

["Framework_Player_SetupUI", {
	private ['_display', '_format'];

	if (Player_UI_Loaded isEqualTo true) exitWith {};

	cutRsc ['Dialog_UI', 'PLAIN'];

	disableSerialization;

	_display = ((uiNamespace getVariable "Dialog_UI") displayCtrl 1173);
	_format = "<t size='1.2' align='center'>Loading...</t>";

	_display ctrlSetStructuredText (parseText _format);

	Player_UI_Loaded = true;
}] call Framework_Compile;

["Framework_Player_UIUpdate", {
	private ['_display', '_format'];

	_display = ((uiNamespace getVariable "Dialog_UI") displayCtrl 1173);
	_format = format["<t size='1.2' align='center'>HUNGER: %1 | THIRST: %2 | HEALTH: %3 | WEIGHT: 0/100 | CASH: $%4 | BANK: $%5</t>", Player_Hunger, Player_Thirst, call Framework_Lib_ReturnHealth, ['Money'] call Framework_Player_InventoryGet, Player_Bank];

	_display ctrlSetStructuredText (parseText _format);
}] call Framework_Compile;