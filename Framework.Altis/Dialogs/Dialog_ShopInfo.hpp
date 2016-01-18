class Dialog_ShopInfo {
	idd = -1;
	name= "Dialog_ShopInfo";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with uiNameSpace do { Dialog_ShopInfo = _this select 0 }";
	controls[]=
	{
		Background,
		Header,
		ListMenu,
		StrText,
		Title,
		ButtonClose
	};
	class Background: RscPicture
	{
		idc = IDC_SHOPINFO_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.36 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_SHOPINFO_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ListMenu: RscListbox
	{
		idc = IDC_SHOPINFO_LISTMENU;
		onLBSelChanged = "call Framework_Shop_InfoMenuSelect";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class StrText: RscStructuredText
	{
		idc = IDC_SHOPINFO_STRTEXT;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_SHOPINFO_TITLE;
		text = "SHOP"; //--- ToDo: Localize;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.3375 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_SHOPINFO_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6625 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
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

/* #Dejugi
$[
	1.063,
	["ShopInfo",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.3125 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.375 * safezoneW","0.36 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.3125 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListMenu",[1,"",["0.325 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.1625 * safezoneW","0.32 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"StrText",[1,"",["0.5 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.175 * safezoneW","0.32 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"SHOP",["0.325 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.3375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonClose",[1,"X",["0.6625 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.025 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
