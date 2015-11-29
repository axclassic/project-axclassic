      <div class="table_container" style="width:750px;">
        <div class="table_header">
          Item Search Results
        </div>
        <div class="table_content">
        <table class="table_content2" width="100%">
<?if($results != ''):?>
 <td align="center" width="20%"><strong>ID</strong></td>
          <td align="center" width="40%"><strong>Item Name</strong></td>
          <td align="center" width="40%"><strong>Item Lore</strong></td>
<?foreach($results as $result): extract($result);?>
          <tr>
            <td align="center" width="20%"><a href="index.php?editor=items&itemid=<?=$id?>"><?=$id?></a></td>
            <td align="center" width="40%"><?=$name?></td>
            <td align="center" width="40%"><?=$lore?></td>
          </tr>
<?endforeach;?>
  </table>
<?endif;?>
<?if($results == ''):?>
          Your search produced no results!
<?endif;?>
        </div>
      </div>