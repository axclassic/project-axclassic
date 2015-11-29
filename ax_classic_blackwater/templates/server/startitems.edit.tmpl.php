<div class="edit_form" style="width: 750px">
      <div class="edit_form_header">
        Edit Starting Items <?=$id?>
      </div>

      <div class="edit_form_content">
        <form name="edit_starting_items" method="post" action="index.php?editor=server&action=8">
        <table width="100%">
          <tr>
            <td align="center" width="25%"><STRONG>Race</STRONG></td>
            <td align="center" width="25%"><STRONG>Class</STRONG></td>
            <td align="center" width="25%"><STRONG>Deity</STRONG></td>
            <td align="center" width="25%"><STRONG>Zone</STRONG></td>         
          </tr>
          <tr>
            <td align="center" width="25%">
            <select name="player_races">
              <?foreach($player_races as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $race)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%">
            <select name="player_classes">
              <?foreach($player_classes as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $class)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%">
              <select name="deities">
                <?foreach($deities as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $deityid)? " selected" : "";?>><?=$value?></option>
                <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%">
            <select name="startzones">
              <?foreach($startzones as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $zoneid)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            
            </td>
    
           </tr>
           
           <tr>
            <td align="center" width="25%"><STRONG>Item ID</STRONG></td>
            <td align="center" width="25%"><STRONG>Item Charges</STRONG></td>
            <td align="center" width="25%"><STRONG>GM Only</STRONG></td>
            <td align="center" width="25%"><STRONG>Slot</STRONG></td> 
           </tr>
           <tr>
            <td align="center" width="25%"><input type="text" size="7" name="itemid" value="<?=$itemid?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="item_charges" value="<?=$item_charges?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="gm" value="<?=$gm?>"></td>
            <td align="center" width="25%">
            <select name="inventory_slots">
              <?foreach($inventory_slots as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $slot)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>  
           </tr>
              </table><br><br>
        <center>
          <input type="hidden" name="stitid" value="<?=$id?>">
          <input type="submit" value="Submit Changes">
        </center>
      </form>
      </div>
      </div>