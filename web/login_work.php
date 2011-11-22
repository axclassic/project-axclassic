<?PHP
error_reporting(E_ALL ^ E_NOTICE);
?>
<html>
<head>
<title>AX Classic</title>
<meta name="AUTHOR" content="Leslamarch, Angelox for AX Classic">
<meta name="CLASSIFICATION" content="Everquest, Emulator">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='icon' href='http://www.axclassic.com/favicon.ico' type='image/x-icon' />
<link rel='shortcut icon' href='http://www.axclassic.com/favicon.ico' type='image/xicon' />
<link rel="stylesheet" href="css/axclassic.css"></head>
</head>
<body style="background-image: url(images/bg_classic.jpeg);">
         <center>
           <img src="images/eq_main_women.gif" width="285" height="146" alt="axclassic.com" longdesc="http://axclassic.com">

		   <link rel="stylesheet" href="css/menu.css" type="text/css" />
<table id="cbinsmenuebul_table" width="0" cellpadding="0" cellspacing="0" border="0">
<tr>
  <td style="padding-right:1px" title=""><a href="index.php"target="_self"><img id="cbi_cbinsmenu_1" src="images/home1.gif" name="ebbcbinsmenu_1" width="86" height="26" border="0" alt="Home" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="login.php" target="_self"><img id="cbi_cbinsmenu_2" src="images/login2.gif" name="ebbcbinsmenu_2" width="86" height="26" border="0" alt="Login Accounts" title="" /></a></td>
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
        <td class="bordNewsCentreGauche" width="25" >&nbsp;</td>
        <td class="bordNewsCentre" width="570" bgcolor="#DFC597">
<div class="insidetext">
<!-- all Content Goes here PHP or HTML-->
<center>
<br>
<?PHP
$HTML = <<< EOF
</td>
        <td class="bordNewsCentreDroit"   width="26" >&nbsp;</td>
</tr>
<tr>
        <td class="stick"><img src="images/ll.gif" width="28" alt=""></td>
        <td class="bordNewsBasCentre" width="555">&nbsp;</td>
        <td class="stick"><img src="images/lr.gif"  width="25" alt=""></td>
</tr>              
<tr>
        <td colspan="3">
    <table style="width: 100%; margin-top: 1em">
        <td>
         
        </td>&nbsp;          
        </td>
        <td class="copyright">Copyright AXClassic.com All Rights reserved</td>
      </tr>
    </table>
