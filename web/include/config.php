<?php
$config['mysql_host'] = 'localhost'; //MySQL Host
$config['mysql_user'] = 'eq'; //MySQL Username
$config['mysql_pass'] = 'MyPassword'; //MySQL Password
$config['mysql_dbname'] = 'new_login'; //Database Name

$config['mysql_realmd'] = 'new_login';	    // The realmd DB. Default: realmd
$config['mysql_mangos'] = 'new_login';	    // The MaNGOS DB. Default: mangos
$config['game_port'] = '3306';		    // The webpage port. Default: 8085

/*Online Player Map */
	$time= "60";							// Update time (seconds), 0 - not update.
	$show_time="0";							// Show update timer 1 - on, 0 - off
	$img_base = "../images/";				// Location where images are stored (web or local)
	$SQL_ZoneIDs = "1";						// Lookup Zones in MySQL
?>