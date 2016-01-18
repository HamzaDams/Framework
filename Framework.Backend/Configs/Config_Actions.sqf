Config_Actions = [
	["[MENU]", { call Framework_PlayerMenu_Open; }, "true", "#00A30C"],
	["[Player Interaction]", { [cursorTarget] call Framework_Interactions_Open; }, "((cursorTarget in playableUnits) && (player distance cursorTarget <= 5))", "#0098D6"],
	["[ATM]", { call Framework_ATM_Open; }, "player distance Framework_ATM_1 <= 5", "#00A30C"],
	["[ATM]", { call Framework_ATM_Open; }, "player distance Framework_ATM_2 <= 5", "#00A30C"],
	["[ATM]", { call Framework_ATM_Open; }, "player distance Framework_ATM_3 <= 5", "#00A30C"],
	["[ATM]", { call Framework_ATM_Open; }, "player distance Framework_ATM_4 <= 5", "#00A30C"],
	["[Truck Shop]", { ['Framework_Shop_Truck'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Truck1 <= 5", "#0098D6"],

	["[Police Item Shop]", { ['Framework_PD_ItemShop'] call Framework_Shop_InfoOpen; }, "((player distance Framework_PD_ItemShop <= 5) && (Player_Side == 'Police'))", "#0098D6"],

	["[Food Shop]", { ['Framework_Shop_Food1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Food1 <= 5", "#0098D6"],
	["[Food Shop]", { ['Framework_Shop_Food2'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Food2 <= 5", "#0098D6"],
	["[Food Shop]", { ['Framework_Shop_Food3'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Food3 <= 5", "#0098D6"],
	["[Fishing Tools]", { ['Framework_Shop_FishingTools1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_FishingTools1 <= 5", "#0098D6"],
	["[Mining Tools]", { ['Framework_Shop_MiningTools1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_MiningTools1 <= 5", "#0098D6"],
	["[Farm Shop]", { ['Framework_Shop_Farming1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Farming1 <= 5", "#0098D6"],
	["[Resource Shop]", { ['Framework_Shop_Resource1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Resource1 <= 5", "#0098D6"],
	["[Resource Shop]", { ['Framework_Shop_Resource2'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Resource2 <= 5", "#0098D6"],
	["[Market]", { ['Framework_Shop_Market1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Market1 <= 5", "#0098D6"],
	["[Market]", { ['Framework_Shop_Market2'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Market2 <= 5", "#0098D6"],
	["[Market]", { ['Framework_Shop_Market3'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Market3 <= 5", "#0098D6"],
	["[Pistol Shop]", { ['Framework_Shop_Pistol1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Pistol1 <= 5", "#0098D6"],
	["[Pistol Shop]", { ['Framework_Shop_Pistol2'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Pistol2 <= 5", "#0098D6"],
	["[Boat Shop]", { ['Framework_Shop_Boat1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Boat1 <= 5", "#0098D6"],
	["[Vehicle Storage]", { }, "player distance Framework_VehicleStorage1 <= 5", "#0098D6"],
	["[Vehicle Storage]", { }, "player distance Framework_VehicleStorage2 <= 5", "#0098D6"],
	["[Item Shop]", { ['Framework_Shop_Item'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Item <= 5", "#0098D6"],
	["[Clothing Shop]", { ['Framework_Shop_Clothing1'] call Framework_Shop_InfoOpen; }, "player distance Framework_Shop_Clothing1 <= 5", "#0098D6"],
	["[Lock/Unlock Vehicle]", { [cursorTarget] call Framework_Vehicle_Lock; }, "((cursorTarget in vehicles) && ((getPlayerUID player) in (cursorTarget getVariable 'Users')) && ((player distance cursorTarget) <= 5))", "#00A30C"],
	["[Vehicle Interaction]", { [cursorTarget] call Framework_Vehicle_Interaction_Open; }, "((cursorTarget in vehicles) && ((player distance cursorTarget) <= 5))", "#00A30C"],
	["[Rob The Bank]", { [] call Framework_Crimes_BankRobbery_Start; }, "player distance Framework_Bank <= 5", "#DF0101"],
	["[Clean Money]", { [] call Framework_Crimes_MoneyDealer_Start; }, "player distance Framework_MoneyDealer <= 5", "#DF0101"],
	["[Get Delivery Job]", { call Framework_Jobs_Delivery_Start; }, "((Player_HasDeliveryJob isEqualTo false) && ((player distance Framework_DeliveryJob) <= 5) && (Player_Side == 'Civilian'))", "#00A30C"],
	["[Finish Delivery Job]", { call Framework_Jobs_Delivery_Finish; }, "(Player_HasDeliveryJob isEqualTo true && ((player distance Delivery_Location) <= 5))", "#00A30C"],
	["[Cancel Delivery Job]", { call Framework_Jobs_Delivery_Cancel; }, "Player_HasDeliveryJob isEqualTo true && !((player distance Delivery_Location) <= 5)", "#DF0101"]
];
publicVariable 'Config_Actions';

Config_PlayerMenuActions = [
	["Call 311", "call Framework_Message_311Setup"],
	["Call 141", "call Framework_Message_141Setup"],
	["Call 911", "call Framework_Message_911Setup"],
	["Inventory", "call Framework_PlayerMenu_Inventory"],
	["Stats", "call Framework_PlayerMenu_Stats"],
	["Skills", "call Framework_PlayerMenu_Skills"]
];
publicVariable 'Config_PlayerMenuActions';

Config_ShopInfoMenuNonOwnerActions = [
	["Buy Shop", "call Framework_Shop_BuyShop"]
];
publicVariable 'Config_ShopInfoMenuNonOwnerActions';

Config_ShopInfoMenuActions = [
	["Enter Shop", "call Framework_Shop_ShopEnter"],
	["Add Stock", "call Framework_Shop_AddStock"],
	["Leave Shop", "closeDialog 0"]
];
publicVariable 'Config_ShopInfoMenuActions';

Config_ShopInfoMenuOwnerActions = [
	["Sell Shop", "call Framework_Shop_SellShop"],
	["Retreive Money", "call Framework_Shop_RetreiveMoney"]
];
publicVariable 'Config_ShopInfoMenuOwnerActions';

Config_vehicleInteractionActions = [
	["Vehicle Information", "call Framework_Vehicle_Interaction_Information", "true"],
	["Manage Users", "call Framework_Vehicle_Interaction_ManageUsers", "((Current_Vehicle getVariable 'OwnerID') isEqualTo (getPlayerUID player))"],
	["Open Trunk", "call Framework_Vehicle_Interaction_Trunk_Open", "((getPlayerUID player) in (Current_Vehicle getVariable 'Users'))"],
	["Search", "call Framework_Vehicle_Interaction_Search", "true"],
	["Impound", "call Framework_Vehicle_Interaction_Impound", "false"]
];
publicVariable 'Config_vehicleInteractionActions';

Config_InteractionActions = [
	["Information", "hint 'test'", "true"],
	["Rob", "hint 'test'", "true"],
	["Ticket", "call Framework_Interactions_Ticket_Open", "true"],
	["Handcuff", "call Framework_Interactions_Handcuff", "true"],
	["Arrest", "hint 'test'", "true"],
	["Drag", "hint 'test'", "true"]
];
publicVariable 'Config_InteractionActions';

Config_PlayerInformation = [
	['Name:', "name InteractWith"],
	['Unit:', "InteractWith"]
];
publicVariable "Config_PlayerInformation";