</body>
</html>
EOF;
class DBLS
     {
    ///Declaration of variables
        var $host="localhost";
        var $user="eq";
        var $password="MyPassword";
        var $persist=false;
        var $database="new_login";
        var $conn=NULL;
        var $result=false;
        var $fields;
        var $check_fields;
        var $tbname;
        var $addNewFlag=false;
        ///End
        function addNew($table_name)
        {
           $this->fields=array();
           $this->addNewFlag=true;
           $this->tbname=$table_name;
        }

        function edit($table_name)
        {
           $this->fields=array();
           $this->check_fields=array();
           $this->addNewFlag=false;
           $this->tbname=$table_name;
        }

        function update()

        {

         foreach($this->fields as $field_name=>$value)
           $qry.=$field_name."='".$value."',";
         $qry=substr($qry,0,strlen($qry)-1);
          if($this->addNewFlag)
            $qry="INSERT INTO ".$this->tbname." SET ".$qry;
          else
          {
           $qry="UPDATE ".$this->tbname." SET ".$qry;
           if(count($this->check_fields)>0)
           {
               $qry.=" WHERE ";
               foreach($this->check_fields as $field_name=>$value)
                   $qry.=$field_name."='".$value."' AND ";
               $qry=substr($qry,0,strlen($qry)-5);
           }
          }
         return $this->query($qry);
        }

        function DB($host="",$user="",$password="",$dbname="",$open=false)
        {
         if($host!="")
            $this->host=$host;
         if($user!="")
            $this->user=$user;
         if($password!="")
            $this->password=$password;
         if($dbname!="")
            $this->database=$dbname;
         if($open)
           $this->open();
        }
        function open($host="",$user="",$password="",$dbname="") //
        {
         if($host!="")
            $this->host=$host;
         if($user!="")
            $this->user=$user;
         if($password!="")
            $this->password=$password;
         if($dbname!="")
            $this->database=$dbname;
         $this->connect();

         $this->select_db();

        }

        function set_host($host,$user,$password,$dbname)
        {
         $this->host=$host;
         $this->user=$user;
         $this->password=$password;
         $this->database=$dbname;
        }
        function affectedRows() //-- Get number of affected rows in previous operation
        {
         return @mysql_affected_rows($this->conn);
        }
        function close()//Close a connection to a  Server
        {
         return @mysql_close($this->conn);
        }
        function connect() //Open a connection to a Server
        {
          // Choose the appropriate connect function
          if ($this->persist)
              $func = 'mysql_pconnect';
          else
              $func = 'mysql_connect';
          // Connect to the database server
          $this->conn = $func($this->host, $this->user, $this->password);
          if(!$this->conn)
             return false;
        }
        function select_db($dbname="") //Select a databse
        {
          if($dbname=="")
             $dbname=$this->database;
          mysql_select_db($dbname,$this->conn);
        }
        function create_db($dbname) //Create a database
        {
          return @mysql_create_db($dbname,$this->conn);
        }
        function drop_db($dbname) //Drop a database
        {
         return @mysql_drop_db($dbname,$this->conn);
        }
        function data_seek($row) ///Move internal result pointer
        {
         return mysql_data_seek($this->result,$row);
        }
        function error() //Get last error
        {
            return (mysql_error());
        }
        function errorno() //Get error number
        {
            return mysql_errno();
        }
        function query($sql = '') //Execute the sql query
        {
            $this->result = @mysql_query($sql, $this->conn);
            return ($this->result != false);
        }
        function numRows() //Return number of rows in selected table
        {
            return (@mysql_num_rows($this->result));
        }
      function fieldName($field)
        {
           return (@mysql_field_name($this->result,$field));
        }
      function insertID()
        {
            return (@mysql_insert_id($this->conn));
        }
        function fetchObject()
        {
            return (@mysql_fetch_object($this->result, MYSQL_ASSOC));
        }
        function fetchArray()
        {
            return (@mysql_fetch_array($this->result));
        }
        function fetchAssoc()
        {
            return (@mysql_fetch_assoc($this->result));
        }
        function freeResult()
        {
            return (@mysql_free_result($this->result));
        }
        function fetchRow()
        {
            return (@mysql_fetch_row($this->result));
        }
        function tablesList()
        {
            return (@mysql_list_tables($this->result));
        }
     }
    $username = $_POST['username'];
    $email = $_POST['eadd'];
    $password1 = $_POST['password'];
    $password = md5($_POST['password']);
    $name = preg_replace ('/\s+/s', '_' , $username);
    $username1 = ereg_replace("[^a-z,A-Z,0-9,_,-,{,},*]","~" , $name);
    if (empty($username) or empty($password) or empty($email) or empty($password1)){
   echo '<font face="Times New Roman, Times, serif">';
   echo '<font color="#CC0000">';
   echo '<font size="2">';
   echo 'ATTENTION: ' . $_SERVER['REMOTE_ADDR'] . ' ! Please Fill in all Info and Try again. (for our protection your IP has been logged';
   echo '<br>';
   echo '<br>';
   echo $HTML;
   exit;}
      function check_new_user($username,$num_results)
   {
$db=new DBLS();
$db->open();
$query = "SELECT * FROM login_accounts where name = '$username'";
$result = $db->query($query);
$num_results = $db->numRows($result);
return $num_results;
}
function insert_new_user($username,$password){
$db=new DBLS();
$db->open();   
$query= "INSERT INTO login_accounts (name, password, user_active) VALUES ('$username', '$password', '1');";
$result = $db->query($query);         
   }
      $alreadyregged = check_new_user($username,$num_results);
      if ($alreadyregged > 0){
   echo '<font face="Times New Roman, Times, serif">';
   echo '<font color="brown">';
   echo '<font size="2">';
   echo 'We are sorry but you are trying to register a name that is already taken please click your browsers back button and try again';
   echo '<br>';
   echo '<br>';
   echo $HTML;
   exit;
}
else{
insert_new_user($name,$password);
   echo '<font face="Times New Roman, Times, serif">';
   echo '<font color="brown">';
   echo '<font size="2">';
   echo '<Center>Registration Successful! Thank you for joining our Server You may now open your Client and login with your new account.<BR>We hope you enjoy the game, for further assistance, you can contact us at the AXClassic forums. <BR></center><ul><li>USERNAME: ' . $name . '</li><li>EMAIL: ' . $email . '</li><li>PASSWORD: ' . $password1 . '</li></ul></font>';
   echo $HTML;
   /////////////////////// Send email after registration success \\\\\\\\\\\\\\\\\\\\\\
$to = "$email";

$from = "$stcfg[webmasteremail]";

$subject = "LoginServer Registration";

$headers = "From: $from\r\n" .
       'X-Mailer: PHP/' . phpversion() . "\r\n" .
       "MIME-Version: 1.0\r\n" .
       "Content-Type: text/html; charset=utf-8\r\n" .
       "Content-Transfer-Encoding: 8bit\r\n\r\n";
       
$message = "<BR><P>Dear $username, <BR><BR> Thanks for registering at $stcfg[SiteName]! We hope that you enjoy your time here and visit frequently below is your account information<P> <li> USERNAME: $username </li><li> PASSWORD: $password1 </li> <li>EMAIL Address: $email </li>\r\n\r\n";
// Send
mail($to, $subject, $message, $headers);
}
?> 