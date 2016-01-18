class Dialog_Phone {
	idd = -1;
	name= "Dialog_Shop";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		Title,
		List,
		Edit,
		ButtonSend,
		ButtonClose
	};

	class Background: RscPicture
	{
		idc = IDC_PHONE_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.28 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_PHONE_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_PHONE_TITLE;
		text = "Phone"; //--- ToDo: Localize;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.3125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class List: RscListbox
	{
		idc = IDC_PHONE_LIST;
		x = 0.510369 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.24 * safezoneH;
	};
	class Edit: RscEdit
	{
		idc = IDC_PHONE_EDIT;
		htmlControl = true;
		style = ST_MULTI;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.18 * safezoneH;
	};
	class ButtonSend: RscButton
	{
		idc = IDC_PHONE_BUTTONSEND;
		text = "Send"; //--- ToDo: Localize;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.56 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_PHONE_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6625 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
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



/* #Hicuma
$[
	1.063,
	["Phone",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.325 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.35 * safezoneW","0.28 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.325 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.35 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Phone",["0.3375 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.3125 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"List",[1,"",["0.510369 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.15 * safezoneW","0.24 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"Edit",[1,"",["0.3375 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.1625 * safezoneW","0.18 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonSend",[1,"Send",["0.3375 * safezoneW + safezoneX","0.56 * safezoneH + safezoneY","0.1625 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonClose",[1,"X",["0.6625 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
