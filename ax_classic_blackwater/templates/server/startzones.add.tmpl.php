<div class="table_container" style="width: 750px">
  <div class="edit_form_header">
    Add Start Zones Entry
  </div>
<div class="edit_form_content">
        <form name="add_start Zones Entry" method="post" action="index.php?editor=server&action=17">
    <table width="100%">
      <tr>
        <td align="center" width="20%"><strong>ID</strong></td>
        <td align="center" width="20%"><strong>Character Choice</strong></td>
        <td align="center" width="20%"><strong>Class</strong></td>
        <td align="center" width="20%"><strong>Deity</strong></td>
        <td align="center" width="20%"><strong>Race</strong></td>       
      </tr>
      <tr>
        <td align="center" width="20%">
          <input id="id" input type="text" name="start_id" size="10" value="<?=$suggest_start_id?>">
        </td>
        <td align="center" width="20%">
          <select name="player_choice">
            <?foreach($startzones as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%">
          <select name="player_class">
            <?foreach($player_classes as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%">
          <select name="player_deity">
            <?foreach($deities as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%">
          <select name="player_race">
            <?foreach($player_races as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
      </tr>
      <tr>
        <td align="center" width="20%"><strong>Start_Zone</strong></td>
        <td align="center" width="20%"><strong>Zone_ID</strong></td>
        <td align="center" width="20%"><strong>Start X</strong></td>
        <td align="center" width="20%"><strong>Start Y</strong></td>
        <td align="center" width="20%"><strong>Start Z</strong></td>       
      </tr>       
      <tr>
        <td align="center" width="20%">
          <select name="start_zone">
            <?foreach($startzones as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%">
          <select name="zone_id">
            <?foreach($startzones as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%"><input id="id" input type="text" name="start_x" size="10" value="0"></td>
        <td align="center" width="20%"><input id="id" input type="text" name="start_y" size="10" value="0"></td>
        <td align="center" width="20%"><input id="id" input type="text" name="start_z" size="10" value="0"></td>     
      </tr>
      <tr>
        <td align="center" width="20%"><strong>Select Rank</strong></td>
        <td align="center" width="20%"><strong>Bind Zone</strong></td>
        <td align="center" width="20%"><strong>Bind X</strong></td>
        <td align="center" width="20%"><strong>Bind Y</strong></td>
        <td align="center" width="20%"><strong>Bind Z</strong></td>       
      </tr>
      <tr>
        <td align="center" width="20%"><input id="id" input type="text" name="select_rank" size="10" value="50"></td>
        <td align="center" width="20%">
          <select name="bind_id">
            <?foreach($startzones as $k => $v):?>
              <option value="<?=$k?>"><?=$v?></option>
            <?endforeach;?>
          </select>
        </td>
        <td align="center" width="20%"><input id="id" input type="text" name="bind_x" size="10" value="0"></td>
        <td align="center" width="20%"><input id="id" input type="text" name="bind_y" size="10" value="0"></td>
        <td align="center" width="20%"><input id="id" input type="text" name="bind_z" size="10" value="0"></td>
      </tr>
		</table><br><br>
        <center>
          <input type="submit" name="Submit" value="Submit">
        </center>
      </form>
      </div>
      </div>
      
        