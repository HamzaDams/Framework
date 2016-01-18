["Framework_Lib_ReturnHealth", {
	private ['_return'];

	_return = (round (100 - (damage player * 110)));
	_return
}] call Framework_Compile;

['Framework_Lib_InDistance', {
	_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_distance = [_this, 1, 0, [0]] call BIS_fnc_param;

	if ((player distance _object) <= _distance) exitWith {true};

	false;
}] call Framework_Compile;