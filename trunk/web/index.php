<?php
/******************************************************************************
* POST SYNDICATION SCRIPT by chAos
*
* A very basic script that pulls threads with the first post from the database
* and puts them into an array form so you can use them as you like.
*
* For use with phpBB3, freely distributable
*
******************************************************************************/
/** Notes:
*
* - Attachments haven't been handled properly.
* - Starts a forum session as Guest user, taking all the default values for time, bbcode style (from theme), etc
* - While viewing this page, users will appear to be viewing the Forum Index on viewonline.php.  
*   This can't be helped without modifying other code which is beyond this
*
*/
//////////////////////////////////////
define('FORUM_ID', 35);                    // Forum ID to get data from
define('POST_LIMIT', 11);                  // How many to get
define('PHPBB_ROOT_PATH', '/var/www/html/forums/');   // Path to phpBB (including trailing /)
define('PRINT_TO_SCREEN', true);         
         // If set to true, it will print the posts out
         // If set to false it will create an array $news[] with all the following info
         //
         //   'topic_id'         eg. 119
         //   
         //   'topic_time'      eg. 06 June, 07 (uses board default)
         //   'topic_replies'      eg. 26
         //   
         //   'username'         eg. chAos
         //   'topic_title'      eg. "News Post"
         //   
         //   'post_text'         eg. just the text (formatted w/ smilies, bbcode, etc)
//
//////////////////////////////////////
define('IN_PHPBB', true);
$phpbb_root_path = PHPBB_ROOT_PATH;
$phpEx = substr(strrchr(__FILE__, '.'), 1);
include($phpbb_root_path . 'common.' . $phpEx);
include($phpbb_root_path . 'includes/functions_display.' . $phpEx);
include($phpbb_root_path . 'includes/bbcode.' . $phpEx);
// Start session management
$user->session_begin(false);
$auth->acl($user->data);
// Grab user preferences
$user->setup();
?>
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
  <td style="padding-right:1px" title=""><a href="index.php"target="_self"><img id="cbi_cbinsmenu_1" src="images/home2.gif" name="ebbcbinsmenu_1" width="86" height="26" border="0" alt="Home" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="login.php" target="_self"><img id="cbi_cbinsmenu_2" src="images/login1.gif" name="ebbcbinsmenu_2" width="86" height="26" border="0" alt="Login Accounts" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="stats.php" target="_self"><img id="cbi_cbinsmenu_3" src="images/stats1.gif" name="ebbcbinsmenu_3" width="86" height="26" border="0" alt="Server stats" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="http://forums.axclassic.com" target="_blank" ><img id="cbi_cbinsmenu_4" src="images/forum1.gif" name="ebbcbinsmenu_4" width="86" height="26" border="0" alt="forum" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="http://axclassic.com/mediawiki" target="_blank"><img id="cbi_cbinsmenu_5" src="images/wiki1.gif" name="ebbcbinsmenu_5" width="86" height="26" border="0" alt="WIKI" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="mover.php" target="_self"><img id="cbi_cbinsmenu_6" src="images/mover1.gif" name="ebbcbinsmenu_6" width="86" height="26" border="0" alt="Mover" title="" /></a></td>
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

<!-- all tontent Goes here PHP or HTML-->
<br>
<?php
$query =
"SELECT u.user_id, u.username, t.topic_title, t.topic_poster, t.forum_id, t.topic_id, t.topic_time, t.topic_replies, t.topic_first_post_id, p.poster_id, p.topic_id, p.post_id, p.post_text, p.bbcode_bitfield, p.bbcode_uid 
FROM ".USERS_TABLE." u, ".TOPICS_TABLE." t, ".POSTS_TABLE." p 
WHERE u.user_id = t.topic_poster 
AND u.user_id = p.poster_id 
AND t.topic_id = p.topic_id 
AND p.post_id = t.topic_first_post_id 
AND t.forum_id = ".FORUM_ID." 
ORDER BY t.topic_time DESC";
$result = $db->sql_query_limit($query, POST_LIMIT);
$posts = array();
$news = array();
$bbcode_bitfield = '';
$message = '';
$poster_id = 0;
while ($r = $db->sql_fetchrow($result))
{
   $posts[] = array(
         'topic_id' => $r['topic_id'],
         'topic_time' => $r['topic_time'], 
         'username' => $r['username'], 
         'topic_title' => $r['topic_title'], 
         'post_text' => $r['post_text'],
         'bbcode_uid' => $r['bbcode_uid'],
         'bbcode_bitfield' => $r['bbcode_bitfield'],
         'topic_replies' => $r['topic_replies'],
         );
   $bbcode_bitfield = $bbcode_bitfield | base64_decode($r['bbcode_bitfield']);
}
// Instantiate BBCode
if ($bbcode_bitfield !== '')
{
   $bbcode = new bbcode(base64_encode($bbcode_bitfield));
}
// Output the posts
foreach($posts as $m)
{
   $poster_id = $m['user_id'];
   $message = $m['post_text'];
   if($m['bbcode_bitfield'])
   {
      $bbcode->bbcode_second_pass($message, $m['bbcode_uid'], $m['bbcode_bitfield']);
   }

   $message = str_replace("\n", '<br />', $message);
   $message = smiley_text($message);
   $comment = ($m['topic_replies']==1) ? 'comment' : 'comments';
   if( PRINT_TO_SCREEN )
   {
      /* Output is in the following format
       *
       * <h3>Thread Title</h3>
       ^ <h4 class="postinfo">date // 5 comments // poster</h4>
       * <p>First post test</p>
       * 
       */
      echo '<font face="Times New Roman, Times, serif">';
      echo '<font color="black">';
      echo '<font size="3">';
      echo '<span style=font-weight:bold>';
      echo "{$m['topic_title']} <br></font>";
      echo '<font face="Times New Roman, Times, serif">';
      echo '<font color="black">';
      echo '<font size="1">';
      echo "\n<class=\"postinfo\">".$user->format_date($m['topic_time']); echo '<font color="blue">'; echo " by {$m['username']}";
      echo '<font color="brown">';
      echo '<font size="2">';
      echo "\n<p>{$message}</p>";
	  echo "\n<p><hr /></p>";
   }
   else
   {
      $news[] = array(
            'topic_id' => $m['topic_id'], // eg: 119
            'topic_time' => $user->format_date($m['topic_time']), // eg: 06 June, 07 (uses board default)
            'topic_replies' => $m['topic_replies'], // eg: 26
            'username' => $m['username'], // eg: chAos
            'topic_title' => $m['topic_title'], // eg: "News Post"
            'post_text' => $message, // just the text         
            );
   }
   unset($message,$poster_id);
}
?>
<!-- all tontent Goes here PHP or HTML-->
<br>
</td>
        <td class="bordNewsCentreDroit"   width="25" >&nbsp;</td>
</tr>
<tr>
        <td class="stick"><img src="images/ll.gif" width="28" alt=""></td>
        <td class="bordNewsBasCentre" width="561">&nbsp;</td>
        <td class="stick"><img src="images/lr.gif"  width="25" alt=""></td>
</tr>              
<tr>
        <td colspan="3">
    <table style="width: 100%; margin-top: 1em">
        <tr>
        <td>
        
        </td>&nbsp;
        <td class="copyright">Copyright AXClassic.com All Rights reserved</td>
      </tr>
    </table>
  </td>
</tr>
</table>
</div>
<br>
</body>
</html>      

