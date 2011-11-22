<?php
    $title = "Edit News";
    include("../includes/header.php");
    include("../includes/database.php");
    $done = false;
    $expected = array('newstitle', 'newscontent', 'id');
    if ($_GET && !$_POST) { 
    	if (isset($_GET['id']) && is_numeric($_GET['id'])) { 
    		$id = $_GET['id']; 
    	} 
    	else { 
    		$id = NULL; 
    	} 
    	if ($id) { 
    		$sql = "SELECT * FROM news WHERE id = $id"; 
    		$result = mysql_query($sql) or die ("Error connecting to database..."); 
    		$row = mysql_fetch_assoc($result);
    	} 
    	// if form has been submitted, update record 
    	if (array_key_exists('update', $_POST)) { 
    		// prepare expected items for insertion into database 
    		foreach ($_POST as $key => $value) { 
    			if (in_array($key, $expected)) { 
    				${$key} = mysql_real_escape_string($value); 
    			} 
    		} 
    		// abandon the process if primary key invalid 
    		if (!is_numeric($id)) { 
    			die('Invalid request'); 
    		}
    		// prepare the SQL query 
    		$query = "UPDATE news SET title = '$title', content = '$content' WHERE id = $id"; 
    		// submit the query 
    		$done = mysql_query($query) or die("Error connecting to database..."); 
    	}
    }
    // redirect page if $id is invalid 
    if ($done) { 
    	header("Location: $ROOT/admin/listnews.php"); 
    	exit; 
    }
?>