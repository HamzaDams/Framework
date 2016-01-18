//SETUP INTERACTION MENU

["Framework_Interactions_Open", {
	_interactWith = _this select 0;

	InteractWith = _interactWith;

	createDialog "Dialog_InteractionMenu";
	[] call Framework_Interactions_Populate;
}] call Framework_Compile;

["Framework_Interactions_Populate", {
	private ['_actionName', '_action', '_args', '_index'];

	lbClear 13158;

	{
		_actionName = _x select 0;
		_action = _x select 1;
		_args = _x select 2;

		if ((call compile _args) isEqualTo true) then {
			_index = lbAdd [13158, format["%1", _actionName]];
			lbSetData [13158, _index, _action];
		};
	} forEach Config_InteractionActions;

	lbSetCurSel [13158, 0];

	[] call Framework_Interactions_Information;
}] call Framework_Compile;

['Framework_Interactions_OnSelect', {
	private ['_selection', '_data'];

	_selection = lbCurSel 13158;
	_data = lbData [13158, _selection];

	call compile (_data);
}] call Framework_Compile;

// SETUP INTERACTION MENU END

/////////////////////////////

//// Information Start

['Framework_Interactions_Information', {
	lbClear 12558;

	{
		lbAdd [12558, format["%1 %2", _x select 0, call compile (_x select 1)]];
	} forEach Config_PlayerInformation;
}] call Framework_Compile;

// Information End

//// handcuff start

['Framework_Interactions_Handcuff', {	
	private ['_hasHandcuffs', '_isHandcuffed'];

	_hasHandcuffs = ['handcuffs', 1] call Framework_Player_HasItem;
	_isHandcuffed = InteractWith getVariable 'Player_Restrained';


	if (_hasHandcuffs isEqualTo false) exitWith {
		["you do not have enough handcuffs in your inventory", Framework_Color_Green] call Framework_Message_Notification;
	};

	switch (_isHandcuffed) do {
	    case true: {
	    	['handcuffs', 1] call Framework_Player_InventoryAdd;
	    };

	    case false: {
	    	['handcuffs', 1] call Framework_Player_InventoryRemove;
		};
	};

	[[player], "Framework_Interactions_Handcuff_Receive", InteractWith] call BIS_fnc_MP;
}] call Framework_Compile;

['Framework_Interactions_Handcuff_Receive', {
	private ['_cop', '_isRestrained'];

	_cop = _this select 0;
	_isRestrained = player getVariable 'Player_Restrained';

	switch (_isRestrained) do {
	    case true: {
	    	player setVariable ['Player_Restrained', false, true];
	    	[format["You have been released by %1", (name _cop)], Framework_Color_Green] call Framework_Message_Notification;
	    };

	    case false: {
	    	player setVariable ['Player_Restrained', true, true];
	    	[format["You have been detained by %1", (name _cop)], Framework_Color_Green] call Framework_Message_Notification;
		};
	};
}] call Framework_Compile;

//// handcuff end

// Ticket Start

["Framework_Interactions_Ticket_Open", {
	createDialog 'Dialog_TicketMenu';

	[] call Framework_Interactions_Ticket_Populate;
}] call Framework_Compile;

["Framework_Interactions_Ticket_Populate", {
	private ['_index'];

	buttonSetAction [6311, 'call Framework_Interactions_Ticket_Issue'];

	{
		_index = lbAdd [6810, format["%1", _x]];
		lbSetData [6810, _index, format["%1", _x]];
	} forEach Config_TicketReasons;
}] call Framework_Compile;

["Framework_Interactions_Ticket_Issue", {
	private ['_amount', '_reason'];

	_amount = round(parseNumber(ctrlText 6110));
	_reason = ctrlText 6111;

	if (_reason isEqualTo '') exitWith {
		["You didn't enter a reason."] call Framework_Message_Notification;
	};

	[format['%1 has issued a ticket of $%2 to %3 for %4', name player, _amount, name InteractWith, _reason]] call Framework_Message_System;

	closeDialog 0;
	
	[[player, _amount, _reason], "Framework_Interactions_Ticket_Receive", InteractWith] spawn BIS_fnc_MP;
}] call Framework_Compile;

["Framework_Interactions_Ticket_Receive", {
	private ['_from', '_amount', '_reason'];

	_from = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_amount = [_this, 1, 0, [0]] call BIS_fnc_param;
	_reason = [_this, 2, '', ['']] call BIS_fnc_param;
	TicketAccepted = false;
	TicketDeclined = false;
	TicketPicked = false;

	createDialog 'Dialog_QuestionMenu';

	buttonSetAction [8601, 'TicketPicked = true; TicketAccepted = true;'];
	buttonSetAction [8602, 'TicketPicked = true; TicketDeclined = true;'];

	_text = format["<t size='1.2'>Issued By: %1<br />Amount: $%2<br />Reason: %3</t>", name _from, _amount, _reason];

	((uiNameSpace getVariable "Dialog_QuestionMenu") displayCtrl 8101) ctrlSetStructuredText (parseText _text);

	[] spawn {
		sleep 10;
		closeDialog 0;

		if (TicketPicked isEqualTo true) exitWith {};

		TicketDeclined = true;
		TicketPicked = true;
	};

	[_amount] spawn {
		_amount = [_this, 0] call BIS_fnc_param;

		waitUntil {TicketPicked isEqualTo true};

		if (TicketAccepted isEqualTo true) exitWith {
			if ((Player_Bank - _amount) < 0) exitWith {
				closeDialog 0;
				[format['%1 could not pay their ticket.', name player]] call Framework_Message_System;
			};

			closeDialog 0;
			Player_Bank = Player_Bank - _amount;
			[format['%1 has paid their ticket.', name player]] call Framework_Message_System;
		};

		closeDialog 0;
		[format['%1 has declined their ticket.', name player]] call Framework_Message_System;
	};
}] call Framework_Compile;

//// Ticket End