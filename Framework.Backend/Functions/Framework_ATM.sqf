['Framework_ATM_Open', {
	createDialog "Dialog_ATM";
	[] call Framework_ATM_Populate;
}] call Framework_Compile;

['Framework_ATM_Populate', {
	private ['_index'];

	buttonSetAction [1838, "call Framework_ATM_Withdraw"];
	buttonSetAction [1840, "call Framework_ATM_Deposit"];
	buttonSetAction [1839, "call Framework_ATM_Transfer"];

	ctrlSetText [1242, format['$%1', Player_Bank]];
	ctrlSetText [1243, format['$%1', ['Money'] call Framework_Player_InventoryGet]];
	ctrlSetText [1638, '0'];

	{
		_index = lbAdd [2338, format["%1 (%2)", name _x, _x]];
		lbSetData [2338, _index, str _x];
	} forEach playableUnits - [player];
}] call Framework_Compile;

['Framework_ATM_Withdraw', {
	private ['_amount'];

	_amount = round(parseNumber(ctrlText 1638));

	if (_amount <= 0) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_amount > Player_Bank) exitWith {
		[format["You do not have $%1 in your bank account.", _amount], Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	Player_Bank = Player_Bank - _amount;
	[_amount] call Framework_Player_MoneyAdd;

	[format["You have withdrawn $%1 from your bank account.", _amount], Framework_Color_Green] call Framework_Message_Notification;	
}] call Framework_Compile;

['Framework_ATM_Deposit', {
	private ['_amount'];

	_amount = round(parseNumber(ctrlText 1638));

	if (_amount <= 0) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if ((['money', _amount] call Framework_Player_HasItem) isEqualTo false) exitWith {
		[format["You do not have $%1 in your inventory.", _amount], Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	Player_Bank = Player_Bank + _amount;
	[_amount] call Framework_Player_MoneyRemove;

	[format["You have deposited $%1 into your bank account.", _amount], Framework_Color_Green] call Framework_Message_Notification;	
}] call Framework_Compile;

['Framework_ATM_Transfer', {
	private ['_amount', '_sendTo'];

	_amount = round(parseNumber(ctrlText 1638));
	_sendTo = lbData [2338, (lbCurSel 2338)];

	if ((call compile _sendTo) isEqualTo player) exitWith {
		["You cannot transfer money to yourself.", Framework_Color_Red] call Framework_Message_Notification;
	};
	
	if (lbCurSel 2338 isEqualTo -1) exitWith {
		["Invalid Selection.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_amount <= 0) exitWith {
		["Invalid Number.", Framework_Color_Red] call Framework_Message_Notification;
	};

	if (_amount > Player_Bank) exitWIth {
		[format["You do not have $%1 in your bank account.", _amount], Framework_Color_Red] call Framework_Message_Notification;
	};

	closeDialog 0;

	Player_Bank = Player_Bank - _amount;

	[format["You have transferred $%1 to %2's bank account.", _amount, (name (call compile _sendTo))], Framework_Color_Green] call Framework_Message_Notification;

	[[player, _amount], "Framework_ATM_RecieveTransfer", _sendTo] spawn BIS_fnc_MP;
}] call Framework_Compile;

['Framework_ATM_RecieveTransfer', {
	private ['_sentFrom', '_amount'];

	_sentFrom = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;
	
	Player_Bank = Player_Bank + _amount;

	[format['%1 has transferred $%2 to your bank account.', name _sentFrom, _amount], Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;