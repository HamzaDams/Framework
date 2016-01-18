['Framework_Gear_Add', {
	private ['_classname', '_gearType'];
	
	_classname = [_this, 0] call BIS_fnc_param;
	_gearType = [_classname, 'type'] call Framework_Config_GetGear;

	switch (_gearType) do {
		case "vest": { 
			player addVest _classname;
		};

		case "backpack": { 
			player addBackpack _classname;
		};

		case "item": { 
			player addItem _classname;
		};

		case "weapon": { 
			player addWeapon _classname;
		};

		case "magazine": { 
			player addMagazine _classname;
		};
	};
}] call Framework_Compile;

['Framework_Gear_Remove', {
	private ['_classname', '_gearType'];
	
	_classname = [_this, 0] call BIS_fnc_param;
	_gearType = [_classname, 'type'] call Framework_Config_GetGear;

	switch (_gearType) do {
		case "vest": { 
			removeVest player;
		};

		case "backpack": { 
			removeBackpack player;
		};

		case "item": { 
			if (goggles player isEqualTo _classname) exitWith {
				removeGoggles player;
			};

			if (vest player isEqualTo _classname) exitWith {
				removeVest player;
			};

			if (headGear player isEqualTo _classname) exitWith {
				removeHeadgear player;
			};

			if (uniform player isEqualTo _classname) exitWith {
				removeUniform player;
			};

			player removeItem _classname;
		};

		case "weapon": { 
			player removeWeapon _classname;
		};

		case "magazine": { 
			player removeMagazine _classname;
		};
	};
}] call Framework_Compile;

['Framework_Gear_CheckSpace', {
	private ['_classname', '_gearType', '_return', '_primaryWeapon', '_secondaryWeapon', '_canAdd'];
	
	_classname = [_this, 0] call BIS_fnc_param;
	_gearType = [_classname] call Framework_Gear_GetGearType;
	_return = player canAdd _classname;

	switch (_gearType) do {
		case 'primaryweapon': {
			if ((primaryWeapon player) isEqualTo '') then {
				_return = true;
			}else{
				_return = false;
			};
		};

		case 'sidearmweapon': {
			if ((secondaryWeapon player) isEqualTo '') then {
				_return = true;
			}else{
				_return = false;
			};
		};

		case 'secondaryweapon': {
			if ((secondaryWeapon player) isEqualTo '') then {
				_return = true;
			}else{
				_return = false;
			};
		};

		case 'backpack': {
			if ((backpack player) isEqualTo '') then {
				_return = true;
			}else{
				_return = false;
			};
		};

		case 'vest': {
			if ((vest player) isEqualTo '') then {
				_return = true;
			}else{
				_return = false;
			};
		};
	};

	_return;
}] call Framework_Compile;

['Framework_Gear_GetGearType', {
	private ['_classname', '_gearType', '_weaponType', '_magazineType', '_return'];
	_classname = [_this, 0] call BIS_fnc_param;
	_gearType = [format['%1', _classname], 'type'] call Framework_Config_GetGear;
	_return = false;

	if (_gearType isEqualTo 'weapon') then {
		_weaponType = getNumber(configFile >> "cfgWeapons" >> _classname >> "type");
		
		switch (_weaponType) do {
			case 1: { 
				_return = 'primaryweapon';
			};
	
			case 2: { 
				_return = 'sidearmweapon';
			};
	
			case 16: { 
				_return = 'secondaryweapon';
			};
		};
	};

	if (_gearType isEqualTo 'magazine') then {
		_magazineType = getNumber(configFile >> "cfgMagazines" >> _classname >> "type");

		switch (_magazineType) do {
			case 256: { 
				_return = 'primarymagazine';
			};
	
			case 16: { 
				_return = 'sidearmmagazine';
			};
		};
	};

	if (_gearType isEqualTo 'item') then {
		_return = 'item';
	};

	if (_gearType isEqualTo 'backpack') then {
		_return = 'backpack';
	};

	_return;
}] call Framework_Compile;