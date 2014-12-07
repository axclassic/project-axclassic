#Gatekeeper_Grog NPC ID 27146#
#Lavastorm to Broodlands Dark Reign camp#
#Gatekeeper_Dudley_Doright NPC ID 27147#
#Lavastorm to Broodlands Norrath Keepers camp#
sub EVENT_SAY {
   if($ulevel >= 21 && $text=~/Hail/i) {
     if ($faction >=5){
   quest::say("Stop! I am da gate keeper for da Dark Reign. Da Dark Reign is lookin fer the best of da best ta explore the new areas.");
   quest::say("Only dose dat can prove dat de be $worthy kin enter.");
 }
 else{
   quest::say("Glad your back $name! You kin pass.");
   quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
   }
   }
   if($text=~/worthy/i) {
 quest::say("We is in a race against time, Dose do gooders, Da Norrath Keepers and dere associates is also recruiting people to try and turn the inhabitants of the various areas to thier side.");
 quest::say("If'n youse let me to examine da item that makes you think you is worthy to assist us, I can send you to the Dark Reign camp in the Broodlands.");
 }
 }
 sub EVENT_ITEM {
 if($ulevel >= 21 && plugin::check_handin(\%itemcount, 52347 => 1)) { ##Fatestealer 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(52347);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 52348 => 1)) { #Nightshade, Blade of entropy 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(52348);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119476 => 1)) { #Nightshade, Blade of entropy 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119476);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 62627 => 1)) { #Heartwood Blade 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(62627);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 62649 => 1)) { #Aurora The Heartwood Blade 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(62649);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119482 => 1)) { #Aurora The Heartwood Blade 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119482);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 77631 => 1)) { #Prismatic Dragon Blade 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(77631);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 77640 => 1)) { #Blade of Vesagran 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(77640);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119479 => 1)) { #Blade of Vesagran 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119479);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 57400 => 1)) { #Crafted talisman of the Fates 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(57400);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 57405 => 1)) { #Blessed Spiritstaff of the Heyokah 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(57405);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119470 => 1)) { #Blessed Spiritstaff of the Heyokah 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119470);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 62581 => 1)) { #Soulwhisper 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(62581);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 64067 => 1)) { #Deathwhisper 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(64067);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119474 => 1)) { #Deathwhisper 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119474);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 19092 => 1)) { #Staff of Elemental Essence 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(19092);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 19839 => 1)) { #Focus of Primal Elements 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(19839);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119472 => 1)) { #Focus of Primal Elements 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119472);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119482 => 1)) { #Aurora The Heartwood Blade 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119482);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 50003 => 1)) { #Innoruuk's Voice 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(50003);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 48136 => 1)) { #Innoruuk's Dark Blessing 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(48136);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119469 => 1)) { #Innoruuk's Dark blessing 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119469);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 60321 => 1)) { #Champion's Sword of Eternal Power 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(60321);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 60332 => 1)) { #Kreljnok's Sword of Eternal Power 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(60332);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119475 => 1)) { #Kreljnok's Sword of Eternal Power 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119475);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 64031 => 1)) { #Redemption 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(64031);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 48147 => 1)) { #Nightbane, Sword of the valiant 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(48147);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119480 => 1)) { #Nightbane, Sword of the Valiant 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119480);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 52911 => 1)) { #Savage Lord's Totem 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(52911);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 57054 => 1)) { #Spiritcaller Totem of the Feral 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(57054);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119478 => 1)) { #spiritcaller Totem of the Feral 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119478);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 52952 => 1)) { #Oculus of persuasion 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(52952);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 52962 => 1)) { #Staff of Eternal Eloquence 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(52962);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119473 => 1)) { #Staff of Eternal Eloquence 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119473);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 62863 => 1)) { #Staff of living Brambles 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(62863);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 62880 => 1)) { #Staff of Everliving Brambles 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(62880);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119466 => 1)) { #Staff of living Brambles 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119466);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 12665 => 1)) { #Staff of Prismatic Power 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(12665);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 16576 => 1)) { #Staff of Phenomenal Power 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(16576);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119471 => 1)) { #Staff of Phenomenal Power 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119471);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 61025 => 1)) { #Fistwraps of Celestial Discipline 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(61025);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 67742 => 1)) { #Transcended Fistwraps of Immortality 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(67742);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119477 => 1)) { #Transcended Fistwraps of Immortality 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119477);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 9955 => 1)) { #Harmony of the Soul 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(9955);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 20076 => 1)) { #Aegis of Superior Divinity 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(20076);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119467 => 1)) { #Aegis of Superior Divinity 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(119467);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 18398 => 1)) { #Raging Taelosian Alloy Axe 1.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands."); 
quest::faction(2789,120);
quest::summonitem(18398);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 18609 => 1)) { #Vengeful Taelosian Blood Axe 2.0 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(18609);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
elsif($ulevel >= 21 && plugin::check_handin(\%itemcount, 119481 => 1)) { #Vengeful Taelosian Blood Axe 2.5 Epic
quest::say("Dats Gud enough fer me explorer, you kin go to da Broodlands.");
quest::faction(2789,120);
quest::summonitem(119481);  #returns Epic
quest::movepc(337,-413.4,1120.5,6.2); #Broodlands Dark Reign Camp
} 
else {
    $client->Message(14,"$name, This proves nothing! Take it back!");
    plugin::return_items(\%itemcount);
    return 1;
 }
}
   