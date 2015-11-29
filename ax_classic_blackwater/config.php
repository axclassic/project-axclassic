<?

// Server Information
$serverName = 'AX Classic';
//$serverName = 'Classic 2012';

// Database Information:
$dbhost = 'localhost';
$dbuser = 'eq';
$dbpass = 'lansing222';
$db = 'ax_classic';
//$db = 'classic_2012';
/*  Limit zone lists to a specified expansion
 *  (i.e. setting $expansion_limit to 2 would cause only Classic and Kunark zones
 *  to appear in zone drop-down lists)
 *    1 = EQ Classic
 *    2 = Kunark
 *    3 = Velious
 *    4 = Luclin
 *    5 = Planes of Power
 *    6 = Legacy of Ykesha
 *    7 = Lost Dungeons of Norrath
 *    8 = Gates of Discord
 *    9 = Omens of War
 *    10 = Dragons of Norrath
 *    11 = Depths of Darkhollow
 *    12 = Prophecy of Ro
 *    13 = The Serpent's Spine
 *    14 = The Buried Sea
 *    15 = Shadows of Faydwer
 */
$expansion_limit = 10;

// Don't want to have to type the username and password every time you start the editor?
// Set the two variables below to the values you want to be in the form when you start it up.
// (default login: admin  pw: password)
//$login = 'admin';
//$password = 'valerian22';

// Log SQL queries:  1 = on, 0 = off
$logging = 1;

// $log_file = path to the file your sql logs will be saved in, if you have enabled sql logging
//    Make sure to create this directory and file before using the editor, or you will
//    get errors
$log_file = "logs/sql_log.sql";

?>