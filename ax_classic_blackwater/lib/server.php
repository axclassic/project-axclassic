<?
  
$sortby_choice = array(
  0  => "id",
  1  => "race",
  2  => "class",
  3  => "deityid",
  4  => "zoneid",
  5  => "itemid",
  6  => "item_charges",
  7  => "gm",
  8  => "slot");

$sortorder = array(
  0  => "ASC",
  1  => "DESC");
  
$bugstatus = array(
  0   => "Open",
  1   => "Corrected",
  2   => "Invalid",
  3   => "Moved",
);

$flags = array(
  0   => "None",
  1   => "Duplicate",
  2   => "Crash",
  3   => "Duplicate/Crash",
  4   => "Target",
  5   => "Duplicate/Target",
  6   => "Crash/Target",
  7   => "Duplicate/Crash/Target",
  8   => "Flags",
  9   => "Duplicate/Flags",
  10  => "Crash/Flags",
  11  => "Duplicate/Crash/Flags",
  12  => "Target/Flags",
  13  => "Duplicate/Target/Flags",
  14  => "Crash/Target/Flags",
  15  => "Duplicate/Crash/Target/Flags",
);

switch ($action) {
  case 0: 
    $body = new Template("templates/server/server.default.tmpl.php");
    break;
  case 1: // Preview Bugs
    check_authorization();
    $body = new Template("templates/server/bugs.tmpl.php");
    $body->set("bugstatus", $bugstatus);
    $bugs = get_bugs();
    if ($bugs) {
      foreach ($bugs as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
  case 2: // View Bugs
    check_authorization();
    $body = new Template("templates/server/bugs.view.tmpl.php");
    $body->set("bugstatus", $bugstatus);
    $body->set("flags", $flags);
    $bugs = view_bugs();
    if ($bugs) {
      foreach ($bugs as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
   case 3: // Update Bugs
    check_authorization();
    update_bugs();
    header("Location: index.php?editor=server&action=1");
    exit;
   case 4: // View Resolved Bugs
    $body = new Template("templates/server/bugs.resolved.tmpl.php");
    $body->set("bugstatus", $bugstatus);
    $bugs = get_bugs();
    if ($bugs) {
      foreach ($bugs as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
   case 5: // Delete Bugs
    check_authorization();
    delete_bugs();
    header("Location: index.php?editor=server&action=1");
    exit;
   case 6: // View Starting Items
    $body = new Template("templates/server/startitems.tmpl.php");
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);
    $body->set("inventory_slots", $inventory_slots);
    $startitems = get_startitems();
    if ($startitems) {
      foreach ($startitems as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
  case 7: // Edit Starting Items
    check_admin_authorization();
    $body = new Template("templates/server/startitems.edit.tmpl.php");
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);
    $body->set("inventory_slots", $inventory_slots);
    $startitems = startitems_info();
    if ($startitems) {
      foreach ($startitems as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
  case 8: // Update Starting Items
    check_admin_authorization();
    update_startitems();
    header("Location: index.php?editor=server&action=6");
    exit;
  case 9: // Delete Starting Items
    check_admin_authorization();
    delete_startitems();
    header("Location: index.php?editor=server&action=6");
    exit;
  case 10: // Get Starting Items ID (stitid)
    check_admin_authorization();
    $body = new Template("templates/server/startitems.add.tmpl.php");
    $body->set('suggeststitid', suggest_startitems_id());
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);
    $body->set("inventory_slots", $inventory_slots);
    break;
  case 11: // Add Starting Items
    check_admin_authorization();
    add_startitems();
    header("Location: index.php?editor=server&action=6");
    exit;
   case 12: // View Start Zones
 //  $startzones2=$startzones;
    $body = new Template("templates/server/startzones.tmpl.php");
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);
    $start_zones = get_start_zones();
    if ($start_zones) {
      foreach ($start_zones as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
  case 13: // Edit Start Zones
    check_admin_authorization();
    $body = new Template("templates/server/startzones.edit.tmpl.php");
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);
    $start_zones = start_zones_info();
    if ($start_zones) {
      foreach ($start_zones as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
  case 14: // Update Start Zones
    check_admin_authorization();
    update_start_zones_id();
    header("Location: index.php?editor=server&action=12");
    exit;
  case 15: // Delete Start Zones ID
    check_admin_authorization();
    delete_start_zones_id();
    header("Location: index.php?editor=server&action=12");
    exit;
  case 16: // Get Start Zone ID (start_id)
    check_admin_authorization();
    $body = new Template("templates/server/startzones.add.tmpl.php");
    $body->set('suggest_start_id', suggest_start_zones_id());
    $body->set("player_races", $player_races);
    $body->set("player_classes", $player_classes);
    $body->set("deities", $deities);
    $body->set("startzones", $startzones);

    break;
  case 17: // Add Start Zones Entry
    check_admin_authorization();
    add_start_zones_id();
    header("Location: index.php?editor=server&action=12");
    exit;
   case 18: // Preview Hackers
    check_admin_authorization();
    $body = new Template("templates/server/hackers.tmpl.php");
    $hackers = get_hackers();
    if ($hackers) {
      foreach ($hackers as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
   case 19: // Delete Hacker
    check_admin_authorization();
    delete_hacker();
    header("Location: index.php?editor=server&action=18");
    exit;
   case 20: // View Hacker
    check_admin_authorization();
    $body = new Template("templates/server/hackers.view.tmpl.php");
    $hackers = view_hackers();
    if ($hackers) {
      foreach ($hackers as $key=>$value) {
        $body->set($key, $value);
       }
     }
    break;
   case 21: // Preview Reports
    check_admin_authorization();
    $body = new Template("templates/server/reports.tmpl.php");
    $reports = get_reports();
    if ($reports) {
      foreach ($reports as $key=>$value) {
        $body->set($key, $value);
      }
    }
    break;
   case 22: // Delete Report
    check_admin_authorization();
    delete_report();
    header("Location: index.php?editor=server&action=20");
    exit;
   case 23: // View Report
    check_admin_authorization();
    $body = new Template("templates/server/reports.view.tmpl.php");
    $reports = view_reports();
    if ($reports) {
      foreach ($reports as $key=>$value) {
        $body->set($key, $value);
       }
     }
    break;

}

function get_bugs() {
  global $mysql;

  $query = "SELECT id, zone, name, ui, x, y, z, type, flag, target, bug, date, status FROM bugs";
  $result = $mysql->query_mult_assoc($query);
  if ($result) {
    foreach ($result as $result) {
     $array['bugs'][$result['id']] = array("bid"=>$result['id'], "zone"=>$result['zone'], "name"=>$result['name'], "ui"=>$result['ui'], "x"=>$result['x'], "y"=>$result['y'], "z"=>$result['z'], "type"=>$result['type'], "flag"=>$result['flag'], "target"=>$result['target'], "bug"=>$result['bug'], "date"=>$result['date'], "status"=>$result['status']);
         }
       }
  return $array;
  }

function view_bugs() {
  global $mysql;

  $bid = $_GET['bid'];

  $query = "SELECT id AS bid, zone, name, ui, x, y, z, type, flag, target, bug, date, status FROM bugs where id = \"$bid\"";
  $result = $mysql->query_assoc($query);
  
  return $result;
  }

function update_bugs() {
  global $mysql;

  $bid = $_POST['bid'];
  $status = $_POST['status'];

  $query = "UPDATE bugs SET status=\"$status\" WHERE id=\"$bid\"";
  $mysql->query_no_result($query);
}

function delete_bugs() {
  global $mysql;

  $bid = $_GET['bid'];

  $query = "DELETE FROM bugs WHERE id=\"$bid\"";
  $mysql->query_no_result($query);
}

function get_startitems() {
  global $mysql;
  
  
  $array = array();
  
  $query = "SELECT id, race, class, deityid, zoneid, itemid, item_charges, gm, slot FROM starting_items order by id";
  $result = $mysql->query_mult_assoc($query);
  if ($result) {
    foreach ($result as $result) {
     $array['startitems'][$result['id']] = array("stitid"=>$result['id'], "race"=>$result['race'], "class"=>$result['class'], "deityid"=>$result['deityid'], "zoneid"=>$result['zoneid'], "itemid"=>$result['itemid'], "item_charges"=>$result['item_charges'], "gm"=>$result['gm'], "slot"=>$result['slot']);
         }
       }
  return $array;
  }
    
function startitems_info() {
  global $mysql;

  $stitid = $_GET['stitid'];

  $query = "SELECT * FROM starting_items WHERE id=\"$stitid\"";
  $result = $mysql->query_assoc($query);
  
  return $result;
}
 
function update_startitems() {
  global $mysql;

  $stitid = $_POST['stitid'];
  $race = $_POST['player_races'];
  $class = $_POST['player_classes'];
  $deityid = $_POST['deities'];
  $zoneid = $_POST['startzones'];
  $itemid = $_POST['itemid'];
  $item_charges = $_POST['item_charges'];
  $gm = $_POST['gm']; 
  $slot = $_POST['inventory_slots'];
  
  $query = "UPDATE starting_items SET race=\"$race\", class=\"$class\", deityid=\"$deityid\", zoneid=\"$zoneid\", itemid=\"$itemid\", item_charges=\"$item_charges\", gm=\"$gm\", slot=\"$slot\" WHERE id=\"$stitid\"";
  $mysql->query_no_result($query);
}

function delete_startitems() {
  global $mysql;

  $stitid = $_GET['stitid'];

  $query = "DELETE from starting_items WHERE id=\"$stitid\"";
  $mysql->query_no_result($query);
} 

function suggest_startitems_id() {
  global $mysql;

  $query = "SELECT MAX(id) AS stitid FROM starting_items";
  $result = $mysql->query_assoc($query);
  
  return ($result['stitid'] + 1);
}

function add_startitems() {
  global $mysql;

  $stitid = $_POST['stitid'];
  $race = $_POST['player_races'];
  $class = $_POST['player_classes'];
  $deityid = $_POST['deities'];
  $zoneid = $_POST['startzones'];
  $itemid = $_POST['itemid'];
  $item_charges = $_POST['item_charges'];
  $gm = $_POST['gm']; 
  $slot = $_POST['inventory_slots'];

  $query = "INSERT INTO starting_items SET id=\"$stitid\", race=\"$race\", class=\"$class\", deityid=\"$deityid\", zoneid=\"$zoneid\", itemid=\"$itemid\", item_charges=\"$item_charges\", gm=\"$gm\", slot=\"$slot\"";
  $mysql->query_no_result($query);
}


function get_start_zones() {
  global $mysql;
  
  $array = array();
  
  $query = "SELECT id,x as start_x, y as start_y, z as start_z, zone_id, bind_id, player_choice, player_class, player_deity, player_race, start_zone, bind_x, bind_y, bind_z from start_zones order by id";
  $result = $mysql->query_mult_assoc($query);
  
  if ($result) {
    foreach ($result as $result) {
     $array['start_zones'][$result['id']] = array("start_id"=>$result['id'],"start_x"=>$result['start_x'],"start_y"=>$result['start_y'],"start_z"=>$result['start_z'],"zone_id"=>$result['zone_id'], "bind_id"=>$result['bind_id'], "player_choice"=>$result['player_choice'], "player_class"=>$result['player_class'], "player_deity"=>$result['player_deity'], "player_race"=>$result['player_race'], "start_zone"=>$result['start_zone'], "bind_x"=>$result['bind_x'], "bind_y"=>$result['bind_y'], "bind_z"=>$result['bind_z'], "select_rank"=>$result['select_rank']);
         }
       }
  return $array;
  }
function start_zones_info() {
  global $mysql;

  $start_id = $_GET['start_id'];

  $query = "SELECT id as start_id, x as start_x, y as start_y, z as start_z, zone_id, bind_id, player_choice, player_class, player_deity, player_race, start_zone, bind_x, bind_y, bind_z, select_rank from start_zones WHERE id=\"$start_id\"";
  $result = $mysql->query_assoc($query);
  
  return $result;
}

function delete_start_zones_id() {
  global $mysql;

  $start_id = $_GET['start_id'];

  $query = "DELETE from start_zones WHERE id=\"$start_id\"";
  $mysql->query_no_result($query);
} 

function suggest_start_zones_id() {
  global $mysql;

  $query = "SELECT MAX(id) AS start_id FROM start_zones";
  $result = $mysql->query_assoc($query);
  
  return ($result['start_id'] + 1);
}

function update_start_zones_id() {
  global $mysql;

  $start_id = $_POST['start_id'];
  $start_x = $_POST['start_x'];
  $start_y = $_POST['start_y'];
  $start_z = $_POST['start_z'];
  $zone_id = $_POST['zone_id'];
  $bind_id = $_POST['bind_id'];
  $player_choice = $_POST['player_choice'];
  $player_class = $_POST['player_class'];
  $player_deity = $_POST['player_deity'];
  $player_race = $_POST['player_race'];
  $start_zone = $_POST['start_zone'];
  $bind_x = $_POST['bind_x'];
  $bind_y = $_POST['bind_y'];
  $bind_z = $_POST['bind_z'];
  $select_rank = $_POST['select_rank'];
  
  $query = "UPDATE start_zones SET x=\"$start_x\", y=\"$start_y\", z=\"$start_z\", zone_id=\"$zone_id\", bind_id=\"$bind_id\", player_choice=\"$player_choice\", player_class=\"$player_class\", player_deity=\"$player_deity\", player_race=\"$player_race\", start_zone=\"$start_zone\", bind_x=\"$bind_x\", bind_y=\"$bind_y\", bind_z=\"$bind_z\", select_rank=\"$select_rank\" WHERE id=\"$start_id\"";
  $mysql->query_no_result($query);
}

function add_start_zones_id() {
  global $mysql;

  $start_id = $_POST['start_id'];
  $start_x = $_POST['start_x'];
  $start_y = $_POST['start_y'];
  $start_z = $_POST['start_z'];
  $zone_id = $_POST['zone_id'];
  $bind_id = $_POST['bind_id'];
  $player_choice = $_POST['player_choice'];
  $player_class = $_POST['player_class'];
  $player_deity = $_POST['player_deity'];
  $player_race = $_POST['player_race'];
  $start_zone = $_POST['start_zone'];
  $bind_x = $_POST['bind_x'];
  $bind_y = $_POST['bind_y'];
  $bind_z = $_POST['bind_z'];
  $select_rank = $_POST['select_rank'];
  
  $query = "INSERT INTO start_zones SET id=\"$start_id\", x=\"$start_x\", y=\"$start_y\", z=\"$start_z\", zone_id=\"$zone_id\", bind_id=\"$bind_id\", player_choice=\"$player_choice\", player_class=\"$player_class\", player_deity=\"$player_deity\", player_race=\"$player_race\", start_zone=\"$start_zone\", bind_x=\"$bind_x\", bind_y=\"$bind_y\", bind_z=\"$bind_z\", select_rank=\"$select_rank\"";
  $mysql->query_no_result($query);
}

function get_hackers() {
  global $mysql;

  $query = "SELECT id, account, name, hacked, zone, date FROM hackers limit 500";
  $result = $mysql->query_mult_assoc($query);
  if ($result) {
    foreach ($result as $result) {
     $array['hackers'][$result['id']] = array("hid"=>$result['id'], "account"=>$result['account'], "name"=>$result['name'], "hacked"=>$result['hacked'], "date"=>$result['date'], "zone"=>$result['zone']);
         }
       }
  return $array;
  }

function get_reports() {
  global $mysql;

  $query = "SELECT id, name, reported, reported_text FROM reports";
  $result = $mysql->query_mult_assoc($query);
  if ($result) {
    foreach ($result as $result) {
     $array['reports'][$result['id']] = array("rid"=>$result['id'], "name"=>$result['name'], "reported"=>$result['reported'], "reported_text"=>$result['reported_text']);
         }
       }
  return $array;
  }

function view_hackers() {
  global $mysql;

  $hid = $_GET['hid'];

  $query = "SELECT id AS hid, account, name, hacked, zone, date FROM hackers where id = \"$hid\"";
  $result = $mysql->query_assoc($query);
  
  return $result;
  }

function view_reports() {
  global $mysql;

  $rid = $_GET['rid'];

  $query = "SELECT id AS rid, name, reported, reported_text FROM reports where id = \"$rid\"";
  $result = $mysql->query_assoc($query);
  
  return $result;
  }
  
function delete_hacker() {
  global $mysql;

  $hid = $_GET['hid'];

  $query = "DELETE FROM hackers WHERE id=\"$hid\"";
  $mysql->query_no_result($query);
}

function delete_report() {
  global $mysql;

  $rid = $_GET['rid'];

  $query = "DELETE FROM reports WHERE id=\"$rid\"";
  $mysql->query_no_result($query);
}  
  
?>

