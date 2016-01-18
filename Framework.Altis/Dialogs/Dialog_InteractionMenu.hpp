class Dialog_InteractionMenu {
	idd = -1;
	name= "Dialog_InteractionMenu";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		Title,
		ButtonClose,
		ComboActions,
		ListDisplay
	};

	class Background: RscPicture
	{
		idc = IDC_INTERACTIONMENU_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.56 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_INTERACTIONMENU_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_INTERACTIONMENU_TITLE;
		text = "Interaction"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_INTERACTIONMENU_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6125 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
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
	class ComboActions: RscCombo
	{
		idc = IDC_INTERACTIONMENU_COMBOACTIONS;
		onLBSelChanged = "call Framework_Interactions_OnSelect";
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ListDisplay: RscListbox
	{
		idc = IDC_INTERACTIONMENU_LISTDISPLAY;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.46 * safezoneH;
	};
};

/* #Bidaju
$[
	1.063,
	["InteractionMenu",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.375 * safezoneW + safezoneX","0.24 * safezoneH + safezoneY","0.25 * safezoneW","0.56 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.375 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.25 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Interaction",["0.3875 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.2125 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonClose",[1,"X",["0.6125 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"ComboActions",[1,"",["0.3875 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListDisplay",[1,"",["0.3875 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.225 * safezoneW","0.46 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/