      <div class="table_container" style="width: 750px;">
      <div class="table_header">
        <table width="100%" cellpadding="0" cellspacing="0">
          <tr>
           <td>Starting Items</td>
           <td align="right">    
          <a href="index.php?editor=server&action=10"><img src="images/add.gif" border="0" title="Add starting equipment"></a>
            </td>
           </tr>        
         </table>
      </div>

       <table class="table_content2" width="100%">
<? if (isset($startitems)):?>
         <tr>
          <td align="center" width="2%"><strong>ID</strong></td>
          <td align="center" width="3%"><strong>Race</strong></td>
          <td align="center" width="3%"><strong>Class</strong></td>
          <td align="center" width="3%"><strong>Deity</strong></td>
          <td align="center" width="3%"><strong>Zone</strong></td>
          <td align="center" width="15%"><strong>Item</strong></td>
          <td align="center" width="3%"><strong>Charges</strong></td>
          <td align="center" width="2%"><strong>GM</strong></td>
          <td align="center" width="6%"><strong>Slot ID</strong></td>
          <th width="5%"></th>
         </tr>
<?$x=0; foreach($startitems as $startitems=>$v):?>
        <tr bgcolor="#<? echo ($x % 2 == 0) ? "AAAAAA" : "BBBBBB";?>">
          <td align="center" width="2%"><?=$v['stitid']?></td>
<?if($v['race'] < 1):?>
          <td align="center" width="3%">Any</td>
<?endif;?>
<?if($v['race'] > 0):?>
          <td align="center" width="3%"><?=$player_races[($v['race'])]?></td>
<?endif;?>
<?if($v['class'] < 1):?>
          <td align="center" width="3%">Any</td>
<?endif;?>
<?if($v['class'] > 0):?>
          <td align="center" width="3%"><?=$player_classes[($v['class'])]?></td>
<?endif;?>
<?if($v['deityid'] < 1):?>
          <td align="center" width="3%">Any</td>
<?endif;?>
<?if($v['deityid'] > 0):?>
          <td align="center" width="3%"><?=$deities[($v['deityid'])]?></td>
<?endif;?>
<?if($v['zoneid'] < 1):?>
          <td align="center" width="3%">Any</td>
<?endif;?>
<?if($v['zoneid'] > 0):?>
          <td align="center" width="3%"><?=getZoneName($v['zoneid'])?></td>
<?endif;?>
<?if($v['itemid'] < 1):?>  
          <td align="center" width="15%"><?=$v['itemid']?></td> 
<?endif;?>
<?if($v['itemid'] > 0):?>  
          <td align="center" width="15%"> <span><a href="http://lucy.allakhazam.com/item.html?id=<?=$v['itemid']?>"><?=get_item_name($v['itemid'])?></a></span></td>
<?endif;?>
          <td align="center" width="3%"><?=$v['item_charges']?></td> 
          <td align="center" width="2%"><?=$v['gm']?></td> 
<?if($v['slot'] < 0 ):?>
          <td align="center" width="6%">First Avail</td>
<?endif;?>
<?if($v['slot'] > -1 ):?>
          <td align="center" width="6%"><?=$inventory_slots[($v['slot'])]?></td>
<?endif;?>
          <td align="right">      
            <a href="index.php?editor=server&stitid=<?=$v['stitid']?>&action=7"><img src="images/edit2.gif" border="0" title="Edit Entry"></a>          
            <a onClick="return confirm('Really Delete Starting Item <?=$v['stitid']?>?');" href="index.php?editor=server&stitid=<?=$v['stitid']?>&action=9"><img src="images/remove3.gif" border="0" title="Delete this entry"></a>
          </td>
        </tr>
        <?$x++; endforeach;?>
        </table>
        <?endif;?>
<? if (!isset($startitems)):?>
        <tr>
          <td align="left" width="100" style="padding: 10px;">No Starting Items Found In Database</td>
        </tr>
<?endif;?>