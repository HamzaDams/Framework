class Dialog_Shop {
	idd = -1;
	name= "Dialog_Shop";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with uiNameSpace do { Dialog_Shop = _this select 0 }";
	controls[]=
	{
		Background,
		Header,
		ListShopItems,
		ListInvItems,
		ButtonBuy,
		ButtonSell,
		TextStrDesc,
		EditBox,
		TextAmount,
		ButtonClose,
		TextTitle
	};

	class Background: RscPicture
	{
		idc = IDC_SHOP_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.225 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.68 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_SHOP_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.225 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ListShopItems: RscListbox
	{
		idc = IDC_SHOP_LISTSHOPITEMS;
		onLBSelChanged = "call Framework_Shop_GetItemDesc";
		x = 0.2375 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.275 * safezoneW;
		h = 0.3 * safezoneH;
	};
	class ListInvItems: RscListbox
	{
		idc = IDC_SHOP_LISTINVITEMS;
		x = 0.2375 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.275 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class ButtonBuy: RscButton
	{
		idc = IDC_SHOP_BUTTONBUY;
		text = "Purchase"; //--- ToDo: Localize;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonSell: RscButton
	{
		idc = IDC_SHOP_BUTTONSELL;
		text = "Sell"; //--- ToDo: Localize;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextStrDesc: RscStructuredText
	{
		idc = IDC_SHOP_TEXTSTRDESC;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.46 * safezoneH;
	};
	class EditBox: RscEdit
	{
		idc = IDC_SHOP_EDITBOX;
		x = 0.575 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextAmount: RscText
	{
		idc = IDC_SHOP_TEXTAMOUNT;
		text = "Amount:"; //--- ToDo: Localize;
		x = 0.525 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_SHOP_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.75 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
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
	class TextTitle: RscText
	{
		idc = IDC_SHOP_TEXTTITLE;
		text = "Shop %1"; //--- ToDo: Localize;
		x = 0.2375 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.5125 * safezoneW;
		h = 0.06 * safezoneH;
	};
};
/* #Cytebi
$[
	1.063,
	["Shop",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.225 * safezoneW + safezoneX","0.16 * safezoneH + safezoneY","0.55 * safezoneW","0.68 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.225 * safezoneW + safezoneX","0.1 * safezoneH + safezoneY","0.55 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"ListShopItems",[1,"",["0.2375 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.275 * safezoneW","0.3 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"ListInvItems",[1,"",["0.2375 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.275 * safezoneW","0.32 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonBuy",[1,"Purchase",["0.525 * safezoneW + safezoneX","0.24 * safezoneH + safezoneY","0.2375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonSell",[1,"Sell",["0.525 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.2375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"TextStrDesc",[1,"",["0.525 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.2375 * safezoneW","0.46 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditBox",[1,"",["0.575 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.1875 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"TextAmount",[1,"Amount:",["0.525 * safezoneW + safezoneX","0.18 * safezoneH + safezoneY","0.05 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"ButtonClose",[1,"X",["0.75 * safezoneW + safezoneX","0.1 * safezoneH + safezoneY","0.025 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"TextTitle",[1,"Shop %1",["0.2375 * safezoneW + safezoneX","0.1 * safezoneH + safezoneY","0.5125 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
