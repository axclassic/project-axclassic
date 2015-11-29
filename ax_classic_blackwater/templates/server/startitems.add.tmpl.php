<div class="table_container" style="width: 750px">
      <div class="edit_form_header">
        Add Starting Equipment
      </div>
      <div class="edit_form_content">
        <form name="add_starting_items" method="post" action="index.php?editor=server&action=11">
          <table width="100%">
          <tr>
            <td align="center" width="20%"><STRONG>ID</STRONG></td>
            <td align="center" width="20%"><STRONG>Race</STRONG></td>
            <td align="center" width="20%"><STRONG>Class</STRONG></td>
            <td align="center" width="20%"><STRONG>Deity</STRONG></td>
            <td align="center" width="20%"><STRONG>Zone</STRONG></td>         
          </tr>
          <tr>
          <td align="center" width="20%"><input id="id" input type="text" name="stitid" size="10" value="<?=$suggeststitid?>"></td>
          <td align="center" width="20%">
			<select name="player_races">
				<?foreach($player_races as $k => $v):?>
					<option value="<?=$k?>"><?=$v?></option>
				<?endforeach;?>
            </select>
		</td>
          <td align="center" width="20%">
			<select name="player_classes">
				<?foreach($player_classes as $k => $v):?>
					<option value="<?=$k?>"><?=$v?></option>
				<?endforeach;?>
            </select>
          </td>
          <td align="center" width="20%">
			<select name="deities">
				<?foreach($deities as $k => $v):?>
					<option value="<?=$k?>"><?=$v?></option>
				<?endforeach;?>
			</select>
          </td>
          <td align="center" width="20%">
			<select name="startzones">
				<?foreach($startzones as $k => $v):?>
					<option value="<?=$k?>"><?=$v?></option>
				<?endforeach;?>
			</select>
          </td>
          </tr>
           <tr>
            <td align="center" width="25%"><STRONG>Item ID</STRONG></td>
            <td align="center" width="25%"><STRONG>Charges/Stack</STRONG></td>
            <td align="center" width="25%"><STRONG>GM Only</STRONG></td>
            <td align="center" width="25%"><STRONG>Slot</STRONG></td>        
          </tr>         
          <tr>
			<td align="center" width="25%"><input id="id" input type="text" name="itemid" size="10" value="13106"></td>
			<td align="center" width="25%"><input id="id" input type="text" name="item_charges" size="10" value="1"></td>
			<td align="center" width="25%"><input id="id" input type="text" name="gm" size="10" value="0"></td>     
			<td align="center" width="25%">
				<select name="inventory_slots">
					<?foreach($inventory_slots as $k => $v):?>
						<option value="<?=$k?>"><?=$v?></option>
					<?endforeach;?>
				</select>
			</td>
		</tr>
		</table><br><br>
        <center>
          <input type="submit" name="Submit" value="Submit">
        </center>
      </form>
      </div>
      </div>
      
