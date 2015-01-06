sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}
sub EVENT_ENTER {
my $Ancient = quest::saylink("Ancient", 1);
     quest::say("Halt! Do you seek The $Ancient Greenblood Piranha?");
 }
sub EVENT_SAY {
    if($text=~/Ancient/i) {
     quest::say("Very well I will summon him if you can prove to me that you are worthy of this fight.");
	 quest::say("Hand to me the item that proves you are indeed worthy.");
	 quest::settimer(48,1800);
  }
 }
sub EVENT_TIMER {
	quest::stoptimer(48); 
	quest::depop(48433);
	quest::depop(48437);
	quest::depop(48435);
	quest::depop(48434);
    quest::depopall(48438);   
	quest::depop();
	}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 52347 => 1)) { #Fatestealer 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(52347);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 52348 => 1)) { #Nightshade, Blade of entropy 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(52348);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119476 => 1)) { #Nightshade, Blade of entropy 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119476);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119492 => 1)) { ##Master Nightshade, Blade of entropy 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119492);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 62627 => 1)) { #Heartwood Blade 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(62627);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 62649 => 1)) { #Aurora The Heartwood Blade 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(62649);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119482 => 1)) { #Aurora The Heartwood Blade 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119482);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119498 => 1)) { #Master Aurora The Heartwood Blade 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119498);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 77631 => 1)) { #Prismatic Dragon Blade 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(77631);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 77640 => 1)) { #Blade of Vesagran 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(77640);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119479 => 1)) { #Blade of Vesagran 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119479);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119495 => 1)) { #Master Blade of Vesagran 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119495);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 57400 => 1)) { #Crafted talisman of the Fates 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(57400);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 57405 => 1)) { #Blessed Spiritstaff of the Heyokah 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(57405);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119470 => 1)) { #Blessed Spiritstaff of the Heyokah 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119470);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119486 => 1)) { #Master Blessed Spiritstaff of the Heyokah 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119486);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 62581 => 1)) { #Soulwhisper 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(62581);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 64067 => 1)) { #Deathwhisper 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(64067);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119474 => 1)) { #Deathwhisper 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119474);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119490 => 1)) { #Master Deathwhisper 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119490);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 19092 => 1)) { #Staff of Elemental Essence 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(19092);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 19839 => 1)) { #Focus of Primal Elements 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(19839);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119472 => 1)) { #Focus of Primal Elements 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119472);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119488 => 1)) { #Master Focus of Primal Elements 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119488);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 50003 => 1)) { #Innoruuk's Voice 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(50003);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 48136 => 1)) { #Innoruuk's Dark Blessing 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(48136);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119469 => 1)) { #Innoruuk's Dark blessing 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119469);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119485 => 1)) { #Master Innoruuk's Dark blessing 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119485);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 60321 => 1)) { #Champion's Sword of Eternal Power 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(60321);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 60332 => 1)) { #Kreljnok's Sword of Eternal Power 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(60332);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119475 => 1)) { #Kreljnok's Sword of Eternal Power 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119475);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119491 => 1)) { #Master Kreljnok's Sword of Eternal Power 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119491);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 64031 => 1)) { #Redemption 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(64031);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 48147 => 1)) { #Nightbane, Sword of the valiant 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(48147);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119480 => 1)) { #Nightbane, Sword of the Valiant 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119480);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119496 => 1)) { #Master Nightbane, Sword of the Valiant 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119496);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 52911 => 1)) { #Savage Lord's Totem 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(52911);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 57054 => 1)) { #Spiritcaller Totem of the Feral 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(57054);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119478 => 1)) { #spiritcaller Totem of the Feral 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119478);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119494 => 1)) { #Master Spiritcaller Totem of the Feral 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119494);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 52952 => 1)) { #Oculus of persuasion 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(52952);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 52962 => 1)) { #Staff of Eternal Eloquence 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(52962);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119473 => 1)) { #Staff of Eternal Eloquence 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119473);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119489 => 1)) { #Master Staff of Eternal Eloquence 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119489);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 62863 => 1)) { #Staff of living Brambles 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(62863);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 62880 => 1)) { #Staff of Everliving Brambles 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(62880);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119466 => 1)) { #Staff of living Brambles 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119466);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119483 => 1)) { #Master Staff of living Brambles 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119483);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 12665 => 1)){ #Staff of Prismatic Power 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(12665);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 16576 => 1)) { #Staff of Phenomenal Power 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(16576);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119471 => 1)) { #Staff of Phenomenal Power 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119471);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119487 => 1)) { #Master Staff of Phenomenal Power 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119487);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 61025 => 1)) { #Fistwraps of Celestial Discipline 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(61025);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 67742 => 1)) { #Transcended Fistwraps of Immortality 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(67742);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119477 => 1)) { #Transcended Fistwraps of Immortality 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119477);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119493 => 1)) { #Master Transcended Fistwraps of Immortality 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119493);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 9955 => 1)) { #Harmony of the Soul 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(9955);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 20076 => 1)) { #Aegis of Superior Divinity 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(20076);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119467 => 1)) { #Aegis of Superior Divinity 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119467);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119484 => 1)) { #Master Aegis of Superior Divinity 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(119484);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 18398 => 1)) { #Raging Taelosian Alloy Axe 1.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(18398);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 18609 => 1)) { #Vengeful Taelosian Blood Axe 2.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself."); 
quest::summonitem(18609);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119481 => 1)) { #Vengeful Taelosian Blood Axe 2.5 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119481);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
elsif(plugin::check_handin(\%itemcount, 119497 => 1)) { #Master Vengeful Taelosian Blood Axe 3.0 Epic
quest::say("Very well $name, You are indeed worthy, prepare yourself.");  
quest::summonitem(119497);  #returns Epic
quest::depopall(48247);
quest::depopall(48442);
quest::depopall(48441);
quest::depopall(48248);
quest::depopall(48243);
quest::depopall(48439);
quest::depopall(48038);
quest::depopall(48283);
quest::spawn2(48434,40,0,49.9,442,-129.1,0);
quest::spawn2(48835,39,0,46.8,393,-119.9,197.5);
quest::spawn2(48437,43,0,82,489.9,-125.1,0);
quest::spawn2(48433,39,0,46.9,393,-119.9,197.5);
quest::spawn2(48438,0,0,-7.4,429.2,-127.4,158.2);
quest::spawn2(48438,0,0,-6.3,386.7,-124.7,196.5);
quest::spawn2(48438,0,0,-60.1,420.4,-124.7,101.4);
quest::spawn2(48438,0,0,-49.3,370.3,-124.7,249.8);
}
else {
    $client->Message(14,"$name, This proves nothing! Take it back!");
    plugin::return_items(\%itemcount);
    return 1;
 }
}
