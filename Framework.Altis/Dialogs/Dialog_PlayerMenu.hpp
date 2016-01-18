class Dialog_PlayerMenu {
	idd = -1;
	name= "Dialog_PlayerMenu";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		Title,
		ListInventory,
		ListMenu,
		ButtonUse,
		ButtonDrop,
		ListPlayers,
		ButtonGive,
		TextWeight,
		EditUse,
		EditGive,
		ButtonClose
	};

	class Background: RscPicture
	{
		idc = IDC_PLAYERMENU_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.7 * safezoneW;
		h = 0.84 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_PLAYERMENU_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.7 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_PLAYERMENU_TITLE;
		text = "PLAYER MENU"; //--- ToDo: Localize;
		x = 0.1625 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.6875 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ListInventory: RscListbox
	{
		idc = IDC_PLAYERMENU_LISTINVENTORY;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.74 * safezoneH;
	};
	class ListMenu: RscListbox
	{
		idc = IDC_PLAYERMENU_LISTMENU;
		onLBSelChanged = "call Framework_PlayerMenu_MenuSelect";
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.5 * safezoneH;
	};
	class ButtonUse: RscButton
	{
		idc = IDC_PLAYERMENU_BUTTONUSE;
		text = "Use"; //--- ToDo: Localize;
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonDrop: RscButton
	{
		idc = IDC_PLAYERMENU_BUTTONDROP;
		text = "Drop"; //--- ToDo: Localize;
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ListPlayers: RscListbox
	{
		idc = IDC_PLAYERMENU_LISTPLAYERS;
		x = 0.1625 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.62 * safezoneH;
	};
	class ButtonGive: RscButton
	{
		idc = IDC_PLAYERMENU_BUTTONGIVE;
		text = "Give"; //--- ToDo: Localize;
		x = 0.1625 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextWeight: RscText
	{
		idc = IDC_PLAYERMENU_TEXTWEIGHT;
		text = "Weight: %1/%2"; //--- ToDo: Localize;
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class EditUse: RscEdit
	{
		idc = IDC_PLAYERMENU_EDITUSE;
		x = 0.6875 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class EditGive: RscEdit
	{
		idc = IDC_PLAYERMENU_EDITGIVE;
		x = 0.1625 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_PLAYERMENU_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.825 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
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

/* #Vufiju
$[
	1.063,
	["PlayerMenu",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.15 * safezoneW + safezoneX","0.08 * safezoneH + safezoneY","0.7 * safezoneW","0.84 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.15 * safezoneW + safezoneX","0.08 * safezoneH + safezoneY","0.7 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Player Menu",["0.1625 * safezoneW + safezoneX","0.08 * safezoneH + safezoneY","0.6875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListInventory",[1,"",["0.325 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.35 * safezoneW","0.74 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"ListMenu",[1,"",["0.6875 * safezoneW + safezoneX","0.4 * safezoneH + safezoneY","0.15 * safezoneW","0.5 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonUse",[1,"Use",["0.6875 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonDrop",[1,"Drop",["0.6875 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1502,"ListPlayers",[1,"",["0.1625 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.15 * safezoneW","0.62 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"ButtonGive",[1,"Give",["0.1625 * safezoneW + safezoneX","0.22 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"TextWeight",[1,"Weight: %1/%2",["0.6875 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditUse",[1,"",["0.6875 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"EditGive",[1,"",["0.1625 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.15 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"ButtonClose",[1,"X",["0.825 * safezoneW + safezoneX","0.08 * safezoneH + safezoneY","0.025 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,0],"","-1"],[]]
]
*/


