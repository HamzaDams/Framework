class Dialog_TicketMenu {
	idd = -1;
	name= "Dialog_TicketMenu";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		Title,
		ButtonClose,
		ButtonIssue,
		EditAmount,
		TextAmount,
		TextReason,
		EditReason
	};

	class Background: RscPicture
	{
		idc = IDC_TICKETMENU_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.22 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_TICKETMENU_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_TICKETMENU_TITLE;
		text = "TICKETING INTERFACE"; //--- ToDo: Localize;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.2875 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class ButtonClose: RscButton
	{
		idc = IDC_TICKETMENU_BUTTONCLOSE;
		text = "X"; //--- ToDo: Localize;
		x = 0.6375 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
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
	class ButtonIssue: RscButton
	{
		idc = IDC_TICKETMENU_BUTTONISSUE;
		text = "ISSUE TICKET"; //--- ToDo: Localize;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.275 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class EditAmount: RscEdit
	{
		idc = IDC_TICKETMENU_EDITAMOUNT;
		x = 0.45 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextAmount: RscText
	{
		idc = IDC_TICKETMENU_TEXTAMOUNT;
		text = "Amount to ticket:"; //--- ToDo: Localize;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TextReason: RscText
	{
		idc = IDC_TICKETMENU_TEXTREASON;
		text = "Reason for ticket:"; //--- ToDo: Localize;
		x = 0.3625 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class EditReason: RscEdit
	{
		idc = IDC_TICKETMENU_EDITREASON;
		x = 0.45 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.1875 * safezoneW;
		h = 0.04 * safezoneH;
	};
};

/* #Xomeqi
$[
	1.063,
	["TicketMenu",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.35 * safezoneW + safezoneX","0.32 * safezoneH + safezoneY","0.3 * safezoneW","0.22 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.35 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.3 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"TICKETING INTERFACE",["0.3625 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.2875 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"ButtonClose",[1,"X",["0.6375 * safezoneW + safezoneX","0.26 * safezoneH + safezoneY","0.0125 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"ButtonIssue",[1,"Issue Ticket",["0.3625 * safezoneW + safezoneX","0.48 * safezoneH + safezoneY","0.275 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"EditAmount",[1,"",["0.45 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.1875 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"TextAmount",[1,"Amount to ticket:",["0.3625 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.0875 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"TextReason",[1,"Reason for ticket:",["0.3625 * safezoneW + safezoneX","0.42 * safezoneH + safezoneY","0.0875 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1401,"EditReason",[1,"",["0.45 * safezoneW + safezoneX","0.42 * safezoneH + safezoneY","0.1875 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

