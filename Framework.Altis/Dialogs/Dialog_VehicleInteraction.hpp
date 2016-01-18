class Dialog_VehicleInteraction {
	idd = -1;
	name= "Dialog_VehicleInteraction";
	movingEnable = false;
	controls[]=
	{
		Background,
		ListMenu,
		Button,
		Header,
		Title,
		ListDisplay,
		ButtonClose
	};

	class Background: RscPicture
	{
		idc = IDC_VEHICLEINTERACTION_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.275 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.45 * safezoneW;
		h = 0.6 * safezoneH;
	};
	class ListMenu: RscListbox
	{
		idc = IDC_VEHICLEINTERACTION_LISTMENU;
		onLBSelChanged = "call Framework_Vehicle_Interaction_OnSelect";
		x = 0.2875 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.56 * safezoneH;
	};
	class Button: RscButton
	{
		idc = IDC_VEHICLEINTERACTION_BUTTON;
		text = "Allow Access"; //--- ToDo: Localize;
		x = 0.45 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		w = 0.2625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_VEHICLEINTERACTION_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.275 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.45 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_VEHICLEINTERACTION_TITLE;
		text = "Vehicle Interaction"; //--- ToDo: Localize;
		x = 0.2875 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ListDisplay: RscListbox
	{
		idc = IDC_VEHICLEINTERACTION_LISTDISPLAY;
		x = 0.45 * safezoneW + safezoneX;
		y = 0.226999 * safezoneH + safezoneY;
		w = 0.2625 * safezoneW;
		h = 0.5 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_VEHICLEINTERACTION_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.7125 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.0125 * safezoneW;
		h = 0.02 * safezoneH;
		colorDisabled[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		action = "closeDialog 0";
	};
};

/* #Doziry
$[
	1.063,
	["VehicleInteraction",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.275 * safezoneW + safezoneX","0.2 * safezoneH + safezoneY","0.45 * safezoneW","0.6 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListMenu",[1,"",["0.2875 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.15 * safezoneW","0.56 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"Button",[1,"Allow Access",["0.45 * safezoneW + safezoneX","0.74 * safezoneH + safezoneY","0.2625 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.275 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.45 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Vehicle Interaction",["0.2875 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.4125 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"ListDisplay",[1,"",["0.45 * safezoneW + safezoneX","0.226999 * safezoneH + safezoneY","0.2625 * safezoneW","0.5 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"ButtonClose",[1,"X",["0.7125 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
