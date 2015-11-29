      <div class="table_container" style="width: 750px;">
      <div class="table_header">
        <table width="100%" cellpadding="0" cellspacing="0">
          <tr>
           <td>Start Zone Entries</td>
           <td align="right">    
          <a href="index.php?editor=server&action=16"><img src="images/add.gif" border="0" title="Add New Start Zone Entry"></a>
            </td>
           </tr>        
         </table>
      </div>

       <table class="table_content2" width="100%">
<? if (isset($start_zones)):?>
         <tr>
          <td align="center" width="4%"><strong>ID</strong></td>
          <td align="center" width="7%"><strong>X</strong></td>
          <td align="center" width="7%"><strong>Y</strong></td>
          <td align="center" width="8%"><strong>Z</strong></td>
          <td align="center" width="7%"><strong>Zone</strong></td>
         <!-- <td align="center" width="7%"><strong>Start_Zone</strong></td>-->
          <td align="center" width="7%"><strong>Char Choice</strong></td>
          <td align="center" width="9%"><strong>Class</strong></td>
          <td align="center" width="9%"><strong>Deity</strong></td>
          <td align="center" width="8%"><strong>Race</strong></td>
          <!-- <td align="center" width="7%"><strong>Bound</strong></td>
          <td align="center" width="7%"><strong>Bind X</strong></td>
          <td align="center" width="7%"><strong>Bind Y</strong></td>
          <td align="center" width="7%"><strong>Bind Z</strong></td>-->
         </tr>
<?$asdf=0; foreach($start_zones as $start_zones=>$v):?>
        <tr bgcolor="#<? echo ($asdf % 2 == 0) ? "AAAAAA" : "BBBBBB";?>">
          <td align="center" width="4%"><?=$v['start_id']?></td>
          <td align="center" width="7%"><?=$v['start_x']?></td>
          <td align="center" width="7%"><?=$v['start_y']?></td>
          <td align="center" width="8%"><?=$v['start_z']?></td>
          <td align="center" width="7%"><?=$startzones[($v['zone_id'])]?></td>
          
          <td align="center" width="7%"><?=$startzones[($v['player_choice'])]?></td>
          <td align="center" width="9%"><?=$player_classes[($v['player_class'])]?></td>
          <td align="center" width="9%"><?=$deities[($v['player_deity'])]?></td>
          <td align="center" width="8%"><?=$player_races[($v['player_race'])]?></td>
          <!--<td align="center" width="7%"></td>
          <td align="center" width="7%"></td>
          <td align="center" width="7%"></td>
          <td align="center" width="7%"></td>-->

          <td align="right" width="5%">      
            <a href="index.php?editor=server&start_id=<?=$v['start_id']?>&action=13"><img src="images/edit2.gif" border="0" title="Edit Entry <?=$v['start_id']?>?"></a>          
            <a onClick="return confirm('Really Delete Starting Item <?=$v['start_id']?>?');" href="index.php?editor=server&start_id=<?=$v['start_id']?>&action=15"><img src="images/remove3.gif" border="0" title="Delete this entry"></a>
          </td>
        </tr>
        <?$asdf++; endforeach;?>
        </table>
        <?endif;?>
<? if (!isset($start_zones)):?>
        <tr>
          <td align="left" width="100" style="padding: 10px;">No Start Zone Entries Found In Database<br><strong>Note:</b> If the <em>start_zones</em> table is truly empty, the server will use hard-coded defaults.<br> If the <em>start_zones</em> table has entries, and they don't appear here, there's a problem with this page. Submit a /bug or report it in the forums.</td>
        </tr>
<?endif;?>