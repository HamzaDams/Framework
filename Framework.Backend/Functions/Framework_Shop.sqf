['Framework_Shop_InfoOpen', {
	private ['_currentShop'];

	_currentShop = [_this, 0, '', ['']] call BIS_fnc_param;

	if (_currentShop isEqualTo '') exitWith {};

	Current_Shop = _currentShop;
	Current_ShopType = [Current_Shop, 'type'] call Framework_Config_GetShopInfo;

	createDialog "Dialog_ShopInfo";

	[] call Framework_Shop_InfoPopulate;
}] call Framework_Compile;

['Framework_Shop_InfoPopulate', {
	private ['_shopName', '_shopOwner', '_shopPrice', '_shopStock', '_shopOwnerUID', '_shopOwnerName', '_text'];

	_shopName = [Current_Shop, 'name'] call Framework_Config_GetShopInfo;
	_shopPrice = [Current_Shop, 'price'] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;
	_shopOwnerName = _shopOwner select 0;
	_shopOwnerUID = _shopOwner select 1;

	if (_shopOwnerName isEqualTo "") then {_shopOwnerName = 'No Owner';};
	
	_text = format["<t size='1.4' shadow='2'>%1</t><br /><br /><t size='1.2'>SHOP PRICE:</t> $%2<br /><br /><t size='1.2'>OWNER:</t> %3<br /><br /><t size='1.2'>CURRENT STOCK:</t> %4", toUpper(_shopName), _shopPrice, _shopOwnerName, _shopStock];

	ctrlSetText [3893, format['%1',toUpper('Shop Information')]];

	((uiNameSpace getVariable "Dialog_ShopInfo") displayCtrl 3993) ctrlSetStructuredText (parseText _text);

	lbClear 4393;

	if (getPlayerUID player isEqualTo _shopOwnerUID) then {
		{
			_index = lbAdd [4393, format["%1", _x select 0]];
			lbSetData [4393, _index, _x select 1];
		} forEach Config_ShopInfoMenuOwnerActions;
	} else {
		{
			_index = lbAdd [4393, format["%1", _x select 0]];
			lbSetData [4393, _index, _x select 1];
		} forEach Config_ShopInfoMenuNonOwnerActions;
	};

	{
		_index = lbAdd [4393, format["%1", _x select 0]];
		lbSetData [4393, _index, _x select 1];
	} forEach Config_ShopInfoMenuActions;
}] call Framework_Compile;

['Framework_Shop_InfoMenuSelect', {
	private ['_selection', '_data'];

	_selection = lbCurSel 4393;
	_data = lbData [4393, _selection];

	call compile (_data);
}] call Framework_Compile;

