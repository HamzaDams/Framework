class Dialog_UI {
	idd = -1;
	name= "Dialog_UI";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		background,
		textBox,
		transparentIcon,
		versionText,
		icon
	};

	class background: RscPicture
	{
		idc = IDC_UI_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.225 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class textBox: RscStructuredText
	{
		idc = IDC_UI_TEXTBOX;
		text = ""; //--- ToDo: Localize;
		x = 0.2625 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.5125 * safezoneW;
		h = 0.06 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
		sizeEx = 0.5 * GUI_GRID_H;
	};
	class transparentIcon: RscPicture
	{
		idc = IDC_UI_TRANSPARENTICON;
		text = "emblem_trans.paa";
		x = 0 * safezoneW + safezoneX;
		y = 0.92 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.06 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class versionText: RscText
	{
		idc = IDC_UI_VERSIONTEXT;
		text = "Development Build V0.1"; //--- ToDo: Localize;
		x = 0 * safezoneW + safezoneX;
		y = 0.98 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.02 * safezoneH;
		sizeEx = 0.5 * GUI_GRID_H;
	};
	class icon: RscPicture
	{
		idc = IDC_UI_ICON;
		text = "emblem2.paa";
		x = 0.225 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.06 * safezoneH;
	};
};


/* #Tidije
$[
	1.063,
	["UI",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],1,1,0],
	[1200,"background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.225 * safezoneW + safezoneX","0 * safezoneH + safezoneY","0.55 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"textBox",[1,"TEST",["0.2625 * safezoneW + safezoneX","0 * safezoneH + safezoneY","0.5125 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","0.5"],[]],
	[1202,"transparentIcon",[1,"emblem_trans.paa",["0 * safezoneW + safezoneX","0.92 * safezoneH + safezoneY","0.0375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"versionText",[1,"Development Build V0.1",["0 * safezoneW + safezoneX","0.98 * safezoneH + safezoneY","0.25 * safezoneW","0.02 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.5"],[]],
	[1201,"icon",[1,"emblem2.paa",["0.225 * safezoneW + safezoneX","0 * safezoneH + safezoneY","0.0375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
