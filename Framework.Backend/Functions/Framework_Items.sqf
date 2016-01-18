['Framework_Items_MedicalKit', {
	private ['_classname', '_amount'];
	
	_classname = [_this, 0] call BIS_fnc_param;
	_amount = [_this, 1] call BIS_fnc_param;

	if (_amount <= 0 || _amount > 1) exitWith {
		//can only use one at a time
	};

	switch (_classname) do {
		case "smedkit": { 
			[0.2] call Framework_Items_MedicalKit_Apply;
		};

		case "medkit": { 
			[0.5] call Framework_Items_MedicalKit_Apply;
			hint 'works';
		};

		case "lmedkit": { 
			[0.8] call Framework_Items_MedicalKit_Apply;
		};
	};
}] call Framework_Compile;

['Framework_Items_MedicalKit_Apply', {
	private ['_regen'];
	
	_regen = [_this, 0] call BIS_fnc_param;

	player setDamage ((damage player) - _regen);
}] call Framework_Compile;