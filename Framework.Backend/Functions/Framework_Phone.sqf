['Framework_Phone_Open', {
	createDialog "Dialog_Phone";
	[] call Framework_Phone_Populate;
}] call Framework_Compile;

['Framework_Phone_Populate', {
	private ['_index'];

	buttonSetAction [2660, "call Framework_Phone_Send"];

	{
		_index = lbAdd [2560, format["%1 (%2)", name _x, _x]];
		lbSetData [2560, _index, str _x];
	} forEach playableUnits - [player];
}] call Framework_Compile;

['Framework_Phone_Send', {
	private ['_text', '_sentTo', '_str'];

	_text = ctrlText 2460;
	_sentTo = lbData [2560, (lbCurSel 2560)];

	if (_text isEqualTo "") exitWith {
		_str = "You must enter a message first...";
		[_str, Framework_Color_Red] call Framework_Message_Notification;
	};

	[[player, _str], "Framework_Phone_Recieve", _sentTo] spawn BIS_fnc_MP;
}] call Framework_Compile;

['Framework_Phone_Recieve', {
	private ['_sentFrom', '_message', '_str'];

	_sentFrom = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_message = [_this, 1, '', ['']] call BIS_fnc_param;
	_str = format ["MESSAGE FROM %1 (%2): %3", name _sentFrom, _sentFrom, _message];

	[_str, Framework_Color_Green] call Framework_Message_Notification;
}] call Framework_Compile;