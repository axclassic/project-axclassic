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
  <td style="padding-right:1px" title=""><a href="mover.php" target="_self"><img id="cbi_cbinsmenu_6" src="images/mover1.gif" name="ebbcbinsmenu_6" width="86" height="26" border="0" alt="Mover" title="" /></a></td>
  <td style="padding-right:1px" title=""><a href="ladder.php" target="_self"><img id="cbi_cbinsmenu_7" src="images/ladder2.gif" name="ebbcbinsmenu_7" width="86" height="26" border="0" alt="Ladder" title="" /></a></td>
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

<?PHP
error_reporting(E_ALL ^ E_NOTICE);
class DBHZ
     {
    ///Declaration of variables
        var $host="localhost";
        var $user="eq";
        var $password="MyPassword";
        var $persist=false;
        var $database="ax_classic";

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
        function affectedRows() 
        {
         return @mysql_affected_rows($this->conn);
        }
        function close()
        {
         return @mysql_close($this->conn);
        }
        function connect()
        {
          
          if ($this->persist)
              $func = 'mysql_pconnect';
          else
              $func = 'mysql_connect';
          
          $this->conn = $func($this->host, $this->user, $this->password);
          if(!$this->conn)
             return false;
        }
        function select_db($dbname="") 
        {
          if($dbname=="")
             $dbname=$this->database;
          mysql_select_db($dbname,$this->conn);
        }
        function create_db($dbname) 
        {
          return @mysql_create_db($dbname,$this->conn);
        }
        function drop_db($dbname) 
        {
         return @mysql_drop_db($dbname,$this->conn);
        }
        function data_seek($row) 
        {
         return mysql_data_seek($this->result,$row);
        }
        function error() 
        {
            return (mysql_error());
        }
        function errorno() 
        {
            return mysql_errno();
        }
        function query($sql = '') 
        {
            $this->result = @mysql_query($sql, $this->conn);
            return ($this->result != false);
        }
        function numRows() 
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
?>
<?PHP
  $dbhz=new DBHZ();
   $dbhz->open();
	  $color = '<font color=#ffffff size=2><B><i>';
       $query = "SELECT charname, petitiontext FROM petitions ORDER BY senttime DESC";
	  $result = $dbhz->query($query);
      $num_results = $dbhz->numRows($result);
      if ($DEBUG) echo $query . "<br>\n";
      if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
echo ('<br><div style="text-align: center; font-weight: bold;"><big>Legacy of the Rathe Server Player Petitions</big></div>');
echo ('<br><br><hr style="width: 100%; height: 2px;"');
      /*echo ('<center><img src="images/ladder.gif" width="284" height="61" alt="axclassic.com" longdesc="http://axclassic.com"></center></b>
         ');*/
echo '<br><br>';
      for ($i=0; $i <$num_results; $i++)
      {
         $row = $dbhz->fetchArray($result);
         $color = '<font color=#618c3c size=3><B><i>';
         
         echo('<B><center><font size=2><i><font face="Times New Roman, Times, serif">'.$row['name'].'  </center></font></i>');
$HTML = <<< EOF
<table
style="text-align: left; width: 575px; margin-left: auto; margin-right: auto; height: 75px;"
border="0" cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td style="vertical-align: top; width: 20%;"><font size="1"><font
color="#336600">Character: <font color="#990000">$row[charname] </font></td>
<td style="vertical-align: top; text-align: left; width: 60%;"><font
size="1"><font color="#336600">Petition: <i><font color="#660066">
$row[petitiontext]</font></i></td>
</tr>
</tbody>
</table>
EOF;
   echo $HTML;
		// echo('<P ALIGN="CENTER"><font size=1>Current Level: '.$row[level].' </P></font>');
		// echo('<P ALIGN="RIGHT"> <font size=1>Current Zone: '.$row[zonename].'  </P></font>');
      echo "\n<p><hr /></p>";
	  }
?>
<!-- all tontent Goes here PHP or HTML-->
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

