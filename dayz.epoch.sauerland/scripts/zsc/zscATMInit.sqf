ATMDialogUpdateAmounts = {
	ctrlSetText [23001,format["%1 %2",player getVariable [Z_MoneyVariable,0] call BIS_fnc_numberText,CurrencyName]];
	ctrlSetText [23002,format["%1 %2",player getVariable [z_bankVariable,0] call BIS_fnc_numberText,CurrencyName]];
};

ATMDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);	
	_bank = player getVariable [Z_bankVariable,0];
	_wealth = player getVariable [Z_moneyVariable,0];

	if (_amount > 999999) exitWith {"Du kannst nicht mehr als 999,999 Reichsmark auf einmal abheben." call dayz_rollingMessages};
	if (_amount < 1 or {_amount > _bank}) exitWith {"Du kannst dein Konto nicht überziehen." call dayz_rollingMessages};

	player setVariable [Z_moneyVariable,(_wealth + _amount),true];
	player setVariable [Z_bankVariable,(_bank - _amount),true];
	call player_forceSave;

	format["Du hast %1 %2 Reichsmark abgehoben.",[_amount] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
};

ATMDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);
	_bank = player getVariable [Z_bankVariable,0];
	_wealth = player getVariable [Z_MoneyVariable,0];

	if (_amount > 999999) exitWith {"Du kannst nicht mehr als 999,999 Reichsmark auf einmal einzahlen." call dayz_rollingMessages};
	if (_amount < 1 or {_amount > _wealth}) exitWith {"Du kannst nicht mehr einzahlen als du hast." call dayz_rollingMessages};

	if (ZSC_limitOnBank && {(_bank + _amount) > ZSC_maxBankMoney}) then {
		format["Du kannst höchstens %1 %2 haben", [ZSC_maxBankMoney] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
	} else {
		player setVariable [Z_MoneyVariable,(_wealth - _amount),true];
		player setVariable [Z_bankVariable,(_bank + _amount),true];
		format["Du hast %1 %2 eingezahlt.",[_amount] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
		call player_forceSave;
	};
};
