["Framework_Message_Notification", {
	private ["_msg","_title","_format"];

	_msg = _this select 0;
	_color = _this select 1;
	_format = format["<t align='center' color='%1'>%2</t>", _color, _msg];

	hint parseText _format;
}] call Framework_Compile;

['Framework_Message_311Setup', {
	createDialog "Dialog_MessageSystem";

	buttonSetAction [7601, "call Framework_Message_311"];
	buttonSetAction [7602, "closeDialog 0"];
}] call Framework_Compile;

['Framework_Message_311', {
	private ['_str', '_strFormat'];

	_str = ctrlText 7401;
	_strFormat = format ["(311) %1: %2", name player, _str];

	if (_str == "") exitWith {
		["Please enter a message first.", Framework_Color_Red] call Framework_Message_Notification;
	};

	[_strFormat] call Framework_Message_System;

	closeDialog 0;
}] call Framework_Compile;

['Framework_Message_911Setup', {
	createDialog "Dialog_MessageSystem";

	buttonSetAction [7601, "call Framework_Message_911"];
	buttonSetAction [7602, "closeDialog 0"];
}] call Framework_Compile;

['Framework_Message_911', {
	private ['_str', '_strPlayer', '_strTarget', '_strEnterMessage'];

	_str = ctrlText 7401;
	_strPlayer = "911 Message: Your message has been sent.";
	_strTarget = format ["(911) Message [%1]: %2", mapGridPosition player, _str];
	_strEnterMessage = "Enter a message first...";

	if (_str == "") exitWith {
		[_strEnterMessage, Framework_Color_Red] call Framework_Message_Notification;
	};

	[_strPlayer, Framework_Color_Green] call Framework_Message_Notification;
	[player globalChat _strTarget, "BIS_fnc_spawn", west] call BIS_fnc_MP;

	closeDialog 0;
}] call Framework_Compile;

['Framework_Message_141Setup', {
	createDialog "Dialog_MessageSystem";

	buttonSetAction [7601, "call Framework_Message_141"];
	buttonSetAction [7602, "closeDialog 0"];
}] call Framework_Compile;

['Framework_Message_141', {
	private ['_str', '_strTargetClear', '_strTargetFound', '_strEnterMessage', '_Random'];

	_str = ctrlText 7401;
	_strTargetClear = format ["(141) Anonymous: %1", _str];
	_strTargetFound = format ["(141) Anonymous [%1]: %2", mapGridPosition player, _str];
	_strEnterMessage = "Enter a message first...";
	_Random = round (random 100);

	if (_str == "") exitWith {
		[_strEnterMessage, Framework_Color_Red] call Framework_Message_Notification;
	};
	
	if (_Random < 50) then {
		[_strTargetFound] call Framework_Message_System;
	} else {
		[_strTargetClear] call Framework_Message_System;
	};

	closeDialog 0;	
}] call Framework_Compile;

['Framework_Message_System', {
	private ['_chat'];

	_chat = [_this, 0, '', ['']] call BIS_fnc_param;

	[_chat, "systemChat", true, true] call BIS_fnc_MP;
}] call Framework_Compile;

['Framework_Message_Global', {
	private ['_chat'];

	_chat = [_this, 0, '', ['']] call BIS_fnc_param;

	[player globalChat _chat, "BIS_fnc_spawn", true, true] call BIS_fnc_MP;	
}] call Framework_Compile;