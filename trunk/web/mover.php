<html>
<head>
<title>AX Classic</title>
<meta name="AUTHOR" content="Leslamarch, Angelox for AX Classic">
<meta name="CLASSIFICATION" content="Everquest, Emulator">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='icon' href='http://www.axclassic.com/favicon.ico' type='image/x-icon' />
<link rel='shortcut icon' href='http://www.axclassic.com/favicon.ico' type='image/xicon' />
<link rel="stylesheet" href="css/axclassic.css"></head><body style="background-image: url(images/bg_classic.jpeg);">
</head>
<body>
         <center>
           <img src="images/eq_main_women.gif" width="285" height="146" alt="axclassic.com" longdesc="http://axclassic.com">

		   <link rel="stylesheet" href="css/menu.css" type="text/css" />
<table id="cbinsmenuebul_table" width="0" cellpadding="0" cellspacing="0" border="0">
<tr>
  <td style="padding-right:1px" title=""><a href="index.php"target="_self"><img id="cbi_cbinsmenu_1" src="images/home1.gif" name="ebbcbinsmenu_1" width="86" height="26" border="0" alt="Home" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="login.php" target="_self"><img id="cbi_cbinsmenu_2" src="images/login1.gif" name="ebbcbinsmenu_2" width="86" height="26" border="0" alt="Login Accounts" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="stats.php" target="_self"><img id="cbi_cbinsmenu_3" src="images/stats1.gif" name="ebbcbinsmenu_3" width="86" height="26" border="0" alt="Server stats" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="http://forums.axclassic.com" target="_blank" ><img id="cbi_cbinsmenu_4" src="images/forum1.gif" name="ebbcbinsmenu_4" width="86" height="26" border="0" alt="forum" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="http://axclassic.com/mediawiki" target="_blank"><img id="cbi_cbinsmenu_5" src="images/wiki1.gif" name="ebbcbinsmenu_5" width="86" height="26" border="0" alt="WIKI" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="mover.php" target="_self"><img id="cbi_cbinsmenu_6" src="images/mover2.gif" name="ebbcbinsmenu_6" width="86" height="26" border="0" alt="Mover" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="ladder.php" target="_self"><img id="cbi_cbinsmenu_7" src="images/ladder1.gif" name="ebbcbinsmenu_7" width="86" height="26" border="0" alt="Ladder" title="" /></a></td>
</tr>
</table>
<script type="text/javascript" src="css/cbjscbinsmenu.js"></script>
		 
		 </center> 
<table align="center" border="0" cellspacing="0" cellpadding="0">     
<tr>
        <td class="stick"><img src="images/ul.gif" width="28" alt=""></td>
        <td class="bordNewsHautCentre" width="560">&nbsp;</td>
        <td class="stick"><img src="images/ur.gif"  width="25" alt=""></td>
</tr>
<tr>
        <td class="bordNewsCentreGauche" width="28" >&nbsp;</td>
        <td class="bordNewsCentre" width="560" bgcolor="#DFC597">
<div class="insidetext">

<!-- all content Goes here PHP or HTML-->
<br>


