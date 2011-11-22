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
  <td style="padding-right:1px" title=""><a href="stats.php" target="_self"><img id="cbi_cbinsmenu_3" src="images/stats2.gif" name="ebbcbinsmenu_3" width="86" height="26" border="0" alt="Server stats" title="" /></a></td>
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

<!-- all content Goes here PHP or HTML-->
<center>
<?php
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
?>
<font face="Times New Roman, Times, serif">
<font color="black"><font size="3">
<?php
function acctcnt2(){
      $dbls=new DBLS();
        $dbls->open();
        $query = "SELECT * FROM login_accounts";
        $acccnt = $dbls->query($query);
      $accts = $dbls->numRows('$acctcnt');
      if(!isset($accts)){$accts = '0';}
      echo '<font size="2">';
      echo 'Total Accounts: <B>';
      echo $accts;

    }
    echo acctcnt2();
    echo '</b><font size="2">';
    echo '<center>Current Online Worlds</center>';
    echo '<hr>';
?>
<?php
function prefered(){
   $dbls=new DBLS();
   $dbls->open();
   $DEBUG ='';
      $query = "SELECT * FROM stats_worldservers WHERE greenname = '1'";
      $result = $dbls->query($query);
      $num_results = $dbls->numRows($result);
     if ($DEBUG) echo $query . "<br>\n";
      if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
      //echo '<font color=#CCFF66>';
      echo ('<center><font size=1><B>Prefered Servers:</center></font></b><br>
       <table width=90%><tr>
         <td valigh=top width=91%><font size=2>&nbsp;&nbsp;Server:</center></font></td>
         <td width=100%><font size=2>Players</center></font></td>
         <td valigh=top width=100>&nbsp;<font size=2>Status</center></font></td></tr><tr>
         <td>
         ');
      for ($i=0; $i <$num_results; $i++)
      {
         $row = $dbls->fetchArray($result);
         $color = '<font color=#0B3B0B size=2><i>&nbsp';
         $name = $row['worldname'];
	 $players = $row['numplayers'];
	 $znums = $row['numzones'];
	if ($znums > 1) {
	 $zstatus = 'up';
	}
	if ($znums < 1) {
	 $zstatus = locked;
	}
          //$find2 = array ('/[[]/', '/[]]/', '/[0.8.0]/', '/0.8.0/', '/Server/'); 
          $find2 = array ('/\[0.6.0\]/','/\[0.7.0\]/','/\[0.8.0\]/', '/Server/'); 
            $replace1 ="";
            $worldname = preg_replace ($find2, $replace1, $name);
         echo('<tr>
         <td>
         '.$color.'
         '.$worldname.'   
         </i></center></font></td>
                  <td><center><font size=2><font color=#CC0033><i>'.$players.'</center></font></td></i>
                  <td><center><font size=2><font color=#0B610B><i>'.$zstatus.'</center></font></td></tr></i>

            </td>
        </tr>
');
      }
      echo '</table><hr>';
   }
   function standard(){
   $dbls=new DBLS();
   $dbls->open();
   $DEBUG ='';
      $query2 = "SELECT * FROM stats_worldservers WHERE greenname = '0'";
      $result2 = $dbls->query($query2);
      $num_results2 = $dbls->numRows($result2);
      if ($DEBUG) echo $query . "<br>\n";
      if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
      echo ('<center><font size=1><B>Standard Servers:</center></font></b><br>
       <table width=90%><tr>
         <td valigh=top width=91%><font size=2>&nbsp;&nbsp;Server:</center></font></td>
         <td width=100%><font size=2>Players</center></font></td>
         <td valigh=top width=100>&nbsp;<font size=2>Status</center></font></td></tr><tr>
         <td>
         ');
      for ($i=0; $i <$num_results2; $i++)
      {
         $row2 = $dbls->fetchArray($result2);
         $color2 = '<font color=#000066 size=2><i>&nbsp;';
         $name = $row2['worldname'];
	 $znums2 = $row2['numzones'];
	if ($znums2 > 1) {
	 $zstatus2 = 'up';
	}
	if ($znums2 < 1) {
	 $zstatus2 = locked;
	}
         $find2 = array ('/[[]/', '/[]]/', '/[0.8.0]/', '/0.8.0/', '/Server/'); 
            $replace1 ="";
            $worldname = preg_replace ($find2, $replace1, $name);
         echo('<tr>
         <td>
         '.$color2.'
         '.$worldname.'   
         </i></center></font></td>
                  <td><center><font size=2><font color=#CC0033><i>'.$row2['numplayers'].'</center></font></td></i>
                  <td><center><font size=2><font color=#0B610B><i>'.$zstatus2.'</center></font></td></tr></i>

            </td>
        </tr>
');
      }
echo '</table><hr>';
}
echo prefered();
echo standard();
?>
</center>
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

