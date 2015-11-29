<div class="edit_form" style="width: 750px">
      <div class="edit_form_header">
        Edit Starting Locations <?=$id?>
      </div>

      <div class="edit_form_content">
        <form name="edit_start_zone_entries" method="post" action="index.php?editor=server&action=14">
        <table width="100%">
          <tr>
            <td align="center" width="25%"><strong>Creation Choice</strong></td>
            <td align="center" width="25%"><strong>Class</strong></td>
            <td align="center" width="25%"><strong>Deity</strong></td>
            <td align="center" width="25%"><strong>Race</strong></td>       
          </tr>
          <tr>
              <td align="center" width="25%">
            <select name="player_choice">
              <?foreach($startzones as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $player_choice)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
             <td align="center" width="25%">
            <select name="player_class">
              <?foreach($player_classes as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $player_class)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%">
            <select name="player_deity">
              <?foreach($deities as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $player_deity)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
             <td align="center" width="25%">
                <select name="player_race">
                    <?foreach($player_races as $key=>$value):?>
                      <option value="<?=$key?>"<?echo ($key == $player_race)? " selected" : "";?>><?=$value?></option>
                    <?endforeach;?>
                 </select>
            </td>
          </tr>

          <tr>
          <td align="center" width="25%"><strong>Zone</strong></td>
          <td align="center" width="25%"><strong>Start X</strong></td>
          <td align="center" width="25%"><strong>Start Y</strong></td>
          <td align="center" width="25%"><strong>Start Z</strong></td>       
          </tr>
          <tr>
            <td align="center" width="25%">
            <select name="zone_id">
              <?foreach($startzones as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $zone_id)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%"><input type="text" size="7" name="start_x" value="<?=$start_x?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="start_y" value="<?=$start_y?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="start_z" value="<?=$start_z?>"></td>
          </tr>

          <tr>
          <td align="center" width="25%"><strong>Bind Zone</strong></td>
          <td align="center" width="25%"><strong>Bind X</strong></td>
          <td align="center" width="25%"><strong>Bind Y</strong></td>
          <td align="center" width="25%"><strong>Bind Z</strong></td>       
          </tr>
          <tr>
            <td align="center" width="25%">
            <select name="bind_id">
              <?foreach($startzones as $key=>$value):?>
                   <option value="<?=$key?>"<?echo ($key == $bind_id)? " selected" : "";?>><?=$value?></option>
              <?endforeach;?>
                 </select>
            </td>
            <td align="center" width="25%"><input type="text" size="7" name="bind_x" value="<?=$bind_x?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="bind_y" value="<?=$bind_y?>"></td>
            <td align="center" width="25%"><input type="text" size="7" name="bind_z" value="<?=$bind_z?>"></td>
          </tr>
          <tr>

              </table><br><br>
        <center>
          <input type="hidden" name="start_id" value="<?=$start_id?>">
          <input type="hidden" name="select_rank" value="<?=$select_rank?>">
          <input type="hidden" name="start_zone" value="<?=$start_zone?>">
          <input type="submit" value="Submit Changes">
        </center>
      </form>
      </div>
      </div>