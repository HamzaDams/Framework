Config_Vehicles = [
	['C_SUV_01_F', 'SUV', 2000]
];
publicVariable "Config_Vehicles";

Config_VehicleInformation = [
	['Registration:', "Current_Vehicle getVariable 'License'"],
	['Registered Owner:', "Current_Vehicle getVariable 'Owner'"],
	['Vehicle Type:', "TypeOf Current_Vehicle"],
	['Vehicle Name:', "[TypeOf Current_Vehicle, 'name'] call Framework_Config_GetVehicle"],
	['Current Driver:', "_driver = driver Current_Vehicle; if (isNull _driver) then {'Nobody'} else {driver Current_Vehicle}"]
];
publicVariable "Config_VehicleInformation";