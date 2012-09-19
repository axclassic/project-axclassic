<head>
<style type =text/css>
BODY {
scrollbar-arrow-color : goldenrod; 
scrollbar-base-color : #000000; 
scrollbar-dark-shadow-color : #000000; 
scrollbar-face-color : #000000; 
scrollbar-highlight-color : silver; 
scrollbar-shadow-color : silver; 
scrollbar-3d-light-color : ;
scrollbar-track-color:#000000;
background-color: #000000;
background-image: url();
background-attachment: fixed;
color:#FFFFFF; 
font-style:None; 
font-family:Arial; 
font-weight:none;
font-size:13px;
text-decoration: ;
}

</style></head><body>
Login Server Information:<BR>
Login Server Name :Name of your loginserver<Br>
Registration URL: Url of registration Page<Br>
EQHost.txt Information: addressofls:5998<hr>
<?PHP
class DB

     {

        ///Declaration of variables



        var $host="localhost";

        var $user="wisler";

        var $password="cdered";

        var $persist=false;

        var $database="wisler_ls1";



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

	$db=new DB();
	$db->open();
		$query = "SELECT * FROM LSStats WHERE worldstatus = '1'";
		$result = $db->query($query);
		$num_results = $db->numRows($result);
		if ($DEBUG) echo $query . "<br>\n";
		if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
		echo ('<font size=+2>Legends Servers:<font>
		 <table width=100%><tr>
			<td valigh=top width=100%>World Name:</td>
			<td width=100%>Player Count</td>
			<td valigh=top width=100>Total Zones</td></tr><tr>
			<td>
			');
		for ($i=0; $i <$num_results; $i++)
		{
			$row = $db->fetchArray($result);
			$color = '<font color=#618c3c><B><i>';
			echo('<tr>
			<td>
			'.$color.'
			'.$row[worldname].'	
			</b></i></font></td>
						<td>'.$row[numplayers].'</td>
						<td>'.$row[numzones].'</td></tr>

            </td>
        </tr>
');
		}
		echo '</table><hr>';
		$query1 = "SELECT * FROM LSStats WHERE worldstatus = '2'";
		$result1 = $db->query($query1);
		$num_results1 = $db->numRows($result1);
		if ($DEBUG) echo $query1 . "<br>\n";
		if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
		echo ('<font size=+2>Prefered Servers:</font>
		 <table width=100%><tr>
			<td valigh=top width=100%>World Name:</td>
			<td width=100%>Player Count</td>
			<td valigh=top width=100>Total Zones</td></tr><tr>
			<td>
			');
		for ($i=0; $i <$num_results1; $i++)
		{
			$row1 = $db->fetchArray($result1);
			$color1 = '<font color=#618c3c><B><i>';
			echo('<tr>
			<td>
			'.$color1.'
			'.$row1[worldname].'	
			</b></i></font></td>
						<td>'.$row1[numplayers].'</td>
						<td>'.$row1[numzones].'</td></tr>

            </td>
        </tr>
');
		}
		echo '</table><hr>';
		$query2 = "SELECT * FROM LSStats WHERE worldstatus = '3'";
		$result2 = $db->query($query2);
		$num_results2 = $db->numRows($result2);
		if ($DEBUG) echo $query . "<br>\n";
		if ($DEBUG) echo('Invalid query: ' . mysql_error() . "<br>\n");
		echo ('<font size=+2>Standard Servers:</font>
		 <table width=100%><tr>
			<td valigh=top width=100%>World Name:</td>
			<td width=100%>Player Count</td>
			<td valigh=top width=100>Total Zones</td></tr><tr>
			<td>
			');
		for ($i=0; $i <$num_results2; $i++)
		{
			$row2 = $db->fetchArray($result2);
			$color2 = '<font color=#ffffff><B><i>';
			echo('<tr>
			<td>
			'.$color2.'
			'.$row2[worldname].'	
			</b></i></font></td>
						<td>'.$row2[numplayers].'</td>
						<td>'.$row2[numzones].'</td></tr>

            </td>
        </tr>
');
		}
		echo '</table><hr>';
		
	?></body>