['Framework_Jobs_FishingCheckSkill', {
	private ['_item', '_skillNeeded', '_fishingSkill'];

	_item = [_this, 0, '', ['']] call BIS_fnc_param;
	_skillNeeded = [_item, "Skill"] call Framework_Config_GetFishingTools;
	_fishingSkill = ["Fishing"] call Framework_Player_SkillGet;

	if (_fishingSkill >= _skillNeeded) exitWith {
		true;
	};

	false;
}] call Framework_Compile;

['Framework_Jobs_FishingStart', {
	private ['_playerHeight', '_playerSpeed', '_onWater', '_canUse', '_type', '_amount', '_fishArr', '_fishToCatch', '_fishName', '_chance', '_exit', '_amtIncrease'];

	_playerHeight = abs(getTerrainHeightASL(position vehicle player));
	_playerSpeed = speed(vehicle player);
	_onWater = surfaceIsWater(position(vehicle player));
	_canUse = [format['%1', _this select 0]] call Framework_Jobs_FishingCheckSkill;

	if (CurrentlyFishing isEqualTo true) exitWith {
		["You are already fishing.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_canUse isEqualTo false) exitWith {
		["You lack the skill requred to use this item.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_onWater isEqualTo false) exitWith {
		["You must be in the water to fish.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((_playerSpeed > 3) || (_playerSpeed < -3)) exitWith {
		["You are moving to fast to be able to fish.", Framework_Color_Red] call Framework_Message_Notification;
	};

	CurrentlyFishing = true;

	closeDialog 0;

	[] spawn {
		_exit = false;

		while {_exit isEqualTo false} do {
			waitUntil {((surfaceIsWater(position(vehicle player))) isEqualTo false) || (speed(vehicle player) > 10) || (CurrentlyFishing isEqualTo false)};

			if (CurrentlyFishing isEqualTo true) then {
				["Fishing canceled.", Framework_Color_Red] call Framework_Message_Notification;
				["",0,1.2,6,0] spawn bis_fnc_dynamictext;
			};

			_exit = true;
			CurrentlyFishing = false;
		};
	};

	[] spawn {
		_playerHeight = abs(getTerrainHeightASL(position vehicle player));
		_type = [_playerHeight] call Framework_Jobs_FishingGetType;
		_amount = 1;
		_fishArr = [_type, 'Fish'] call Framework_Config_GetFish;
		_fishToCatch = _fishArr call BIS_fnc_selectRandom;
		_fishName = [_fishToCatch, 'name'] call Framework_Config_GetItem;
		_chance = random(round(5));
		_amtIncrease = random(0.8);
	
		if (_type == 'fishingnet') then {
			_amount = round(random(10));
		};

		["<t size='1.0' color='#0237E6'>Fishing...</t>",0,1.2,6,0] spawn bis_fnc_dynamictext;
		
		sleep round(random(10));

		if (_chance < 2) exitWith {
			["",0,1.2,6,0] spawn bis_fnc_dynamictext;
			CurrentlyFishing = false;
			['The fish escaped.', Framework_Color_Red] call Framework_Message_Notification;
		};

		if (CurrentlyFishing isEqualTo false) exitWith {};

		["",0,1.2,6,0] spawn bis_fnc_dynamictext;

		[format['%1', _fishToCatch], _amount] call Framework_Player_InventoryAdd;

		[format["You caught x%1 Units of %2.", _amount, _fishName], Framework_Color_Green] call Framework_Message_Notification;

		['Fishing', _amtIncrease] call Framework_Player_SkillAdd;

		CurrentlyFishing = false;
	};
}] call Framework_Compile;

['Framework_Jobs_FishingGetType', {
	private ['_height', '_return'];

	_height = [_this, 0, 0, [0]] call BIS_fnc_param;
	_return = false;

	if ((_height >= 101) && (_height <= 400)) exitWith {
		_return = "fishingnet";
		_return;
	};

	if ((_height >= 401) && (_height <= 1000)) exitWith {
		_return = "fishingharpoon";
		_return;
	};

	_return = "fishingrod";
	_return;
}] call Framework_Compile;

['Framework_Jobs_Delivery_Start', {
	if ((alive player) isEqualTo false) exitWith {};
	if (Player_HasDeliveryJob isEqualTo true) exitWith {};

	Delivery_Location = Config_DeliveryLocations call BIS_fnc_selectRandom;
	Delivery_Distance = round(player distance Delivery_Location);

	[] call Framework_Jobs_Delivery_CreateMarker;

	[format['You have received a delivery mission at %1', (mapGridPosition Delivery_Location)], Framework_Color_Green] call Framework_Message_Notification;

	Player_HasDeliveryJob = true;
}] call Framework_Compile;

['Framework_Jobs_Delivery_CreateMarker', {
	private ['_delMarker', '_marker'];

	_delMarker = createMarkerLocal [format['deliverymarker_%1', round(random(65))], Delivery_Location];
	_delMarker setMarkerText 'Delivery Point';
    _delMarker setMarkerTypeLocal "mil_dot";
    _delMarker setMarkerColorLocal "ColorBlue";
    _delMarker setMarkerSizeLocal [0.50, 0.50];

    [_delMarker] spawn {
    	_marker = [_this, 0] call BIS_fnc_param;

    	waitUntil {(Player_HasDeliveryJob isEqualTo false)};

    	deleteMarkerLocal _marker;
	};

	[_delMarker] spawn {
		_marker = [_this, 0] call BIS_fnc_param;
	};

}] call Framework_Compile;

['Framework_Jobs_Delivery_Finish', {
	private ['_payPerMeter', '_totalPay'];
	
	_payPerMeter = 2;
	_totalPay = (_payPerMeter * Delivery_Distance);

	['money', _totalPay] call Framework_Player_InventoryAdd;

	[(format['You have successfully delivered the package and earned $%1', _totalPay]), Framework_Color_Green] call Framework_Message_Notification;

	Player_HasDeliveryJob = false;
}] call Framework_Compile;

['Framework_Jobs_Delivery_Cancel', {
	['You have canceled your delivery job.', Framework_Color_Red] call Framework_Message_Notification;
	Player_HasDeliveryJob = false;
}] call Framework_Compile;