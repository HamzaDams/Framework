class Dialog_Trunk {
	idd = -1;
	name= "Dialog_Trunk";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		ListInventory,
		ListTrunk,
		ButtonStore,
		ButtonTake,
		TextWeight,
		TItle,
		ButtonClose,
		Edit
	};

	class Background: RscPicture
	{
		idc = IDC_TRUNK_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.2625 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.475 * safezoneW;
		h = 0.6 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_TRUNK_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.2625 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.475 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ListInventory: RscListbox
	{
		idc = IDC_TRUNK_LISTINVENTORY;
		x = 0.275 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.48 * safezoneH;
	};
	class ListTrunk: RscListbox
	{
		idc = IDC_TRUNK_LISTTRUNK;
		x = 0.5125 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.48 * safezoneH;
	};
	class ButtonStore: RscButton
	{
		idc = IDC_TRUNK_BUTTONSTORE;
		text = "PUT INTO TRUNK"; //--- ToDo: Localize;
		x = 0.275 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonTake: RscButton
	{
		idc = IDC_TRUNK_BUTTONTAKE;
		text = "TAKE FROM TRUNK"; //--- ToDo: Localize;
		x = 0.55 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextWeight: RscText
	{
		idc = IDC_TRUNK_TEXTWEIGHT;
		text = "Weight: 0/0"; //--- ToDo: Localize;
		x = 0.275 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.45 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TItle: RscText
	{
		idc = IDC_TRUNK_TITLE;
		text = "TRUNK MANAGEMENT"; //--- ToDo: Localize;
		x = 0.275 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.4625 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_TRUNK_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.725 * safezoneW + safezoneX;
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
	class Edit: RscEdit
	{
		idc = IDC_TRUNK_EDIT;
		x = 0.4625 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
	};
};

/* #Xepiwo
$[
	1.063,
	["Trunk",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.2625 * safezoneW + safezoneX","0.2 * safezoneH + safezoneY","0.475 * safezoneW","0.6 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.2625 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.475 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListInventory",[1,"",["0.275 * safezoneW + safezoneX","0.24 * safezoneH + safezoneY","0.2125 * safezoneW","0.48 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"ListTrunk",[1,"",["0.5125 * safezoneW + safezoneX","0.24 * safezoneH + safezoneY","0.2125 * safezoneW","0.48 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonStore",[1,"PUT INTO TRUNK",["0.275 * safezoneW + safezoneX","0.74 * safezoneH + safezoneY","0.175 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonTake",[1,"TAKE FROM TRUNK",["0.55 * safezoneW + safezoneX","0.74 * safezoneH + safezoneY","0.175 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"TextWeight",[1,"Weight: 0/0",["0.275 * safezoneW + safezoneX","0.2 * safezoneH + safezoneY","0.45 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"TItle",[1,"Trunk",["0.275 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.4625 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"ButtonClose",[1,"X",["0.725 * safezoneW + safezoneX","0.14 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"Edit",[1,"",["0.4625 * safezoneW + safezoneX","0.74 * safezoneH + safezoneY","0.075 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
