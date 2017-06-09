


dayz_spaceInterrupt = {
    private ["_dikCode", "_handled"];
    _dikCode = _this select 1;
    _handled = false;
 
    if (_dikCode == 0x44) then {
        if (j0k3r5_stats) then {
            j0k3r5_stats = false;
            hintSilent "";
        } else {[] spawn fnc_debug;};
    };
    _handled
};
 
fnc_debug = {
    j0k3r5_stats = true;
    while {j0k3r5_stats} do
	{
		_logo = "Stats\dayz.paa";
		_logo1 = "Stats\img\alive.paa";
		_logo2 = "Stats\img\bb.paa";
		_logo3 = "Stats\img\banditskilled.paa";
		_logo4 = "Stats\img\human.paa";
		_logo5 = "Stats\img\hh.paa";
		_logo6 = "Stats\img\zombies.paa";
		_logo7 = "Stats\img\map.paa";
		_logo8 = "Stats\img\HealIcon.paa";
		_logo9 = "Stats\img\walked.paa";

		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
		
		_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
		_textCity = "Wilderness";
		if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
			
		if (player == vehicle player) then
		{
			_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));	
		}
		else
		{
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));	
		};
		_level = "Stats\hu\survivor.paa";
		_timeleft= _combattimeout-time;
		_kills = 		player getVariable["zombieKills",0];
		_killsH = 		player getVariable["humanKills",0];
		_killsB = 		player getVariable["banditKills",0];
		_humanity =		player getVariable["humanity",0];
		_headShots = 	player getVariable["headShots",0];
		_zombies =              count entities "zZombie_Base";
		_zombiesA =     		{alive _x} count entities "zZombie_Base";
		
		_he1 =  (_humanity >= 5000); 
		_he2 =  (_humanity >= 10000);
		_he3 =  (_humanity >= 15000);
		_ban1 = (_humanity <= -2000); 
		_ban2 = (_humanity <= -6500);
		_ban3 = (_humanity <= -15000);
		if (_humanity > -2000) then
				{
		_level = "Stats\hu\survivor.paa";
		};
		if (_humanity < 5000) then
		{
		_level = "Stats\hu\survivor.paa";
		};
		if (_he1) then
		{
		_level = "Stats\hu\hero_1.paa"; //hero1
		};
		if (_he2) then
		{
		_level = "Stats\hu\hero_2.paa"; //hero2
		};
		if (_he3) then
		{
		_level = "Stats\hu\hero_3.paa"; //hero3
		};

		if (_ban1) then
		{
		_level = "Stats\hu\bandit_1.paa"; //bandit1
		};
			if (_ban2) then
		{
		_level = "Stats\hu\bandit_2.paa"; //bandit2
		};
			if (_nan3) then
		{
		_level = "Stats\hu\bandit_3.paa"; //bandit3
		};
		

		hintSilent parseText format 
			[
				"
				<t size='0.75' 	font='Bitstream'align='right'color='#FF0000'> %14</t>
				<br/>
				<t size='1'font='Bitstream'align='center' color='#FF0000'>BfV</t>
				<br/>
				<img size='5'align='Center' image='%25'/><br/>							      
				<t size='1'font='Bitstream' align='Center'color='#00FF00' >%15</t>			
				<br/>
				<img size='2'align='Center' image='%22'/><t size='1'font='Bitstream'align='Center'color='#FFFFFF'> %11</t> 
				<br/>
				<t size='1'font='Bitstream'align='left'color='#FFD072'>Blut</t><t size='1'font='Bitstream'align='right'color='#FF0000'>%1</t>
				<br/>
				<t size='1'	font='Bitstream'align='left'color='#FFD072'>Menschlichkeit</t><t size='1' font='Bitstream'align='right'color='#FF0000'> %2</t>		
				<br/>
				<img size='2'align='left' image='%21'/><t size='1' font='Bitstream'align='left'color='#FF0000'> %5</t><img size='2'align='center' image='%17'/><t size='1'	font='Bitstream'align='center'color='#FF0000'> %4</t><img size='2'align='right' image='%20'/><t size='1'font='Bitstream'align='right'color='#FF0000'> %3</t>				
				<br/>
	<img size='5'align='Center' image='%9'/>
	<br/>				
				<t size='1'font='Bitstream'align='center' color='#FF0000'>DayZ im Sauerland</t>
				<br/>							
				",
				
				
				
				r_player_blood,												//1
				round _humanity,											//2
				_killsH,													//3
				_killsB,													//4
				_kills,														//5
				_headShots,													//6
				(dayz_Survived),											//7
				(180-(round(serverTime/60))),								//8 change the 180 to suit your server mins for restarts
				_pic,														//9
				_logo,														//10
				_textCity,													//11
				count entities "zZombie_Base",								//12
				{alive _x} count entities "zZombie_Base",					//13
				diag_fps,													//14
				dayz_playerName,												//15
				_logo1,//16
				_logo2,//17
				_logo3,//18
				_logo4,//19
				_logo5,//20
				_logo6,//21
				_logo7,//22
				_logo8,//23
				_logo9,//24
				_level //25
				
			]; 
			sleep 5;
	};
};

[] spawn fnc_debug;