<? 
    $Warrior      = 1;
    $Cleric       = 2;
    $Paladin      = 4;
    $Ranger       = 8;
    $Shadowknight = 16;
    $Druid        = 32;
    $Monk         = 64;
    $Bard         = 128;
    $Rogue        = 256;
    $Shaman       = 512;
    $Necromancer  = 1024;
    $Wizard       = 2048;
    $Magician     = 4096;
    $Enchanter    = 8192;
    $Beastlord    = 16384;
    $Berserker    = 32768;
    $All          = 65535;
    
    $None         = 0;
    $Human        = 1;
    $Barbarian    = 2;
    $Erudite      = 4;
    $WoodElf      = 8;
    $HighElf      = 16;
    $DarkElf      = 32;
    $HalfElf      = 64;
    $Dwarf        = 128;
    $Troll        = 256;
    $Ogre         = 512;
    $Halfling     = 1024;
    $Gnome        = 2048;
    $Iksar        = 4096;
    $VahShir      = 8192;
    $Froglok      = 16384;
    $Drakkin      = 32768;
    
    //$Null       = 0;
    $Agnostic     = 1;
    $Bert         = 2;
    $Brell        = 4;
    $Cazic        = 8;
    $Erollisi     = 16;
    $Bristlebane  = 32;
    $Inny         = 64;
    $Karana       = 128;
    $MithMarr     = 256;
    $Prexus       = 512;
    $Quell        = 1024;
    $Rallos       = 2048;
    $Rodcet       = 4096;
    $SolRo        = 8192;
    $Trib         = 16384;
    $Tunare       = 32768;
    $Veeshan      = 65536;
    

