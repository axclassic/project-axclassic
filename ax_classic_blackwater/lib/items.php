<?

switch ($action) {
  case 0: //View Item
    if ($itemid) {
      $body = new Template("templates/items/items.tmpl.php");
      $body->set('itemid', $itemid);
      $body->set("yesno", $yesno);
      $vars = item_info();
      if ($vars) {
        foreach ($vars as $key=>$value) {
          $body->set($key, $value);
          } 
        }
      }
      
    else {
      $body = new Template("templates/items/items.default.tmpl.php");
      }
    break;
  case 1: //Edit Item
  case 2: //Delete Item
  case 3: //Add Item
  case 4: //Suggest Item ID
  case 5: //Copy Items
  case 6: //Search Items
    $body = new Template("templates/items/items.searchresults.tmpl.php");
  if (isset($_GET['itemid']) && $_GET['itemid'] != "ID") {
    $results = searchItemsByID();
  }
 else $results = search_items();
    
  $body->set("results", $results);
  break;
  
    
}

function item_info() {
  global $mysql, $itemid;
  
  $query = "SELECT * from items where ID=$itemid";
  $result = $mysql->query_assoc($query);
  return $result;
}

