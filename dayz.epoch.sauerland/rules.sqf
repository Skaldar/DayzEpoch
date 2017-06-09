private ["_messages","_timeout"];

_messages = [
	["DayZ Epoch", "Hallo "+(name player)],
	["Karte", worldName],
	["Mumble", "mumble.nitrado.net:17900"],
	["Missionen(DZMS)", "Gleichzeitig sind 2 Missionen gegen Banditen und eine Schatzsuche verfügbar"],
	["KI-Patrouille(DZAI)", "Die KIs patrouillieren zu Fuß und in Land- und Luftfahrzeugen - Vorsicht in Städten!"],
	["Geld", "Statt Gold und Silber wird nun mit Reichsmark gehandelt"],
	["Server Regeln", "Heil dem Admin"],
	["News", "Reich oder Spritverschwendung? Das Lottosystem der Schatzkisten<br />Random news<br />"]
];
 
_timeout = 10;
{
	private ["_title","_content","_titleText"];
	uiSleep 2;
	_title = _x select 0;
	_content = _x select 1;
	_titleText = format[("<t font='TahomaB' size='0.40' color='#a81e13' align='right' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='right'>%2</t>"), _title, _content];
	[
		_titleText,
		[safezoneX + safezoneW - 0.8,0.50],     //DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7],      //DEFAULT: 0.8,0.7
		_timeout,
		0.5
	] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;