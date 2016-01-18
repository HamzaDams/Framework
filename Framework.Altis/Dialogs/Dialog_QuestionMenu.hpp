class Dialog_QuestionMenu {
	idd = -1;
	name= "Dialog_QuestionMenu";
	onLoad = "with uiNameSpace do { Dialog_QuestionMenu = _this select 0 }";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		StructuredText,
		ButtonAccept,
		ButtonDecline,
		Header,
		Title,
		ButtonClose
	};

	class Background: RscPicture
	{
		idc = IDC_QUESTIONMENU_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.26 * safezoneH;
	};
	class StructuredText: RscStructuredText
	{
		idc = IDC_QUESTIONMENU_STRUCTUREDTEXT;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.1 * safezoneH;
	};
	class ButtonAccept: RscButton
	{
		idc = IDC_QUESTIONMENU_BUTTONACCEPT;
		text = "Accept"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ButtonDecline: RscButton
	{
		idc = IDC_QUESTIONMENU_BUTTONDECLINE;
		text = "Decline"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.56 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_QUESTIONMENU_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_QUESTIONMENU_TITLE;
		text = "Ticket"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.3 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_QUESTIONMENU_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6125 * safezoneW + safezoneX;
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
};
/* #Sopero
$[
	1.063,
	["QuestionMenu",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.375 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.25 * safezoneW","0.26 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"StructuredText",[1,"",["0.3875 * safezoneW + safezoneX","0.38 * safezoneH + safezoneY","0.225 * safezoneW","0.1 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonAccept",[1,"Accept",["0.3875 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonDecline",[1,"Decline",["0.3875 * safezoneW + safezoneX","0.56 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.375 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.25 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"Ticket",["0.3875 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.2375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"ButtonClose",[1,"X",["0.6125 * safezoneW + safezoneX","0.3 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
