class Dialog_ATM {
	idd = -1;
	name= "Dialog_ATM";
	movingEnable = false;
	enableSimulation = true;
	controls[]=
	{
		Background,
		Header,
		Title,
		Button_Withdraw,
		Button_Transfer,
		Button_Deposit,
		Text_CashStr,
		Text_BankStr,
		Edit_Amount,
		Text_AmountStr,
		Text_AccountNumber,
		Text_CashNumber,
		Combo_Players
	};

	class Background: RscPicture
	{
		idc = IDC_ATM_BACKGROUND;
		text = "#(argb,8,8,3)color(0,0,0,0.8)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.44 * safezoneH;
	};
	class Header: RscPicture
	{
		idc = IDC_ATM_HEADER;
		text = "#(argb,8,8,3)color(0,0.4,0.81,1)";
		x = 0.375 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Title: RscText
	{
		idc = IDC_ATM_TITLE;
		text = "ATM"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.06 * safezoneH;
	};
	class Button_Withdraw: RscButton
	{
		idc = IDC_ATM_BUTTON_WITHDRAW;
		text = "WITHDRAW"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.54 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Button_Transfer: RscButton
	{
		idc = IDC_ATM_BUTTON_TRANSFER;
		text = "TRANSFER"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Button_Deposit: RscButton
	{
		idc = IDC_ATM_BUTTON_DEPOSIT;
		text = "DEPOSIT"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.6 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Text_CashStr: RscText
	{
		idc = IDC_ATM_TEXT_CASHSTR;
		text = "CASH:"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Text_BankStr: RscText
	{
		idc = IDC_ATM_TEXT_BANKSTR;
		text = "ACCOUNT:"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Edit_Amount: RscEdit
	{
		idc = IDC_ATM_EDIT_AMOUNT;
		x = 0.4375 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Text_AmountStr: RscText
	{
		idc = IDC_ATM_TEXT_AMOUNTSTR;
		text = "AMOUNT:"; //--- ToDo: Localize;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Text_AccountNumber: RscText
	{
		idc = IDC_ATM_TEXT_ACCOUNTNUMBER;
		text = "ACCOUNT %1"; //--- ToDo: Localize;
		x = 0.4375 * safezoneW + safezoneX;
		y = 0.36 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Text_CashNumber: RscText
	{
		idc = IDC_ATM_TEXT_CASHNUMBER;
		text = "CASH %1"; //--- ToDo: Localize;
		x = 0.4375 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Combo_Players: RscCombo
	{
		idc = IDC_ATM_COMBO_PLAYERS;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.04 * safezoneH;
	};
};

/* #Byvofi
$[
	1.063,
	["ATM",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25","GUI_GRID"],0,1,0],
	[1200,"Background",[1,"#(argb,8,8,3)color(0,0,0,0.8)",["0.375 * safezoneW + safezoneX","0.34 * safezoneH + safezoneY","0.25 * safezoneW","0.44 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"Header",[1,"#(argb,8,8,3)color(0,0.4,0.81,1)",["0.375 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.25 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title",[1,"ATM",["0.3875 * safezoneW + safezoneX","0.28 * safezoneH + safezoneY","0.2375 * safezoneW","0.06 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"Button_Withdraw",[1,"Withdraw",["0.3875 * safezoneW + safezoneX","0.54 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"Button_Transfer",[1,"Transfer",["0.3875 * safezoneW + safezoneX","0.66 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"Button_Deposit",[1,"Deposit",["0.3875 * safezoneW + safezoneX","0.6 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Text_CashStr",[1,"Cash:",["0.3875 * safezoneW + safezoneX","0.42 * safezoneH + safezoneY","0.0375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"Text_BankStr",[1,"Account:",["0.3875 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.0375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"Edit_Amount",[1,"",["0.4375 * safezoneW + safezoneX","0.48 * safezoneH + safezoneY","0.175 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"Text_AmountStr",[1,"Amount:",["0.3875 * safezoneW + safezoneX","0.48 * safezoneH + safezoneY","0.0375 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"Text_AccountNumber",[1,"account %1",["0.4375 * safezoneW + safezoneX","0.36 * safezoneH + safezoneY","0.175 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"Text_CashNumber",[1,"cash %1",["0.4375 * safezoneW + safezoneX","0.42 * safezoneH + safezoneY","0.175 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2100,"Combo_Players",[1,"",["0.3875 * safezoneW + safezoneX","0.72 * safezoneH + safezoneY","0.225 * safezoneW","0.04 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/