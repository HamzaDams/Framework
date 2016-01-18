class Dialog_MessageSystem {
	idd = -1;
	name= "Dialog_MessageSystem";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	controls[]=
	{
		Background,
		Header,
		Title,
		ButtonClose,
		EditBox,
		ButtonSend
	};

	class Background: RscPicture
	{
		idc = IDC_MESSAGESYSTEM_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.18 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_MESSAGESYSTEM_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_MESSAGESYSTEM_TITLE;
		text = "Message System"; //--- ToDo: Localize;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
		w = 0.3125 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_MESSAGESYSTEM_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6625 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
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
	class EditBox: RscEdit
	{
		idc = IDC_MESSAGESYSTEM_EDITBOX;
		htmlControl = true;
		style = ST_MULTI;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class ButtonSend: RscButton
	{
		idc = IDC_MESSAGESYSTEM_BUTTONSEND;
		text = "Send"; //--- ToDo: Localize;
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
	};
};

/* #Xyqahe
$[
	1.063,
	["MessageSystem",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.342556 * safezoneW + safezoneX","0.345966 * safezoneH + safezoneY","0.321448 * safezoneW","0.0700156 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.342556 * safezoneW + safezoneX","0.415981 * safezoneH + safezoneY","0.321448 * safezoneW","0.22405 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Message System",["0.349116 * safezoneW + safezoneX","0.345966 * safezoneH + safezoneY","0.118083 * safezoneW","0.0560125 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"TextBox",[1,"",["0.349116 * safezoneW + safezoneX","0.471994 * safezoneH + safezoneY","0.308328 * safezoneW","0.0420094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"Button_Send",[1,"Send",["0.388477 * safezoneW + safezoneX","0.556012 * safezoneH + safezoneY","0.0852822 * safezoneW","0.0560125 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"Button_Cancel",[1,"Cancel",["0.532801 * safezoneW + safezoneX","0.556012 * safezoneH + safezoneY","0.0852822 * safezoneW","0.0560125 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

/* #Hisysa
$[
	1.063,
	["MessageSystem",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],1,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.325 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.35 * safezoneW","0.18 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.325 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.35 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Message System",["0.3375 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.3125 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonClose",[1,"X",["0.6625 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditBox",[1,"",["0.3375 * safezoneW + safezoneX","0.38 * safezoneH + safezoneY","0.325 * safezoneW","0.08 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonSend",[1,"Send",["0.3375 * safezoneW + safezoneX","0.48 * safezoneH + safezoneY","0.325 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