?>    
    
    <div class="table_container">
       <div class="table_header">
         <div style="float:right">
           <a href="index.php?editor=items&action=4"><img src="images/add.gif" border=0 title="Add an Item"></a>
           <a href="index.php?editor=items&itemid=<?=$itemid?>&action=1"><img src="images/c_table.gif" border=0 title="Edit this Item"></a>
           <a onClick="return confirm('Really delete itemid <?=$itemid?>: (<?=$Name?>)?');" href="index.php?editor=items&itemid=<?=$itemid?>&action=2"><img src="images/table.gif" border=0 title="Delete this Item"></a>
                  </div>
         <?=$itemid?> - <?=$Name?> (Item Lore: <?=$lore?>)
       </div>
        <div class="table_content">
         <table cellspacing=0 border=0 width="100%">
           <tr>
             <td>
         <center>

         <h1><?=$Name?><br>
         (<?echo ($lore != $name ? "$lore" : '');?>)</h1><br>
        <table>
           <tr>
             <td>
         <fieldset>
         <legend><strong>Item Meta-Info</strong></legend>
          <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
              <td colspan="3" align="left"><strong>Name: </strong><?=$Name?>
              </td>
              </tr>
              <tr>
                <td colspan="3" align="left"><strong>Lore: </strong><?=$lore?>
                </td>
              </tr>
              <tr>
                <td colspan="3" align="left"><strong>Last Updated: </strong><?=$updated?>
                </td>
              </tr>
              <tr>
                <td colspan="3" align="left"><strong>Modified by: </strong><?=$modifiedby?>
                </td>
              </tr>
              <tr>
                <td colspan="3" align="left"><strong>Comment: </strong><?=$comment?>
                </td>
              </tr>
              <tr>
                <td align="left" width="33%">Weight <?=$weight?></td>
                <td align="left" width="33%">Type: <?=$itemtype?></td>
                <td align="left" width="33%">Item Class: <?=$itemclass?></td>
              </tr>
              <tr>
                <td align="left" width="33%">Price (cp):</td>
                <td align="left" width="33%"><?=$price?></td>
                <td align="left" width="33%">Sell Rate: <?=$sellrate?></td>
                
              </tr>
              <tr>
                <td colspan="3" align="left"><strong>Filename: </strong><?=$filename?>
                </td>
              </tr>
              <tr>
                <td align="left" width="33%">Icon: <?=$icon?></td>
                <td align="left" width="33%">Model: <?=$idfile?></td>
                <td align="left" width="33%">Book Type: <?=$booktype?></td>
              </tr>
              <tr>
                <td align="left" width="33%">Charm File: <?=$charmfile?></td>
                <td align="left" width="33%">Charm FileID: <?=$charmfileid?></td>
                <td align="left" width="33%">Slot 3 UNK2: <?=$augslot3unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 4 Vis: <?=$yesno[$augslot4visible]?></td>
                <td align="left" width="20%">Slot 4 Type: <?=$augslot4type?></td>
                <td align="left" width="20%">Slot 4 UNK2: <?=$augslot4unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 5 Vis: <?=$yesno[$augslot5visible]?></td>
                <td align="left" width="20%">Slot 5 Type: <?=$augslot5type?></td>
                <td align="left" width="20%">Min Status: <?=$minstatus?></td>
              </tr>
              </table>           
         
         </fieldset>
         <fieldset>
             <legend><strong>Augmentation</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="20%">Restrict: <?=$augrestrict?></td>
                <td align="left" width="20%">Aug Type: <?=$augtype?></td>
                <td align="left" width="20%">DistType: <?=$augdistiller?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 1 Vis: <?=$yesno[$augslot1visible]?></td>
                <td align="left" width="20%">Slot 1 Type: <?=$augslot1type?></td>
                <td align="left" width="20%">Slot 1 UNK2: <?=$augslot1unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 2 Vis: <?=$yesno[$augslot2visible]?></td>
                <td align="left" width="20%">Slot 2 Type: <?=$augslot2type?></td>
                <td align="left" width="20%">Slot 2 UNK2: <?=$augslot2unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 3 Vis: <?=$yesno[$augslot3visible]?></td>
                <td align="left" width="20%">Slot 3 Type: <?=$augslot3type?></td>
                <td align="left" width="20%">Slot 3 UNK2: <?=$augslot3unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 4 Vis: <?=$yesno[$augslot4visible]?></td>
                <td align="left" width="20%">Slot 4 Type: <?=$augslot4type?></td>
                <td align="left" width="20%">Slot 4 UNK2: <?=$augslot4unk2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Slot 5 Vis: <?=$yesno[$augslot5visible]?></td>
                <td align="left" width="20%">Slot 5 Type: <?=$augslot5type?></td>
                <td align="left" width="20%">Slot 5 UNK2: <?=$augslot5unk2?></td>
              </tr>
              </table>
            </fieldset>
            <fieldset>
             <legend><strong>Factions</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="50%">Faction1: <?=$factionmod1?></td>
                <td align="left" width="50%">Faction1 Adj: <?=$factionamt1?></td>
              </tr>
              <tr>
                <td align="left" width="50%">Faction2: <?=$factionmod2?></td>
                <td align="left" width="50%">Faction2 Adj: <?=$factionamt2?></td>
              </tr>
                            <tr>
                <td align="left" width="50%">Faction3: <?=$factionmod3?></td>
                <td align="left" width="50%">Faction3 Adj: <?=$factionamt3?></td>
              </tr>
                            <tr>
                <td align="left" width="50%">Faction4: <?=$factionmod4?></td>
                <td align="left" width="50%">Faction4 Adj: <?=$factionamt4?></td>
              </tr>
              </table>
            </fieldset>
        <td>
           <fieldset>
             <legend><strong>Classes</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
                              <td align="center" width="100%">
                <?if ($classes == $All):?>
                <div align="center">ALL</div>
                <?endif; ?>

                <?if (($classes & $Warrior) && ($classes != $All)) {
                  echo "Warrior <BR>";}?>
                <? if (($classes & $Cleric) && ($classes != $All)) {
                  echo "Cleric <BR>";}?>
                <? if (($classes & $Paladin) && ($classes != $All)) {
                  echo "Paladin <BR>";}?>
                <? if (($classes & $Ranger) && ($classes != $All)) {
                  echo "Ranger <BR>";}?>
                <? if (($classes & $Shadowknight) && ($classes != $All)) {
                echo "Shadowknight <BR>";}?>
                <? if (($classes & $Druid) && ($classes != $All)) {
                echo "Druid <BR>";}?>
                <? if (($classes & $Monk) && ($classes != $All)) {
                  echo "Monk <BR>";}?>
                <? if (($classes & $Bard) && ($classes != $All)) {
                  echo "Bard <BR>";}?>
                <? if (($classes & $Rogue) && ($classes != $All)) {
                  echo "Rogue <BR>";}?>
                <? if (($classes & $Shaman) && ($classes != $All)) {
                  echo "Shaman <BR>";}?>
                <? if (($classes & $Necromancer) && ($classes != $All)) {
                echo "Necromancer <BR>";}?>
                <? if (($classes & $Wizard) && ($classes != $All)) {
                echo "Wizard <BR>";}?>
                <? if (($classes & $Magician) && ($classes != $All)) {
                  echo "Magician <BR>";}?>
                <? if (($classes & $Enchanter) && ($classes != $All)) {
                  echo "Enchanter <BR>";}?>
                <? if (($classes & $Beastlord) && ($classes != $All)) {
                echo "Beastlord <BR>";}?>
                <? if (($classes & $Berserker) && ($classes != $All)) {
                echo "Berserker <BR>";}?>
                <? if (($classes == 0) && ($classes != $All)) {
                echo "NONE";}?>
                                                                 
                

              </tr>
             </table>
           </fieldset>
                     <fieldset>
             <legend><strong>Races</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="center" width="100%">
                <?if ($races == $All):?>
                <div align="center">ALL</div>
                <?endif; ?>

                <?if (($races & $Human) && ($races != $All)) {
                  echo "Human<BR>";}?>
                <? if (($races & $Barbarian) && ($races != $All)) {
                  echo "Barbarian<BR>";}?>
                <? if (($races & $Erudite) && ($races != $All)) {
                  echo "Erudite<BR>";}?>
                <? if (($races & $WoodElf) && ($races != $All)) {
                  echo "Wood Elf<BR>";}?>
                <? if (($races & $HighElf) && ($races != $All)) {
                echo "High Elf<BR>";}?>
                <? if (($races & $DarkElf) && ($races != $All)) {
                echo "Dark Elf<BR>";}?>
                <? if (($races & $HalfElf) && ($races != $All)) {
                  echo "Half Elf<BR>";}?>
                <? if (($races & $Dwarf) && ($races != $All)) {
                  echo "Dwarf<BR>";}?>
                <? if (($races & $Troll) && ($races != $All)) {
                  echo "Troll<BR>";}?>
                <? if (($races & $Ogre) && ($races!= $All)) {
                  echo "Ogre<BR>";}?>
                <? if (($races & $Halfling) && ($races != $All)) {
                echo "Halfling<BR>";}?>
                <? if (($races & $Gnome) && ($races != $All)) {
                echo "Gnome<BR>";}?>
                <? if (($races & $Iksar) && ($races != $All)) {
                  echo "Iksar<BR>";}?>
                <? if (($races & $VahShir) && ($races != $All)) {
                  echo "Vah Shir<BR>";}?>
                <? if (($races & $Froglok) && ($races != $All)) {
                echo "Froglok<BR>";}?>
                <? if (($races & $Drakkin) && ($races != $All)) {
                echo "Drakkin<BR>";}?>
                <? if ((($races == 0) || ($races == 65536)) && ($races != $All)) {
                echo "NONE";}?>
                                                                 
                </td>
                <td>
                
                </td>
              </tr>
             </table>
           </fieldset> 
                                <fieldset>
             <legend><strong>Deities</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="Center" width="100%">
                <?if ($deity == $None):?>
                <div align="center">N/A</div>
                <?endif; ?>

                <?if (($deity & $Agnostic) && ($deity != $None)) {
                  echo "Agnostic<BR>";}?>
                <? if (($deity & $Bert) && ($deity != $None)) {
                  echo "Bertoxxulous<BR>";}?>
                <? if (($deity & $Brell) && ($deity != $None)) {
                  echo "Brell Serilis<BR>";}?>
                <? if (($deity & $Cazic) && ($deity != $None)) {
                  echo "Cazic-Thule<BR>";}?>
                <? if (($deity & $Erollisi) && ($deity != $None)) {
                echo "Erollisi Marr<BR>";}?>
                <? if (($deity & $Bristlebane) && ($deity != $None)) {
                echo "Bristlebane<BR>";}?>
                <? if (($deity & $Inny) && ($deity != $None)) {
                  echo "Innoruuk<BR>";}?>
                <? if (($deity & $Karana) && ($deity != $None)) {
                  echo "Karana<BR>";}?>
                <? if (($deity & $MithMarr) && ($deity != $None)) {
                  echo "Mithaniel Marr<BR>";}?>
                <? if (($deity & $Prexus) && ($deity != $None)) {
                  echo "Prexus<BR>";}?>
                <? if (($deity & $Quell) && ($deity != $None)) {
                echo "Quellious<BR>";}?>
                <? if (($deity & $Rallos) && ($deity != $None)) {
                echo "Rallos Zek<BR>";}?>
                <? if (($deity & $Rodcet) && ($deity != $None)) {
                  echo "Rodcet Nife<BR>";}?>
                <? if (($deity & $SolRo) && ($deity != $None)) {
                  echo "Solusek Ro<BR>";}?>
                <? if (($deity & $Trib) && ($deity != $None)) {
                echo "The Tribunal<BR>";}?>
                <? if (($deity & $Tunare) && ($deity != $None)) {
                echo "Tunare<BR>";}?>
                <? if (($deity & $Veeshan) && ($deity != $None)) {
                echo "Veeshan<BR>";}?>
                                                                 
                </td>
                <td>
                
                </td>
              </tr>
             </table>
           </fieldset>         
           <fieldset>
             <legend><strong>Flags</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="20%">Artifact Flag: <?=$yesno[$artifactflag]?></td>
                <td align="left" width="20%">Magic Item: <?=$yesno[$magic]?></td>
                <td align="left" width="20%">Loregroup: <?=$loregroup?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Summoned: <?=$yesno[$summonedflag]?></td>
                <td align="left" width="20%">Tradeskill Item: <?=$yesno[$tradeskills]?></td>
                <td align="left" width="20%">Attuneable: <?=$yesno[$attuneable]?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Not For Pets: <?=$yesno[$nopet]?></td>
                <td align="left" width="20%">Book: <?=$yesno[$book]?></td>
                <td align="left" width="20%">: <?=$walkspeed?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Weather: <?=$weathertype[$weather]?></td>
                <td align="left" width="20%">Note: <?=$note?></td>
                <td align="left" width="20%">&nbsp;</td>
              </tr>
              </table>
           </fieldset>
           
           <fieldset>
             <legend><strong>Stats</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="20%">Damage <?=$damage?></td>
                <td align="left" width="20%">Delay <?=$delay?></td>
                <td align="left" width="20%">CHA: <?=$acha?></td>
              </tr>
              <tr>
                <td align="left" width="20%">AC: <?=$ac?></td>
                <td align="left" width="20%">AGI: <?=$aagi?></td>
                <td align="left" width="20%">CHA: <?=$acha?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Accuracy: <?=$accuracy?></td>
                <td align="left" width="20%">DEX: <?=$adex?></td>
                <td align="left" width="20%">INT: <?=$aint?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Attack: <?=$attack?></td>
                <td align="left" width="20%">STA: <?=$asta?></td>
                <td align="left" width="20%">STR: <?=$astr?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Avoidance: <?=$avoidance?></td>
                <td align="left" width="20%">WIS: <?=$awis?></td>
                <td align="left" width="20%">Instrument: <?=$bardtype?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Racial Bane: <?=$banedmgrace?></td>
                <td align="left" width="20%">Racial Bane DMG: <?=$banedmgraceamt?></td>
                <td align="left" width="20%">Bard Bonus: <?=$bardvalue?></td>
              </tr>
                <tr>
                <td align="left" width="20%">BodytypeBane DMG: <?=$banedmgamt?></td>
                <td align="left" width="20%">Bodytype Bane: <?=$banedmgbody?></td>
                <td align="left" width="20%">: <?=$bardvalue?></td>
              </tr>                            
              </table>
           </fieldset>
           <fieldset>
             <legend><strong>Storage</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="33%">Potion Belt Slot: <?=$yesno[$potionbelt]?></td>
                <td align="left" width="33%">Magic Item: <?=$yesno[$magic]?></td>
                <td align="left" width="33%">Loregroup: <?=$loregroup?></td>
              </tr>
              <tr>
                <td align="left" width="33%">Summoned: <?=$yesno[$summonedflag]?></td>
                <td align="left" width="33%">Tradeskill Item: <?=$yesno[$tradeskills]?></td>
                <td align="left" width="33%">Attuneable: <?=$yesno[$attuneable]?></td>
              </tr>
                <tr>
                <td align="left" width="33%">Stackable: <?=$stackable?></td>
                <td align="left" width="33%">Exp: <?=$zone_exp_multiplier?></td>
                <td align="left" width="33%">Bag weight%: <?=$bagwr?>%</td>
              </tr>
                <tr>
                <td align="left" width="33%">Bag Type: <?=$bagtype?></td>
                <td align="left" width="33%">Bag Slots: <?=$bagslots?></td>
                <td align="left" width="33%">Bag Size: <?=$bagsize?></td>
              </tr>
              </table>
           </fieldset>
                      <fieldset>
             <legend><strong>Effects</strong></legend>
             <table width="100%" border="0" cellpadding="3" cellspacing="0">
              <tr>
                <td align="left" width="20%">Click Cast(ms): <?=$casttime?></td>
                <td align="left" width="20%">Click Type: <?=$clicktype?></td>
                <td align="left" width="20%">Click Effect: <?=$clickeffect?></td>
                <td align="left" width="20%">Click ReqLevel: <?=$clicklevel2?></td>
              </tr>
              <tr>
                <td align="left" width="20%">Combat: <?=$combateffects?></td>
                <td align="left" width="20%">Tradeskill Item: <?=$yesno[$tradeskills]?></td>
                <td align="left" width="20%">Attuneable: <?=$yesno[$attuneable]?></td>
              </tr>
                <tr>
                <td align="left" width="20%">Stackable: <?=$stackable?></td>
                <td align="left" width="20%">Exp: <?=$zone_exp_multiplier?></td>
                <td align="left" width="20%">Walkspeed: <?=$walkspeed?></td>
              </tr>
              </table>
           </fieldset>