<?php
if (!ISSET($_POST['action'])) {
?>
<FORM ACTION="mover.php?action=process" METHOD="post">
<table width='300' cellpadding='0' cellspacing='2' border='0' align='center' >
	<tr>
	</tr>
	<tr>
		<td colspan=2>&nbsp </td>
	</tr>
	<tr>
		<td colspan=2><INPUT TYPE="hidden" NAME="s_id" value=<?php echo "\"".session_id()."\""; ?>></td>
	</tr>
	<tr>
		<td colspan=2><INPUT TYPE="hidden" NAME="action" value="process"></td>
	</tr>
	<tr>
		<td><b><font size="-1">LoginServer Username: </font></b></td>
		<td><font color="#000080"><INPUT TYPE="text" NAME="lsusername" ></font></td>
	</tr>
	<tr>
		<td><b><font size="-1">Character Name: </font></b></td>
		<td><font color="#000080"><INPUT TYPE="text" NAME="charname" ></font></td>
	</tr>
	<tr>
		<td colspan=2>&nbsp </td>
	</tr>
	<tr>
		<td colspan='2' align='center'><INPUT TYPE="submit" NAME="SUBMIT" VALUE="Next..."></td>
	</tr>
</table>
  </form>
<?php
} else {
   if ($_POST['action'] == 'process') {
        if (session_id() != $_POST['s_id']) {
                echo "Session IDs do not match!  Aborting...";
                echo "<a href=\"mover.php\">Go back</a>";
                exit;
        }

	$lsusername = strtolower($_POST['lsusername']);
	$charname = strtolower($_POST['charname']);
	$zonename = "load";

        $mhost = 'localhost';
        $muser = 'eq';
        $mpass = 'MyPassword';
        $mdb = 'ax_classic';

        // Connects to database
    $link = mysql_connect($mhost, $muser, $mpass) or die (mysql_error());
    mysql_select_db($mdb, $link) or die (mysql_error());

###Character Query###
    $query =  "SELECT account_id,name FROM character_ WHERE name='$charname'";
    $cresult = mysql_query($query);
    if (mysql_num_rows($cresult) != 1) {
             echo "<center>Character Name Incorrect!  Aborting...";
             echo "<a href=\"mover.php\">Go back</a>";
	     echo '<br>';
     } else {
while ($char = mysql_fetch_array($cresult)) {
        $account_id = $char['account_id'];
        $ccharname = $char['name'];

###LoginServer Query###
    $query2 =  "SELECT id,name FROM account WHERE id='$account_id'";
    $lsresult = mysql_query($query2);
    if (mysql_num_rows($lsresult) != 1) {
             echo "LoginServer Data Incorrect!  Aborting...";
             echo "<a href=\"mover.php\">Go back</a>";
     } else {
while ($ls = mysql_fetch_array($lsresult)) {
        $id = $ls['id'];
        $lsname = strtolower($ls['name']);

###Zone Query###
    $query3 =  "SELECT * FROM zone WHERE short_name like '$zonename'";
    $zresult = mysql_query($query3);
    if (mysql_num_rows($zresult) != 1) {
             echo "Zone Data Incorrect!  Aborting...";
             echo "<a href=\"mover.php\">Go back</a>";
     } else {
while ($zid = mysql_fetch_array($zresult)) {
        $short_name = $zid['short_name'];
        $long_name = $zid['long_name'];
        $zoneidnumber = $zid['zoneidnumber'];

    if  ($lsusername != $lsname) {
             echo "<font color='#8A0808'><b>Incorrect Data Entered!</font></b><br>"; 
             echo "WARNING - Your usename and character entries are case sensitive!<br>";
             echo "You must type in info exactly as you registered it.<br>";
             echo "This session has been logged! Aborting...<br><br>";
             echo "<a href=\"mover.php\">Go back</a> <br>";
	    //echo $lsusername;
	    // echo $lsname;
     } else {
?>
<FORM ACTION="?action=postdata" METHOD="post">
<table width='300' cellpadding='0' cellspacing='2' border='0' align='center'>
<tr bgcolor="#006600">
	<td colspan=2 align="center">
		<font size="+2" color='#ffffff'><b>STEP 2 OF 3</B></font>
	</td>
</tr>
<tr>
	<td colspan=2><INPUT TYPE="hidden" NAME="s_id" value=<?php echo "\"".session_id()."\""; ?>></td>
</tr>
<tr>
	<td colspan=2><INPUT TYPE="hidden" NAME="action" value="postdata"></td>
</tr>
<tr>
	<td colspan=2>&nbsp </td>
</tr>
<tr>
	<td colspan=2>
		<INPUT TYPE="hidden" NAME="lsusername" value=<?php echo "\"".$lsusername."\""; ?>>
		<INPUT TYPE="hidden" NAME="charname" value=<?php echo "\"".$charname."\""; ?>>
		<INPUT TYPE="hidden" NAME="zoneid" value=<?php echo "\"".$zoneidnumber."\""; ?>>
	</td>
</tr>
<tr>
	<td><b>LoginServer Name: </b></td>
	<td>Confirmed: <? echo $lsname; ?></td>
</tr>
<tr>
	<td><b>Character Name: </b></td>
	<td>Confirmed: <? echo $ccharname; ?></td>
</tr>
<tr>
	<td><b>Zone Name: </b></td>
	<td>Confirmed Zone: <? echo $zonename; ?>, <? echo $long_name; ?></td>
</tr>
<tr>
	<td colspan=2><input type=submit value="DO IT!"></td>
</tr>
</table>
</form>
</center>
<?php
}}}
}
}
}
} // end step 2
   } else {
        if (session_id() != $_POST['s_id']) {
                echo "Session IDs do not match!  Aborting...";
                echo "<a href=\"index.php\">Go back</a>";
                exit;
        }
	$lsusername = ($_POST['lsusername']);
	$charname = ($_POST['charname']);
        $zoneid = 184;
	$zone = "load";

        $mhost = 'Localhost';
		$muser = 'eq';
		$mpass = 'MyPassword';
        $mdb = 'ax_classic';


        // Connects to database
    $link = mysql_connect($mhost, $muser, $mpass) or die (mysql_error());
    mysql_select_db($mdb, $link) or die (mysql_error());
  $query = "UPDATE character_ SET zonename='$zone',zoneid=$zoneid,x=-316,y=5,z=8.2 WHERE name='$charname'";
    $result = mysql_query($query);
    if (!$result) {
            echo "Update  Error";
             echo "<a href=\"mover.php\">Go back</a>";
             exit;
     }


?>
<table width='300' cellpadding='0' cellspacing='2' border='0' align='center'>
<tr>
	<td colspan=2 bgcolor='#006600' align="center">
		<font size="+2" color='ffffff'><b>    STEP 3 OF 3</B></font>
	</td>
</tr>
<tr>
	<td> <?echo $charname; ?> has been moved to <? echo $zone; ?></td>
</tr>
</table>
<a href="index.php">Back</a> 
<?php
}
}
?>


<!-- all content Goes here PHP or HTML-->
<br>
</td>
        <td class="bordNewsCentreDroit"   width="25" >&nbsp;</td>
</tr>
<tr>
        <td class="stick"><img src="images/ll.gif" width="28" alt=""></td>
        <td class="bordNewsBasCentre" width="560">&nbsp;</td>
        <td class="stick"><img src="images/lr.gif"  width="25" alt=""></td>
</tr>              
<tr>
        <td colspan="3">
    <table style="width: 100%; margin-top: 1em">
        <tr>
        <td>
        
        </td>&nbsp;        <td class="copyright">Copyright AXClassic.com All Rights reserved</td>
      </tr>
    </table>
  </td>
</tr>
</table>
</div>
</body>
</html>      