['Framework_Shop_BuyShop', {
	private ['_shopArr', '_shopPrice', '_priceIncrease', '_shopOwner'];

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopPrice = [Current_Shop, 'price'] call Framework_Config_GetShopInfo;
	_priceIncrease = round(_shopPrice * 1.10);
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;

	if ((['money', _shopPrice] call Framework_Player_HasItem) isEqualTo false) exitWith {
		["You do not have enough money to buy this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopOwner set [0, format['%1', name player]];
	_shopOwner set [1, format['%1', getPlayerUID player]];
	_shopArr set [2, _priceIncrease];
	publicVariable "Config_ShopInfo";

	['money', _shopPrice] call Framework_Player_InventoryRemove;

	[] call Framework_Shop_InfoPopulate;

	Player_OwnsBusiness = true;

	[format["You have purchased this shop for $%1.", _shopPrice], Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_SellShop', {
	private ['_shopArr', '_shopPrice', '_shopOwner', '_shopMoney'];

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopPrice = [Current_Shop, 'price'] call Framework_Config_GetShopInfo;
	_shopPrice = _shopPrice * 0.45;
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;
	_shopMoney = floor([Current_Shop, 'money'] call Framework_Config_GetShopInfo);

	_shopOwner set [0, ''];
	_shopOwner set [1, ''];
	_shopArr set [5, 0];
	publicVariable "Config_ShopInfo";

	['money', _shopPrice] call Framework_Player_InventoryAdd;

	[] call Framework_Shop_InfoPopulate;

	Player_OwnsBusiness = false;

	[format["You have sold this shop for $%1.", _shopPrice], Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_ShopEnter', {
	closeDialog 0;
	createDialog "Dialog_Shop";

	[] call Framework_Shop_ShopPopulate;
}] call Framework_Compile;

['Framework_Shop_AddStock', {
	//todo

	closeDialog 0;
}] call Framework_Compile;

['Framework_Shop_RetreiveMoney', {
	private ['_shopArr', '_shopMoney'];

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopMoney = floor([Current_Shop, 'money'] call Framework_Config_GetShopInfo);

	if (_shopMoney <= 0) exitWith {
		["There is no money to be collected.", Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	_shopArr set [5, 0];
	publicVariable "Config_ShopInfo";

	['money', _shopMoney] call Framework_Player_InventoryAdd;
	[format['You have collected $%1 in profits from your shop.', _shopMoney], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_ShopPopulate', {
	private ['_shopName', '_shopType', '_shopItems', '_index', '_amount', '_gear'];

	_shopName = [Current_Shop, 'name'] call Framework_Config_GetShopInfo;
	_shopType = [Current_Shop, 'type'] call Framework_Config_GetShopInfo;
	_shopItems = [Current_Shop, 'items'] call Framework_Config_GetShops;

	buttonSetAction [2262, "call Framework_Shop_BuyItem"];
	buttonSetAction [2263, "call Framework_Shop_SellItem"];

	ctrlSetText [1663, format['%1', toUpper(_shopName)]];
	ctrlSetText [2062, '1'];
	
	lbClear 2162;
	lbClear 2163;

	switch (_shopType) do {
		case "ITEM": { 
			buttonSetAction [2262, "call Framework_Shop_BuyItem"];
			buttonSetAction [2263, "call Framework_Shop_SellItem"];
			ctrlEnable [2062, true];

			{
				_index = lbAdd [2162, format["%1 ($%2)", [_x select 0, 'name'] call Framework_Config_GetItem, _x select 1]];
				lbSetData [2162, _index, format["['%1', %2]",_x select 0, _x select 1]];
			} forEach _shopItems;

			{
				_amount = [_x select 0] call Framework_Player_InventoryGet;

				if (_amount > 0) then {
					_index = lbAdd [2163, format["%1 ($%2 each) [x%3 Units]", [_x select 0, 'name'] call Framework_Config_GetItem, _x select 1, _amount]];
					lbSetData [2163, _index, format["['%1', %2]",_x select 0, _x select 2]];
				};
			} forEach _shopItems;
		};

		case "VEHICLE": { 
			buttonSetAction [2262, "call Framework_Shop_BuyVehicle"];
			buttonSetAction [2263, "call Framework_Shop_SellVehicle"];
			ctrlEnable [2062, false];

			{
				_index = lbAdd [2162, format["%1 ($%2)", [_x select 0, 'name'] call Framework_Config_GetVehicle, _x select 1]];
				lbSetData [2162, _index, format["['%1', %2]",_x select 0, _x select 1]];
			} forEach _shopItems;

			{
				_nearObjs = nearestObjects [player, [_x select 0], 20];
				_class = _x select 0;
				_price = _x select 2;

				[_class, _price, _nearObjs] call Framework_Shop_VehicleCheck;
			} forEach _shopItems;
		};

		case "GEAR": { 
			buttonSetAction [2262, "call Framework_Shop_BuyGear"];
			buttonSetAction [2263, "call Framework_Shop_SellGear"];
			ctrlEnable [2062, false];

			_gear = ((itemsWithMagazines player) + (weapons player) + [uniform player] + [backpack player] + [vest player] + [headgear player] + [goggles player]);

			{
				_index = lbAdd [2162, format["%1 ($%2)", [_x select 0, 'name'] call Framework_Config_GetGear, _x select 1]];
				lbSetData [2162, _index, format["['%1', %2]",_x select 0, _x select 1]];
			} forEach _shopItems;

			{
				if ((_x select 0) in _gear) then {
					_index = lbAdd [2163, format["%1 ($%2)", [_x select 0, 'name'] call Framework_Config_GetGear, _x select 1]];
					lbSetData [2163, _index, format["['%1', %2]",_x select 0, _x select 2]];
				};
			} forEach _shopItems;
		};
	};
}] call Framework_Compile;

['Framework_Shop_VehicleCheck', {
	private ['_data', '_description', '_text'];

	_class = [_this, 0] call BIS_fnc_param;
	_price = [_this, 1] call BIS_fnc_param;
	_nearObjs = [_this, 2] call BIS_fnc_param;
	
	{
		_vehicle = _x;

		if ((_vehicle getVariable 'OwnerID') isEqualTo (getPlayerUID player)) then {
		_index = lbAdd [2163, format["%1 ($%2) - %3", [_class, 'name'] call Framework_Config_GetVehicle, _price, _vehicle]];
		lbSetData [2163, _index, format["[%1, %2]", _vehicle, _price]];
		};
	} forEach _nearObjs;
}] call Framework_Compile;

['Framework_Shop_GetItemDesc', {
	private ['_data', '_description', '_text'];
	
	if ((Current_ShopType isEqualTo 'GEAR') || (Current_ShopType isEqualTo 'VEHICLE')) exitWith {};

	_data = call compile(lbData [2162, lbCurSel 2162]);
	_description = [_data select 0, 'desc'] call Framework_Config_GetItem;
	_text = format["%1", _description];

	if (_text isEqualTo '') then {
		_text = 'NO INFO';
	};

	((uiNameSpace getVariable "Dialog_Shop") displayCtrl 1762) ctrlSetStructuredText (parseText _text);
}] call Framework_Compile;

['Framework_Shop_BuyItem', {
	private ['_shopArr', '_shopStock', '_data', '_itemName', '_amount', '_totalPrice', '_shopMoney', '_ownerPrice'];

	if ((lbCurSel 2162) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_shopMoney = [Current_Shop, 'money'] call Framework_Config_GetShopInfo;
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2162, lbCurSel 2162]);
	_itemName = [_data select 0, 'name'] call Framework_Config_GetItem;
	_amount = round(parseNumber(ctrlText 2062));
	_totalPrice = (_data select 1) * _amount;
	_ownerPrice = _totalPrice * 0.20;

	if (_amount <= 0) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_shopStock <= 0) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_shopStock < _amount) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((['money', _totalPrice] call Framework_Player_HasItem) isEqualTo false) exitWith {
		[format["You do not have $%1 in your inventory.", _totalPrice], Framework_Color_Red] call Framework_Message_Notification;
	};

	if (!((_shopOwner select 0) isEqualTo '')) then {
		_shopArr set [5, _shopMoney + _ownerPrice];
	};

	_shopArr set [4, _shopStock - _amount];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryRemove;
	[format['%1', _data select 0], _amount] call Framework_Player_InventoryAdd;

	closeDialog 0;

	[format["You have purchased x%1 units of %2.", _amount, _itemName], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_SellItem', {
	private ['_shopArr', '_shopStock', '_data', '_itemName', '_amount', '_totalPrice'];

	if ((lbCurSel 2163) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2163, lbCurSel 2163]);
	_itemName = [_data select 0, 'name'] call Framework_Config_GetItem;
	_amount = round(parseNumber(ctrlText 2062));
	_totalPrice = (_data select 1) * _amount;

	if (([_data select 0, _amount] call Framework_Player_HasItem) isEqualTo false) exitWith {
		[format['You do not have x%1 units of that item to sell', _amount], Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr set [4, _shopStock + _amount];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryAdd;
	[format['%1', _data select 0], _amount] call Framework_Player_InventoryRemove;

	closeDialog 0;

	[format["You have sold x%1 units of %2 and received $%3.", _amount, _itemName, _totalPrice], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_BuyGear', {
	private ['_shopArr', '_shopStock', '_shopOwner', '_data', '_itemName', '_itemType', '_weaponType', '_totalPrice', '_hasSpace', '_shopMoney', '_ownerPrice'];

	if ((lbCurSel 2162) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_shopMoney = [Current_Shop, 'money'] call Framework_Config_GetShopInfo;
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2162, lbCurSel 2162]);
	_itemName = [_data select 0, 'name'] call Framework_Config_GetGear;
	_itemType = [_data select 0, 'weaponType'] call Framework_Config_GetGear;
	_weaponType = [_data select 0, 'weaponType'] call Framework_Config_GetGear;
	_totalPrice = _data select 1;
	_ownerPrice = _totalPrice * 0.20;
	_hasSpace = [_data select 0] call Framework_Gear_CheckSpace;

	if (_shopStock <= 0) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_shopStock < 1) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((['money', _totalPrice] call Framework_Player_HasItem) isEqualTo false) exitWith {
		[format["You do not have $%1 in your inventory.", _totalPrice], Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_hasSpace isEqualTo false) exitWith {
		["You do not have enough space for this item.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (!((_shopOwner select 0) isEqualTo '')) then {
		_shopArr set [5, _shopMoney + _ownerPrice];
	};

	_shopArr set [4, _shopStock - 1];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryRemove;
	[format['%1', _data select 0]] call Framework_Gear_Add;

	[] call Framework_Shop_ShopPopulate;

	[format["You have purchased %1.", _itemName], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_SellGear', {
	private ['_shopArr', '_shopStock', '_data', '_itemName', '_totalPrice'];

	if ((lbCurSel 2163) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2163, lbCurSel 2163]);
	_itemName = [_data select 0, 'name'] call Framework_Config_GetGear;
	_totalPrice = _data select 1;

	_shopArr set [4, _shopStock + 1];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryAdd;
	[format['%1', _data select 0]] call Framework_Gear_Remove;

	[] call Framework_Shop_ShopPopulate;

	[format["You have sold a %1 and received $%2.", _itemName, _totalPrice], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_BuyVehicle', {
	private ['_shopArr', '_shopStock', '_data', '_vehicleName', '_totalPrice', '_shopMoney', '_ownerPrice'];

	if ((lbCurSel 2162) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_shopMoney = [Current_Shop, 'money'] call Framework_Config_GetShopInfo;
	_shopOwner = [Current_Shop, 'owner'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2162, lbCurSel 2162]);
	_vehicleName = [_data select 0, 'name'] call Framework_Config_GetVehicle;
	_totalPrice = _data select 1;
	_ownerPrice = _totalPrice * 0.20;

	if (_shopStock <= 0) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_shopStock < 1) exitWith {
		["There is not enough stock in this shop.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((['money', _totalPrice] call Framework_Player_HasItem) isEqualTo false) exitWith {
		[format["You do not have $%1 in your inventory.", _totalPrice], Framework_Color_Red] call Framework_Message_Notification;
	};

	if (!((_shopOwner select 0) isEqualTo '')) then {
		_shopArr set [5, _shopMoney + _ownerPrice];
	};

	_shopArr set [4, _shopStock - 1];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryRemove;
	
	[_data select 0] call Framework_Vehicle_Create;

	closeDialog 0;

	[format["You have purchased a/an %1.", _vehicleName], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;

['Framework_Shop_SellVehicle', {
	private ['_shopArr', '_shopStock', '_data', '_itemName', '_totalPrice'];

	if ((lbCurSel 2163) isEqualTo -1) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	_shopArr = [Current_Shop] call Framework_Config_GetShopInfo;
	_shopStock = [Current_Shop, 'stock'] call Framework_Config_GetShopInfo;
	_data = call compile(lbData [2163, lbCurSel 2163]);
	_itemName = [typeOf(_data select 0), 'name'] call Framework_Config_GetVehicle;
	_totalPrice = _data select 1;

	_shopArr set [4, _shopStock + 1];
	publicVariable "Config_ShopInfo";

	['money', _totalPrice] call Framework_Player_InventoryAdd;

	deleteVehicle (_data select 0);

	closeDialog 0;

	[format["You have sold a %1 and received $%2.", _itemName, _totalPrice], Framework_Color_Blue] call Framework_Message_Notification;
}] call Framework_Compile;